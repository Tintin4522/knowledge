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
use Symfony\Component\Security\Http\Attribute\IsGranted;

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
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        $lesson = $lessonsRepository->find($lessonId);
        
        if (!$lesson) {
            return $this->redirectToRoute('shop_index');
        }

        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('login'); 
        }

        $existingCompletion = $lessonCompletionRepository->findOneBy([
            'user' => $user,
            'lesson' => $lesson,
        ]);

        if ($existingCompletion) {
            $existingCompletion->setCompleted(true);
        } else {
            $completion = new LessonCompletion();
            $completion->setUser($user);
            $completion->setLessonId($lesson);
            $completion->setCompleted(true);

            $em->persist($completion);
        }

        $em->flush();

        return $this->redirectToRoute('follow_lesson', ['id' => $lessonId]);
    }

    #[Route('/course/{courseId}/complete', name: 'complete_course', methods: ['POST'])]
    public function completeCourse(
        int $courseId,
        CoursesRepository $coursesRepository,
        CourseCompletionRepository $courseCompletionRepository,
        EntityManagerInterface $em
    ): Response {
        
        if (!$this->isGranted('ROLE_CLIENT') && !$this->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Vous n\'avez pas les droits nécessaires pour accéder à cette page.');
        }

        $course = $coursesRepository->find($courseId);
        
        if (!$course) {
            return $this->redirectToRoute('shop_index');
        }

        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('login');
        }

        $existingCompletion = $courseCompletionRepository->findOneBy([
            'user' => $user,
            'course' => $course,
        ]);

        if ($existingCompletion) {
            $existingCompletion->setCompleted(true);
        } else {
            $completion = new CourseCompletion();
            $completion->setUser($user);
            $completion->setCourseId($course);
            $completion->setCompleted(true);

            $em->persist($completion);
        }

        $em->flush();

        return $this->redirectToRoute('follow_course', ['id' => $courseId]);
    }

    #[Route('/completions', name: 'completion_list')]
    public function completion_list(LessonCompletionRepository $lessonCompletionRepository, CourseCompletionRepository $courseCompletionRepository): Response
    {
        if (!$this->isGranted('IS_AUTHENTICATED_FULLY')) {
            throw $this->createAccessDeniedException('Vous devez être connecté pour accéder à cette page.');
        }
        
        $courseCompletions = [];
        $lessonCompletions = [];
        if ($this->isGranted('ROLE_ADMIN')) {
            // If user is admin, load data for all users
            $courseCompletions = $courseCompletionRepository->findAll();  
            $lessonCompletions = $lessonCompletionRepository->findAll();  

            return $this->render('admin/completion_users.html.twig', [
                'courseCompletions' => $courseCompletions,
                'lessonCompletions' => $lessonCompletions,
            ]);
        } elseif ($this->isGranted('ROLE_CLIENT')) {
            // If the user is a client user, load their own data
            $user = $this->getUser();
            $courseCompletions = $courseCompletionRepository->findBy(['user' => $user]);
            $lessonCompletions = $lessonCompletionRepository->findBy(['user' => $user]);
        }

        return $this->render('completion/completion.html.twig', [
            'courseCompletions' => $courseCompletions,
            'lessonCompletions' => $lessonCompletions,
        ]);
    }
}


