<?php

namespace App\Entity;

use App\Repository\OrderItemsRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrderItemsRepository::class)]
class OrderItems
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $order_item_id = null;

    #[ORM\ManyToOne(inversedBy: 'orderItems')]
    #[ORM\JoinColumn(name: "order_id", referencedColumnName: "order_id", nullable: false)]
    private ?Order $order_id = null;

    #[ORM\Column(length: 20)]
    private ?string $item_type = null;

    #[ORM\ManyToOne(targetEntity: Lessons::class, inversedBy: 'orderItems')]
    #[ORM\JoinColumn(name: "lesson_id", referencedColumnName: "lesson_id", nullable: true)]
    private ?Lessons $lesson_id = null;

    #[ORM\ManyToOne(inversedBy: 'orderItems')]
    private ?Courses $course = null;

    #[ORM\Column]
    private ?int $quantity = null;

    #[ORM\Column]
    private ?float $price = null;

    #[ORM\Column]
    private ?float $total = null;

    public function getId(): ?int
    {
        return $this->order_item_id;
    }

    public function getOrder(): ?Order
    {
        return $this->order_id;
    }

    public function setOrder(?Order $order): static
    {
        $this->order_id = $order;

        return $this;
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
        return $this->lesson_id;
    }

    public function setLesson(?Lessons $lesson): static
    {
        $this->lesson_id = $lesson;

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

    public function getTotal(): ?float
    {
        return $this->total;
    }

    public function setTotal(float $total): static
    {
        $this->total = $total;

        return $this;
    }
}
