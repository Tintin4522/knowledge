<?php

namespace App\Entity;

use App\Repository\CourseCompletionRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CourseCompletionRepository::class)]
class CourseCompletion
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $completion_id = null;

    #[ORM\ManyToOne(targetEntity: Users::class, inversedBy: 'courseCompletions')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Users $user = null;

    #[ORM\ManyToOne(targetEntity: Courses::class, inversedBy: 'courseCompletions')]
    #[ORM\JoinColumn(name: "course_id", referencedColumnName: "id", nullable: false)]
    private ?Courses $course = null;

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

    public function getCourse(): ?Courses
    {
        return $this->course;
    }

    public function setCourseId(?Courses $course): static
    {
        $this->course = $course;

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
