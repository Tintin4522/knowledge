<?php

namespace App\Controller;

use App\Entity\Courses;
use App\Entity\Lessons;
use App\Entity\Order;
use App\Entity\OrderItems;
use App\Repository\CoursesRepository;
use App\Repository\LessonsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;


class ShopController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/shop', name: 'shop_index')]
    public function index(CoursesRepository $coursesRepo, LessonsRepository $lessonsRepo, EntityManagerInterface $entityManager): Response {

        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        // Retrieve logged in user
        $user = $this->getUser();
    
        // Collect all courses and lessons
        $courses = $coursesRepo->findAll();
        $lessons = $lessonsRepo->findAll();
    
        // Retrieve user commands
        $orderRepo = $entityManager->getRepository(Order::class);
        $purchasedItems = $orderRepo->findBy(['user_id' => $user]);
    
        // Extract IDs from purchased courses and lessons
        $purchasedCourses = [];
        $purchasedLessons = [];
        foreach ($purchasedItems as $item) {
            if ($item->getItemType() === 'course' && $item->getCourseId()) {
                $purchasedCourses[] = $item->getCourseId();
            } elseif ($item->getItemType() === 'lesson' && $item->getLessonId()) {
                $purchasedLessons[] = $item->getLessonId();
            }
        }
    
        return $this->render('shop/shop.html.twig', [
            'courses' => $courses,
            'lessons' => $lessons,
            'purchasedCourses' => $purchasedCourses,
            'purchasedLessons' => $purchasedLessons,
            'userRoles' => $this->getUser()->getRoles(),
        ]);
    }
    

    #[Route('/shop/acheter/{type}/{id}', name: 'shop_buy')]
    public function buy(
        string $type,
        int $id,
        EntityManagerInterface $entityManager,
        UserInterface $user
    ): Response {
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        if ($type === 'course') {
            $product = $entityManager->getRepository(Courses::class)->find($id);
        } elseif ($type === 'lesson') {
            $product = $entityManager->getRepository(Lessons::class)->find($id);
        } else {
            return $this->redirectToRoute('shop_index');
        }

        if (!$product) {
            throw $this->createNotFoundException('Produit non trouvé.');
        }

        // Create new Order
        $order = new Order();
        $order->setUserId($user);
        $order->setCreatedAt(new \DateTimeImmutable()); 

        $entityManager->persist($order);
        $entityManager->flush();

        // Create an order item for each product purchased
        $orderItem = new OrderItems();


        // Add the product to the order item based on its type
        if ($type === 'course') {
            $orderItem->setItemType('course');
            $orderItem->setCourse($product);
        } elseif ($type === 'lesson') {
            $orderItem->setItemType('lesson');
            $orderItem->setLesson($product);
        }

        $orderItem->setQuantity(1); // default quantity
        $orderItem->setPrice($product->getPrice());
        $orderItem->setTotal($product->getPrice());

        // Persist the orderItem
        $entityManager->persist($orderItem);
        $entityManager->flush();

        $this->addFlash('success', 'Votre commande a bien été enregistrée !');

        return $this->redirectToRoute('shop_index');
    }

    #[Route('/shop/add/{type}/{id}', name: 'shop_add_to_cart')]
    public function addToCart($type, $id, SessionInterface $session)
    {
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('login');
        }
    
        $cart = $session->get('cart', []);  
        
        if ($type === 'course') {
            $course = $this->entityManager->getRepository(Courses::class)->find($id);

            if ($course) {
                $cart['courses'][$id] = [
                    'name' => $course->getName(),
                    'price' => $course->getPrice(),
                    'quantity' => 1,
                    'course' => $course,
                ];

                $cartItem = new OrderItems();
                $cartItem->setCourse($course);
                $cartItem->setItemType('course');
                $cartItem->setPrice($course->getPrice());
                $cartItem->setQuantity(1); 
                $this->entityManager->persist($cartItem);
                $this->entityManager->flush();

                $cart['courses'][$id]['order_item_id'] = $cartItem->getId();
            }
        } elseif ($type === 'lesson') {
            $lesson = $this->entityManager->getRepository(Lessons::class)->find($id);

            if ($lesson) {
                $cart['lessons'][$id] = [
                    'name' => $lesson->getName(),
                    'price' => $lesson->getPrice(),
                    'content' => $lesson->getContent(),
                    'quantity' => 1,
                    'lesson' => $lesson,
                ];

                $cartItem = new OrderItems();
                $cartItem->setLesson($lesson);
                $cartItem->setItemType('lesson');
                $cartItem->setPrice($lesson->getPrice());
                $cartItem->setQuantity(1);  
                $cartItem->setContent($lesson->getContent());
                $this->entityManager->persist($cartItem);
                $this->entityManager->flush();

                $cart['lessons'][$id]['order_item_id'] = $cartItem->getId();
            }
        }
    
        $session->set('cart', $cart);
        
        return $this->redirectToRoute('cart_view');
    }

    #[Route('/course/{id}/follow', name: 'follow_course')]
    public function followCourse(Courses $course): Response
    {
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        return $this->render('courses/show.html.twig', [
            'course' => $course,
        ]);
    }

    #[Route('/lesson/{id}/follow', name: 'follow_lesson', requirements: ['id' => '\d+'])]
    public function followLesson(Lessons $lesson = null): Response
    {
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        if (!$lesson) {
            throw $this->createNotFoundException('La leçon demandée est introuvable.');
        }
    
        return $this->render('lessons/show.html.twig', [
            'lesson' => $lesson,
        ]);
    }
    

}