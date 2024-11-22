<?php

namespace App\Entity;

use App\Repository\LessonCompletionRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LessonCompletionRepository::class)]
class LessonCompletion
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $completion_id = null;

    #[ORM\ManyToOne(targetEntity: Users::class, inversedBy: 'lessonCompletions')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Users $user = null;

    #[ORM\ManyToOne(targetEntity: Lessons::class,inversedBy: 'lessonCompletions')]
    #[ORM\JoinColumn(name: "lesson_id", referencedColumnName: "lesson_id", nullable: false)]
    private ?Lessons $lesson = null;

    #[ORM\Column]
    private ?bool $is_completed = null;

    public function getId(): ?int
    {
        return $this->completion_id;
    }

    public function getUser(): ?Users
    {
        return $this->user;
    }
    
    public function setUser(?Users $user): static
    {
        $this->user = $user;
    
        return $this;
    }
    

    public function getLessonId(): ?Lessons
    {
        return $this->lesson;
    }

    public function setLessonId(?Lessons $lesson): static
    {
        $this->lesson = $lesson;

        return $this;
    }

    public function isCompleted(): ?bool
    {
        return $this->is_completed;
    }

    public function setCompleted(bool $is_completed): static
    {
        $this->is_completed = $is_completed;

        return $this;
    }
}
