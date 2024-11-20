<?php

namespace App\Entity;

use App\Repository\OrderItemsRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrderItemsRepository::class)]
class OrderItems
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $order_item_id = null;

    #[ORM\Column(length: 20)]
    private ?string $item_type = null;

    #[ORM\ManyToOne(targetEntity: Lessons::class, inversedBy: 'orderItems')]
    #[ORM\JoinColumn(name: "lesson_id", referencedColumnName: "lesson_id", nullable: true)]
    private ?Lessons $lesson = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $content = null;

    #[ORM\ManyToOne(targetEntity: Courses::class, inversedBy: 'orderItems')]
    #[ORM\JoinColumn(name: "course_id", referencedColumnName: "id", nullable: true)]
    private ?Courses $course = null;

    #[ORM\Column]
    private ?int $quantity = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $price = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2, options: ["default" => 0])]
    private ?string $total = "0.00";

    #[ORM\ManyToOne(targetEntity: Order::class)]
    #[ORM\JoinColumn(name: "order_id", referencedColumnName: "order_id")]
    private ?Order $order = null;

    public function getId(): ?int
    {
        return $this->order_item_id;
    }

    public function getItemType(): ?string
    {
        return $this->item_type;
    }

    public function setItemType(string $item_type): static
    {
        $this->item_type = $item_type;
        return $this;
    }

    public function getLesson(): ?Lessons
    {
        return $this->lesson;
    }

    public function setLesson(?Lessons $lesson): static
    {
        $this->lesson = $lesson;
        return $this;
    }

    public function getCourse(): ?Courses
    {
        return $this->course;
    }

    public function setCourse(?Courses $course): static
    {
        $this->course = $course;
        return $this;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): static
    {
        $this->quantity = $quantity; 
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

    public function getTotal(): ?string
    {
        return $this->total;
    }

    public function setTotal(float $total): self
    {
        $this->total = $total;
        return $this;
    }

    private $courseId;
    private $lessonId;

    public function setCourseId($courseId): self
    {
        $this->courseId = $courseId;
        return $this;
    }

    public function getCourseId()
    {
        return $this->courseId;
    }

    public function setLessonId($lessonId): self
    {
        $this->lessonId = $lessonId;
        return $this;
    }

    public function getLessonId()
    {
        return $this->lessonId;
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

    public function setOrderId(Order $order): self
    {
        $this->order = $order;
        return $this;
    }

}
