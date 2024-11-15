<?php

namespace App\Entity;

use App\Repository\LessonsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LessonsRepository::class)]
class Lessons
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $lesson_id = null;

    #[ORM\ManyToOne(targetEntity: Courses::class, inversedBy: 'lessons')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Courses $courses_id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column]
    private ?float $price = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $content = null;

    /**
     * @var Collection<int, OrderItems>
     */
    #[ORM\OneToMany(targetEntity: OrderItems::class, mappedBy: 'lesson_id')]
    private Collection $orderItems;

    /**
     * @var Collection<int, LessonCompletion>
     */
    #[ORM\OneToMany(targetEntity: LessonCompletion::class, mappedBy: 'lesson', orphanRemoval: true)]
    private Collection $lessonCompletions;

    public function __construct()
    {
        $this->orderItems = new ArrayCollection();
        $this->lessonCompletions = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->lesson_id;
    }

    public function getCourse(): ?Courses
    {
        return $this->courses_id;
    }

    public function setCourse(?Courses $course): self
    {
        $this->courses_id = $course;

        return $this;
    }


    public function getLessonId(): ?int
    {
        return $this->lesson_id;
    }

    public function getCoursesId(): ?Courses
    {
        return $this->courses_id;
    }

    public function setCoursesId(?Courses $courses_id): static
    {
        $this->courses_id = $courses_id;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): static
    {
        $this->price = $price;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(?string $content): static
    {
        $this->content = $content;

        return $this;
    }

    /**
     * @return Collection<int, OrderItems>
     */
    public function getOrderItems(): Collection
    {
        return $this->orderItems;
    }

    public function addOrderItem(OrderItems $orderItem): static
    {
        if (!$this->orderItems->contains($orderItem)) {
            $this->orderItems->add($orderItem);
            $orderItem->setLesson($this);
        }

        return $this;
    }

    public function removeOrderItem(OrderItems $orderItem): static
    {
        if ($this->orderItems->removeElement($orderItem)) {
            // set the owning side to null (unless already changed)
            if ($orderItem->getLesson() === $this) {
                $orderItem->setLesson(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, LessonCompletion>
     */
    public function getLessonCompletions(): Collection
    {
        return $this->lessonCompletions;
    }

    public function addLessonCompletion(LessonCompletion $lessonCompletion): static
    {
        if (!$this->lessonCompletions->contains($lessonCompletion)) {
            $this->lessonCompletions->add($lessonCompletion);
            $lessonCompletion->setLessonId($this);
        }

        return $this;
    }

    public function removeLessonCompletion(LessonCompletion $lessonCompletion): static
    {
        if ($this->lessonCompletions->removeElement($lessonCompletion)) {
            // set the owning side to null (unless already changed)
            if ($lessonCompletion->getLessonId() === $this) {
                $lessonCompletion->setLessonId(null);
            }
        }

        return $this;
    }
}
