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
        ->add('name', null, [
            'label' => 'N° de leçon : ', 
            'attr' => [
                'placeholder' => 'Leçon n°',
            ],
        ])
        ->add('price', null, [
            'label' => 'Prix de la leçon : ', 
        ])
            ->add('content', null, [
                'label' => 'Titre du cours : ',
            ])
            ->add('learn', null, [
                'label' => 'Contenu du cours : ',
                'attr' => [
                    'rows' => 5,
                ],
            ])
            ->add('courses_id', EntityType::class, [
                'class' => Courses::class,
                'choice_label' => function (Courses $course) {
                    return $course->getName() . ' (' . $course->getTheme()->getName() . ')';
                },
                'label' => 'Rattaché au cours :',
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
