<?php

namespace App\Controller;

use App\Entity\Courses;
use App\Entity\Lessons;
use App\Entity\Order;
use App\Entity\OrderItems;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class CartController extends AbstractController
{
    private $entityManager;
    private $requestStack;

    public function __construct(EntityManagerInterface $entityManager, RequestStack $requestStack)
    {
        $this->entityManager = $entityManager;
        $this->requestStack = $requestStack;
    }

    #[Route('/cart', name: 'cart_view')]
    public function viewCart(SessionInterface $session)
    {
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        $cart = $session->get('cart', []);
        
        $total = $this->calculateTotal($cart);
        
        return $this->render('cart/view.html.twig', [
            'cart' => $cart,
            'total' => $total,
        ]);
    }

    #[Route('/cart/remove/{id}', name: 'cart_remove')]
    public function removeFromCart($id, SessionInterface $session, EntityManagerInterface $em): Response
    {
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        $cart = $session->get('cart', []);
    
        foreach ($cart as $type => $items) {
            foreach ($items as $key => $item) {
                if (isset($item['order_item_id']) && $item['order_item_id'] == $id) {
                    $orderItem = $em->getRepository(OrderItems::class)->find($id);
                    if ($orderItem) {
                        $em->remove($orderItem);
                        $em->flush();
                    }
    
                    unset($cart[$type][$key]);
    
                    $session->set('cart', $cart);
    
                    $this->addFlash('success', 'Article supprimé du panier.');
                    return $this->redirectToRoute('cart_view');
                }
            }
        }
    
        $this->addFlash('error', 'Article introuvable.');
        return $this->redirectToRoute('cart_view');
    }
    

    #[Route('/cart/checkout', name: 'cart_checkout')]
    public function checkout(EntityManagerInterface $em, RequestStack $requestStack): Response
    {
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }
        
        $user = $this->getUser();
        $session = $requestStack->getSession();
        $cart = $session->get('cart', []);
        
        if (empty($cart)) {
            return $this->redirectToRoute('cart');
        }
    
        $total = $this->calculateTotal($cart);
        $totalFormatted = number_format($total, 2, '.', '');
    
        if (empty($total) || $total <= 0) {
            throw new \Exception('Le total de la commande ne peut pas être nul ou égal à zéro.');
        }
    
        $order = new Order();
        $order->setUserId($user);
        $order->setCreatedAt(new \DateTimeImmutable()); 
    
        foreach ($cart as $type => $items) {
            foreach ($items as $item) {
                $orderItem = new OrderItems();
                $orderItem->setPrice($item['price']);
                $orderItem->setQuantity(1); 
        
                if ($item['price'] === null || $item['price'] <= 0) {
                    throw new \Exception('Le prix de l\'article est invalide.');
                }
        
                if ($orderItem->getQuantity() === null || $orderItem->getQuantity() <= 0) {
                    throw new \Exception('La quantité de l\'article est invalide.');
                }
        
                $totalItem = $item['price'] * $orderItem->getQuantity();
                if ($totalItem <= 0) {
                    throw new \Exception('Le total de l\'article est invalide.');
                }
                $orderItem->setTotal(number_format($totalItem, 2, '.', ''));
        
                if ($type === 'course') {
                    $orderItem->setCourse($item['course']);
                    $orderItem->setItemType('course');
                } elseif ($type === 'lesson') {
                    $orderItem->setLesson($item['lesson']);
                    $orderItem->setItemType('lesson');
                }
        
                $em->persist($orderItem);
            }
        }
    
        $em->persist($order);
        $em->flush();
    
        $session->set('cart', []);
    
        return $this->redirectToRoute('order_confirmation', ['orderId' => $order->getId()]);
    }

    private function calculateTotal(array $cart): float
    {
        $total = 0;

        foreach ($cart['courses'] ?? [] as $courseId => $course) {
            $total += $course['price'];  
        }
        
        foreach ($cart['lessons'] ?? [] as $lessonId => $lesson) {
            $total += $lesson['price']; 
        }

        return $total;
    }
}