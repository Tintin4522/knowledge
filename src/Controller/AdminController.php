<?php

namespace App\Controller;

use App\Entity\Themes;
use App\Entity\Courses;
use App\Entity\Lessons;
use App\Form\ThemeType;
use App\Form\CourseType;
use App\Form\LessonType;
use App\Repository\CoursesRepository;
use App\Repository\LessonsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/admin', name: 'admin_dashboard')]
    public function index(CoursesRepository $coursesRepo, LessonsRepository $lessonsRepo): Response
    {
        $courses = $coursesRepo->findAll();  // Récupère tous les cursus
        $lessons = $lessonsRepo->findAll();  // Récupère toutes les leçons
    
        // Tableau pour associer chaque cursus avec ses leçons
        $groupedLessonsByCourse = [];
    
        // Regroupe les leçons par cursus
        foreach ($lessons as $lesson) {
            $courseId = $lesson->getCourse()->getId(); 
            if (!isset($groupedLessonsByCourse[$courseId])) {
                $groupedLessonsByCourse[$courseId] = []; 
            }
            $groupedLessonsByCourse[$courseId][] = $lesson;  // Ajoute la leçon au tableau du cours
        }
        
        // Vérifie si un cours a des leçons, si ce n'est pas le cas, assigne une valeur vide
        foreach ($courses as $course) {
            if (!isset($groupedLessonsByCourse[$course->getId()])) {
                $groupedLessonsByCourse[$course->getId()] = [];  
            }
        }
    
        return $this->render('admin/dashboard.html.twig', [
            'courses' => $courses,
            'groupedLessonsByCourse' => $groupedLessonsByCourse,
        ]);
    }

    #[Route('/admin/theme/add', name: 'admin_theme_add')]
    public function addTheme(Request $request, EntityManagerInterface $em)
    {
        $theme = new Themes();
        $form = $this->createForm(ThemeType::class, $theme);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($theme);
            $em->flush();

            $this->addFlash('success', 'Le thème a été ajouté avec succès.');
            return $this->redirectToRoute('admin_theme_add');
        }

        return $this->render('admin/theme_add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/admin/course/add', name: 'admin_course_add')]
    public function addCourse(Request $request, EntityManagerInterface $em)
    {
        $course = new Courses();
        $form = $this->createForm(CourseType::class, $course);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($course);
            $em->flush();

            $this->addFlash('success', 'Le cursus a été ajouté avec succès.');
            return $this->redirectToRoute('admin_course_add');
        }

        return $this->render('admin/course_add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/admin/lesson/add', name: 'admin_lesson_add')]
    public function addLesson(Request $request, EntityManagerInterface $em)
    {
        $lesson = new Lessons();
        $form = $this->createForm(LessonType::class, $lesson);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($lesson);
            $em->flush();

            $this->addFlash('success', 'La leçon a été ajoutée avec succès.');
            return $this->redirectToRoute('admin_lesson_add');
        }

        return $this->render('admin/lesson_add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/admin/course/edit/{id}', name: 'admin_course_edit')]
    public function editCourse(Courses $course, Request $request, EntityManagerInterface $em)
    {
        $form = $this->createForm(CourseType::class, $course);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Cursus modifié avec succès!');
            return $this->redirectToRoute('admin_dashboard');
        }

        return $this->render('admin/course_edit.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/admin/lesson/edit/{id}', name: 'admin_lesson_edit')]
    public function editLesson(Lessons $lesson, Request $request, EntityManagerInterface $em)
    {
        $form = $this->createForm(LessonType::class, $lesson);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Leçon modifiée avec succès!');
            return $this->redirectToRoute('admin_dashboard');
        }

        return $this->render('admin/lesson_edit.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/course/delete/{id}", name:"admin_course_delete")]
    public function deleteCourse($id)
    {
        $course = $this->entityManager->getRepository(Courses::class)->find($id);

        if (!$course) {
            throw $this->createNotFoundException('Cours introuvable.');
        }

        $this->entityManager->remove($course);
        $this->entityManager->flush();

        return $this->redirectToRoute('admin_dashboard');
    }

    #[Route("/lesson/delete/{id}", name:"admin_lesson_delete")]
    public function deleteLesson($id)
    {
        $lesson = $this->entityManager->getRepository(Lessons::class)->find($id);

        if (!$lesson) {
            throw $this->createNotFoundException('Leçon introuvable.');
        }

        $this->entityManager->remove($lesson);
        $this->entityManager->flush();

        return $this->redirectToRoute('admin_dashboard');
    }

}
