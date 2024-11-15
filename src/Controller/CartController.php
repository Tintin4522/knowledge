<?php

namespace App\Controller;

use App\Entity\Courses;
use App\Entity\Lessons;
use App\Service\CartService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class CartController extends AbstractController
{
    private $cartService;
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/cart', name: 'cart_view')]
    public function viewCart(): Response
    {
        $cart = $this->cartService->getCart();
        $total = $this->cartService->getTotal();

        return $this->render('cart/view.html.twig', [
            'cart' => $cart,
            'total' => $total,
        ]);
    }

    #[Route('/cart/add/{type}/{id}', name: 'cart_add')]
    public function addToCart($type, $id): Response
    {
        // Trouver l'item correspondant en fonction du type
        if ($type === 'course') {
            $item = $this->entityManager->getRepository(Courses::class)->find($id);
        } elseif ($type === 'lesson') {
            $item = $this->entityManager->getRepository(Lessons::class)->find($id);
        } else {
            throw $this->createNotFoundException('Type invalide');
        }

        // Si l'item n'existe pas, afficher un message d'erreur
        if (!$item) {
            $this->addFlash('error', 'L\'article demandé n\'existe pas.');
            return $this->redirectToRoute('shop');
        }

        // Ajouter au panier
        $this->cartService->addToCart($item, $type);
        $this->addFlash('success', 'L\'article a été ajouté au panier');

        return $this->redirectToRoute('cart_view');
    }

    #[Route('/cart/remove/{type}/{id}', name: 'cart_remove')]
    public function removeFromCart($type, $id): Response
    {
        $this->cartService->removeFromCart($id, $type);
        $this->addFlash('success', 'L\'article a été supprimé du panier');
        
        return $this->redirectToRoute('cart_view');
    }

    #[Route('/cart/checkout', name: 'cart_checkout')]
    public function checkout(): Response
    {
        // Récupérer l'utilisateur connecté
        $user = $this->getUser();
        
        // Si l'utilisateur n'est pas connecté, rediriger vers la page de login
        if (!$user) {
            $this->addFlash('error', 'Vous devez être connecté pour passer une commande.');
            return $this->redirectToRoute('login');
        }

        // Créer la commande avec l'utilisateur connecté
        $this->cartService->createOrder($user);

        // Vider le panier
        $this->cartService->clearCart();
        $this->addFlash('success', 'Votre commande a été passée avec succès.');

        return $this->redirectToRoute('cart_view');
    }
}
