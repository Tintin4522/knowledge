<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\OrderItems;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_CLIENT')]
class StripeController extends AbstractController
{
    private string $stripeSecretKey;

    public function __construct(string $stripeSecretKey)
    {
        $this->stripeSecretKey = $stripeSecretKey;
    }

    #[Route('/cart/checkout', name: 'cart_checkout')]
    public function checkout(EntityManagerInterface $em, RequestStack $requestStack): Response
    {
        $user = $this->getUser();
        $session = $requestStack->getSession();
        $cart = $session->get('cart', []);
        
        if (empty($cart)) {
            return $this->redirectToRoute('cart');
        }
    
        $total = $this->calculateTotal($cart);
        $totalFormatted = intval($total * 100);
        
        if ($totalFormatted <= 0) {
            throw new \Exception('Le total doit être supérieur à zéro.');
        }
    
        Stripe::setApiKey($this->stripeSecretKey);
    
        $checkoutSession = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' => 'Paiement de votre panier',
                    ],
                    'unit_amount' => $totalFormatted,
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => $this->generateUrl('payment_success', [], 0),
            'cancel_url' => $this->generateUrl('payment_cancel', [], 0),
        ]);
    
        return $this->render('shop/paiment.html.twig', [
            'sessionId' => $checkoutSession->id
        ]);
    }
    

    #[Route('/cart/payment/success', name: 'payment_success')]
    public function paymentSuccess(EntityManagerInterface $entityManager, RequestStack $requestStack): Response
    {
        $user = $this->getUser();
        $session = $requestStack->getSession();
        $cart = $session->get('cart', []);
    
        if (empty($cart)) {
            return $this->redirectToRoute('shop_index');
        }

        $orderItemsRepo = $entityManager->getRepository(OrderItems::class);
        $orderItemsList = $orderItemsRepo->findBy(['order' => null]); 

        foreach ($orderItemsList as $orderItem) {
            $order = new Order();
            $order->setUserId($user); 
            $order->setCreatedAt(new \DateTimeImmutable()); 
    
            $order->setItemType($orderItem->getItemType()); 
                
                if ($orderItem->getLesson()) {
                    $order->setLessonId($orderItem->getLesson()->getId());
                }

                if ($orderItem->getCourse()) {
                    $order->setCourseId($orderItem->getCourse()->getId());
                }
    
            $entityManager->persist($order);
    
            $entityManager->remove($orderItem);
        }

        $entityManager->flush();
    
        $session->remove('cart');
    
        return $this->redirectToRoute('shop_index', ['orderId' => $order->getId()]);
    }
    

    #[Route('/cart/payment/cancel', name: 'payment_cancel')]
    public function paymentCancel(): Response
    {
        return $this->render('shop/cancel.html.twig');
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
