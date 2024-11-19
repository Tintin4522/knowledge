<?php

namespace App\Entity;

use App\Repository\CoursesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CoursesRepository::class)]
class Courses
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(targetEntity: Themes::class, inversedBy: 'courses')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Themes $theme = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column]
    private ?float $price = null;

    /**
     * @var Collection<int, Lessons>
     */
    #[ORM\OneToMany(targetEntity: Lessons::class, mappedBy: 'courses_id', orphanRemoval: true)]
    private Collection $lessons;

    /**
     * @var Collection<int, OrderItems>
     */
    #[ORM\OneToMany(targetEntity: OrderItems::class, mappedBy: 'course_id')]
    private Collection $orderItems;

    /**
     * @var Collection<int, UserCourses>
     */
    #[ORM\OneToMany(targetEntity: UserCourses::class, mappedBy: 'course_id', orphanRemoval: true)]
    private Collection $userCourses;

    public function __construct()
    {
        $this->lessons = new ArrayCollection();
        $this->orderItems = new ArrayCollection();
        $this->userCourses = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTheme(): ?Themes
    {
        return $this->theme;
    }

    public function setTheme(?Themes $theme): static
    {
        $this->theme = $theme;

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

    /**
     * @return Collection<int, Lessons>
     */
    public function getLessons(): Collection
    {
        return $this->lessons;
    }

    public function addLesson(Lessons $lesson): static
    {
        if (!$this->lessons->contains($lesson)) {
            $this->lessons->add($lesson);
            $lesson->setCoursesId($this);
        }

        return $this;
    }

    public function removeLesson(Lessons $lesson): static
    {
        if ($this->lessons->removeElement($lesson)) {
            // set the owning side to null (unless already changed)
            if ($lesson->getCoursesId() === $this) {
                $lesson->setCoursesId(null);
            }
        }

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
            $orderItem->setCourse($this);
        }

        return $this;
    }

    public function removeOrderItem(OrderItems $orderItem): static
    {
        if ($this->orderItems->removeElement($orderItem)) {
            // set the owning side to null (unless already changed)
            if ($orderItem->getCourse() === $this) {
                $orderItem->setCourse(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, UserCourses>
     */
    public function getUserCourses(): Collection
    {
        return $this->userCourses;
    }

    public function addUserCourse(UserCourses $userCourse): static
    {
        if (!$this->userCourses->contains($userCourse)) {
            $this->userCourses->add($userCourse);
            $userCourse->setCourseId($this);
        }

        return $this;
    }

    public function removeUserCourse(UserCourses $userCourse): static
    {
        if ($this->userCourses->removeElement($userCourse)) {
            // set the owning side to null (unless already changed)
            if ($userCourse->getCourseId() === $this) {
                $userCourse->setCourseId(null);
            }
        }

        return $this;
    }
}
