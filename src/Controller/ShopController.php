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
use Symfony\Component\HttpFoundation\Request;
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
    public function index(CoursesRepository $coursesRepo, LessonsRepository $lessonsRepo): Response
    {
        $courses = $coursesRepo->findAll();  // Récupère tous les cursus
        $lessons = $lessonsRepo->findAll();  // Récupère toutes les leçons

        return $this->render('shop/shop.html.twig', [
            'courses' => $courses,
            'lessons' => $lessons,
        ]);
    }

    #[Route('/shop/acheter/{type}/{id}', name: 'shop_buy')]
    public function buy(
        string $type,
        int $id,
        EntityManagerInterface $entityManager,
        UserInterface $user
    ): Response {
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

        // Créer une nouvelle commande
        $order = new Order();
        $order->setUserId($user);
        $order->setCreatedAt(new \DateTimeImmutable());
        $order->setTotalAmount((string) $product->getPrice());  // Montant total de la commande

        $entityManager->persist($order);
        $entityManager->flush();

        // Créer un article de commande pour chaque produit acheté
        $orderItem = new OrderItems();
        $orderItem->setOrder($order);

        // Ajouter le produit à l'article de commande en fonction de son type
        if ($type === 'course') {
            $orderItem->setItemType('course');
            $orderItem->setCourse($product);
        } elseif ($type === 'lesson') {
            $orderItem->setItemType('lesson');
            $orderItem->setLesson($product);
        }

        // Ajouter la quantité, le prix et le total
        $orderItem->setQuantity(1); // Quantité par défaut (si tu veux gérer un panier, tu peux modifier cela)
        $orderItem->setPrice($product->getPrice());
        $orderItem->setTotal($product->getPrice());

        // Persist the orderItem
        $entityManager->persist($orderItem);
        $entityManager->flush();

        $this->addFlash('success', 'Votre commande a bien été enregistrée !');

        // Redirige vers la page des commandes (ou une page de confirmation de paiement)
        return $this->redirectToRoute('shop_index');
    }

        #[Route('/shop/add/{type}/{id}', name: 'shop_add_to_cart')]
    public function addToCart($type, $id, SessionInterface $session)
    {
        $cart = $session->get('cart', []);  // Récupère le panier (ou un tableau vide si aucun panier)
        
        if ($type === 'course') {
            $course = $this->entityManager->getRepository(Courses::class)->find($id);
            // Ajouter le cursus au panier
            $cart['courses'][$id] = [
                'name' => $course->getName(),
                'price' => $course->getPrice(),
                'quantity' => 1,
            ];
        } elseif ($type === 'lesson') {
            $lesson = $this->entityManager->getRepository(Lessons::class)->find($id);
            // Ajouter la leçon au panier
            $cart['lessons'][$id] = [
                'name' => $lesson->getName(),
                'price' => $lesson->getPrice(),
                'quantity' => 1,
            ];
        }

        // Sauvegarder le panier dans la session
        $session->set('cart', $cart);
        
        // Rediriger vers la boutique ou la page de paiement
        return $this->redirectToRoute('shop_boutique');
    }

}
