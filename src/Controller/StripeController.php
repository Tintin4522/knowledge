<?php

namespace App\Controller;

use App\Entity\UserLessons;
use App\Entity\UserCourses;
use App\Entity\Courses;
use App\Entity\Lessons;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class StripeController extends AbstractController
{
    private $stripePublicKey;
    private $stripeSecretKey;
    private $entityManager;

    public function __construct(ParameterBagInterface $params, EntityManagerInterface $entityManager)
    {
        // Récupérer les clés Stripe depuis le fichier .env
        $this->stripePublicKey = $params->get('STRIPE_PUBLIC_KEY');
        $this->stripeSecretKey = $params->get('STRIPE_SECRET_KEY');
        $this->entityManager = $entityManager;
    }

    #[Route('/shop/checkout', name: 'shop_checkout')]
    public function checkout(SessionInterface $session): Response
    {
        // Récupérer le panier depuis la session
        $cart = $session->get('cart', []);
        $lineItems = [];

        // Ajouter les cours du panier à la session Stripe
        foreach ($cart['courses'] ?? [] as $courseId => $course) {
            $lineItems[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' => $course['name'],
                    ],
                    'unit_amount' => $course['price'] * 100, // Stripe attend des montants en cents
                ],
                'quantity' => 1, // Chaque élément est unique
            ];
        }

        // Ajouter les leçons du panier à la session Stripe
        foreach ($cart['lessons'] ?? [] as $lessonId => $lesson) {
            $lineItems[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' => $lesson['name'],
                    ],
                    'unit_amount' => $lesson['price'] * 100, // Stripe attend des montants en cents
                ],
                'quantity' => 1, // Chaque élément est unique
            ];
        }

        // Initialiser Stripe avec la clé secrète
        Stripe::setApiKey($this->stripeSecretKey);

        // Créer une session de paiement Stripe
        $sessionStripe = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => $lineItems,
            'mode' => 'payment',
            'success_url' => $this->generateUrl('shop_success', [], 0),
            'cancel_url' => $this->generateUrl('shop_cancel', [], 0),
        ]);

        // Rediriger l'utilisateur vers la page de paiement Stripe
        return $this->redirect($sessionStripe->url);
    }

    #[Route('/shop/success', name: 'shop_success')]
    public function success(SessionInterface $session): Response
    {
        // Récupérer le panier depuis la session
        $cart = $session->get('cart', []);

        // Enregistrer les achats dans la base de données
        foreach ($cart['courses'] ?? [] as $courseId => $course) {
            $userCourse = new UserCourses();
            $userCourse->setUserId($this->getUser());
            $userCourse->setCourseId($this->entityManager->getRepository(Courses::class)->find($courseId));
            $userCourse->setStatus('paid'); // Statut payé
            $userCourse->setDateAchat(new \DateTime());
            $this->entityManager->persist($userCourse);
        }

        foreach ($cart['lessons'] ?? [] as $lessonId => $lesson) {
            $userLesson = new UserLessons();
            $userLesson->setUserId($this->getUser());
            $userLesson->setLessonId($this->entityManager->getRepository(Lessons::class)->find($lessonId));
            $userLesson->setStatus('paid'); // Statut payé
            $userLesson->setDateAchat(new \DateTime());
            $this->entityManager->persist($userLesson);
        }

        // Sauvegarder dans la base de données
        $this->entityManager->flush();

        // Vider le panier
        $session->remove('cart');

        return $this->render('shop/success.html.twig');
    }

    #[Route('/shop/cancel', name: 'shop_cancel')]
    public function cancel(): Response
    {
        return $this->render('shop/cancel.html.twig');
    }
}