<?php

namespace App\Entity;

use App\Repository\OrderRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrderRepository::class)]
#[ORM\Table(name: '`order`')] 
class Order
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $order_id = null;

    #[ORM\ManyToOne(inversedBy: 'orders')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Users $user_id = null;

    #[ORM\Column(type: Types::DATETIME_IMMUTABLE)]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column(type: Types::INTEGER, nullable: true)]
    private ?int $lesson_id = null;

    #[ORM\Column(type: Types::INTEGER, nullable: true)]
    private ?int $course_id = null;

    #[ORM\Column(length: 20)]
    private ?string $item_type = null;

    public function getId(): ?int
    {
        return $this->order_id;
    }

    public function setOrderId(Order $order): self
    {
        $this->order_id = $order;
        return $this;
    }

    public function getUserId(): ?Users
    {
        return $this->user_id;
    }

    public function setUserId(?Users $user_id): static
    {
        $this->user_id = $user_id;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): static
    {
        $this->created_at = $created_at;
        return $this;
    }

    public function getLessonId(): ?int
    {
        return $this->lesson_id;
    }

    public function setLessonId(?int $lesson_id): self
    {
        $this->lesson_id = $lesson_id;
        return $this;
    }

    public function getCourseId(): ?int
    {
        return $this->course_id;
    }

    public function setCourseId(?int $course_id): self
    {
        $this->course_id = $course_id;
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

    public function getCourseIdDirect(): ?int
    {
        return $this->course_id;
    }

    public function setCourseIdDirect(?int $courseId): self
    {
        $this->course_id = $courseId;
        return $this;
    }

    public function getLessonIdDirect(): ?int
    {
        return $this->lesson_id;
    }

    public function setLessonIdDirect(?int $lessonId): self
    {
        $this->lesson_id = $lessonId;
        return $this;
    }
}
