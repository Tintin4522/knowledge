<?php

namespace App\Controller;

use App\Entity\Themes;
use App\Entity\Courses;
use App\Entity\Lessons;
use App\Form\ThemeType;
use App\Form\CourseType;
use App\Form\LessonType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'admin_dashboard')]
    public function adminDashboard()
    {
        return $this->render('admin/dashboard.html.twig');
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
            return $this->redirectToRoute('admin_theme_add'); // Redirige vers la même page ou vers une autre
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
}
