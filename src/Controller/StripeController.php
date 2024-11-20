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
    
        // Calcul du total
        $total = $this->calculateTotal($cart);
        $totalFormatted = intval($total * 100); // Stripe attend le montant en centimes
        
        if ($totalFormatted <= 0) {
            throw new \Exception('Le total doit être supérieur à zéro.');
        }
    
        // Initialiser Stripe
        Stripe::setApiKey($this->stripeSecretKey);
    
        // Créer une session Stripe
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
    
        // Passer le sessionId à la page de paiement
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
    
        // Vérifie que le panier n'est pas vide
        if (empty($cart)) {
            return $this->redirectToRoute('shop_index');
        }
    
        // Récupère tous les éléments de OrderItems qui sont dans le panier
        $orderItemsRepo = $entityManager->getRepository(OrderItems::class);
        $orderItemsList = $orderItemsRepo->findBy(['order' => null]); // Récupérer les éléments sans commande associée
    
        // Créer un Order pour chaque élément de OrderItems
        foreach ($orderItemsList as $orderItem) {
            $order = new Order();
            $order->setUserId($user); // Associe l'utilisateur
            $order->setCreatedAt(new \DateTimeImmutable()); // Définir la date de création
    
            // Copier les informations de OrderItems vers Order
            $order->setItemType($orderItem->getItemType()); // Copier le type de l'élément (course ou lesson)
                
            // Récupérer le lesson_id ou le course_id via les entités associées
                if ($orderItem->getLesson()) {
                    $order->setLessonId($orderItem->getLesson()->getId());
                }

                if ($orderItem->getCourse()) {
                    $order->setCourseId($orderItem->getCourse()->getId());
                }
    
            // Persiste la commande dans la base de données
            $entityManager->persist($order);
    
            // Supprime l'élément OrderItem après avoir copié ses données dans Order
            $entityManager->remove($orderItem);
        }
    
        // Finaliser la persistance de toutes les commandes et les suppressions
        $entityManager->flush();
    
        // Vider le panier après la validation du paiement
        $session->remove('cart');
    
        // Redirige vers la page de confirmation avec l'ID de la dernière commande créée
        return $this->redirectToRoute('shop_index', ['orderId' => $order->getId()]);
    }
    

    #[Route('/cart/payment/cancel', name: 'payment_cancel')]
    public function paymentCancel(): Response
    {
        return $this->render('shop/cancel.html.twig');
    }

    // Fonction de calcul du total
    private function calculateTotal(array $cart): float
    {
        $total = 0;

        foreach ($cart['courses'] ?? [] as $courseId => $course) {
            $total += $course['price'];  // Le prix de chaque cours
        }
        
        foreach ($cart['lessons'] ?? [] as $lessonId => $lesson) {
            $total += $lesson['price'];  // Le prix de chaque leçon
        }

        return $total;
    }
}
