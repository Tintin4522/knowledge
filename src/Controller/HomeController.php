<?php

namespace App\Controller;

use App\Entity\LessonCompletion;
use App\Entity\Lessons;
use App\Repository\LessonCompletionRepository;
use App\Repository\LessonsRepository;
use App\Entity\CourseCompletion;
use App\Entity\Courses;
use App\Repository\CourseCompletionRepository;
use App\Repository\CoursesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }

    #[Route('/lesson/{lessonId}/complete', name: 'complete_lesson', methods: ['POST'])]
    public function completeLesson(int $lessonId, LessonsRepository $lessonsRepository, LessonCompletionRepository $lessonCompletionRepository, EntityManagerInterface $em): Response
    {
        // Récupérer la leçon
        $lesson = $lessonsRepository->find($lessonId);
        
        if (!$lesson) {
            return $this->redirectToRoute('shop_index');
        }

        // Récupérer l'utilisateur connecté
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('login'); // ou page d'erreur
        }

        // Vérifier si l'utilisateur a déjà marqué cette leçon comme complétée
        $existingCompletion = $lessonCompletionRepository->findOneBy([
            'user' => $user,
            'lesson' => $lesson,
        ]);

        if ($existingCompletion) {
            // Si déjà complétée, mettre à jour le statut
            $existingCompletion->setCompleted(true);
        } else {
            // Sinon, créer une nouvelle entrée dans LessonCompletion
            $completion = new LessonCompletion();
            $completion->setUserId($user);
            $completion->setLessonId($lesson);
            $completion->setCompleted(true);

            // Persister l'objet dans la base de données
            $em->persist($completion);
        }

        // Sauvegarder les changements
        $em->flush();

        // Retourner à la page de suivi de la leçon
        return $this->redirectToRoute('follow_lesson', ['id' => $lessonId]);
    }

    #[Route('/course/{courseId}/complete', name: 'complete_course', methods: ['POST'])]
    public function completeCourse(
        int $courseId,
        CoursesRepository $coursesRepository,
        CourseCompletionRepository $courseCompletionRepository,
        EntityManagerInterface $em
    ): Response {
        // Récupérer le cursus
        $course = $coursesRepository->find($courseId);
        
        if (!$course) {
            // Si le cursus n'existe pas, rediriger vers la boutique
            return $this->redirectToRoute('shop_index');
        }

        // Récupérer l'utilisateur connecté
        $user = $this->getUser();
        if (!$user) {
            // Si l'utilisateur n'est pas connecté, rediriger vers la page de connexion
            return $this->redirectToRoute('login');
        }

        // Vérifier si l'utilisateur a déjà marqué ce cursus comme complété
        $existingCompletion = $courseCompletionRepository->findOneBy([
            'user' => $user,
            'course' => $course,
        ]);

        if ($existingCompletion) {
            // Si déjà complété, mettre à jour le statut
            $existingCompletion->setCompleted(true);
        } else {
            // Sinon, créer une nouvelle entrée dans CourseCompletion
            $completion = new CourseCompletion();
            $completion->setUserId($user);
            $completion->setCourseId($course);
            $completion->setCompleted(true);

            // Persister l'objet dans la base de données
            $em->persist($completion);
        }

        // Sauvegarder les changements
        $em->flush();

        // Retourner à la page de suivi du cursus
        return $this->redirectToRoute('follow_course', ['id' => $courseId]);
    }

    #[Route('/completions', name: 'completion_list')]
    public function completion_list(LessonCompletionRepository $lessonCompletionRepository, CourseCompletionRepository $courseCompletionRepository): Response
    {
        // Récupérer les complétions de leçons de l'utilisateur connecté
        $lessonCompletions = $lessonCompletionRepository->findBy(['user' => $this->getUser()]);
    
        // Récupérer les complétions de cursus de l'utilisateur connecté
        $courseCompletions = $courseCompletionRepository->findBy(['user' => $this->getUser()]);
    
        return $this->render('completion/completion.html.twig', [
            'lessonCompletions' => $lessonCompletions,
            'courseCompletions' => $courseCompletions,
        ]);
    }
}


