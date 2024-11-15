<?php

namespace App\Form;

use App\Entity\Courses;
use App\Entity\Lessons;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class LessonType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('price')
            ->add('content')
            ->add('courses_id', EntityType::class, [
                'class' => Courses::class,
                'choice_label' => function (Courses $course) {
                    return $course->getName() . ' (' . $course->getTheme()->getName() . ')';
                },
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Lessons::class,
        ]);
    }
}
