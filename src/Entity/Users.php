<?php

namespace App\Entity;

use App\Repository\UsersRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: UsersRepository::class)]
class Users
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $email = null;

    #[ORM\Column(length: 255)]
    private ?string $password = null;

    #[ORM\Column]
    private ?bool $is_active = null;

    #[ORM\Column(length: 45)]
    private ?string $role = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $updated_at = null;

    #[ORM\Column(length: 255)]
    private ?string $created_by = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $updated_by = null;

    /**
     * @var Collection<int, Order>
     */
    #[ORM\OneToMany(targetEntity: Order::class, mappedBy: 'user_id', orphanRemoval: true)]
    private Collection $orders;

    /**
     * @var Collection<int, Certifications>
     */
    #[ORM\OneToMany(targetEntity: Certifications::class, mappedBy: 'user_id', orphanRemoval: true)]
    private Collection $certifications;

    /**
     * @var Collection<int, LessonCompletion>
     */
    #[ORM\OneToMany(targetEntity: LessonCompletion::class, mappedBy: 'user_id', orphanRemoval: true)]
    private Collection $lessonCompletions;

    public function __construct()
    {
        $this->orders = new ArrayCollection();
        $this->certifications = new ArrayCollection();
        $this->lessonCompletions = new ArrayCollection();
    }

    public function getUserId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    public function isActive(): ?bool
    {
        return $this->is_active;
    }

    public function setActive(bool $is_active): static
    {
        $this->is_active = $is_active;

        return $this;
    }

    public function getRole(): ?string
    {
        return $this->role;
    }

    public function setRole(string $role): static
    {
        $this->role = $role;

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

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(\DateTimeImmutable $updated_at): static
    {
        $this->updated_at = $updated_at;

        return $this;
    }

    public function getCreatedBy(): ?string
    {
        return $this->created_by;
    }

    public function setCreatedBy(string $created_by): static
    {
        $this->created_by = $created_by;

        return $this;
    }

    public function getUpdatedBy(): ?string
    {
        return $this->updated_by;
    }

    public function setUpdatedBy(?string $updated_by): static
    {
        $this->updated_by = $updated_by;

        return $this;
    }

    /**
     * @return Collection<int, Order>
     */
    public function getOrders(): Collection
    {
        return $this->orders;
    }

    public function addOrder(Order $order): static
    {
        if (!$this->orders->contains($order)) {
            $this->orders->add($order);
            $order->setUserId($this);
        }

        return $this;
    }

    public function removeOrder(Order $order): static
    {
        if ($this->orders->removeElement($order)) {
            // set the owning side to null (unless already changed)
            if ($order->getUserId() === $this) {
                $order->setUserId(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Certifications>
     */
    public function getCertifications(): Collection
    {
        return $this->certifications;
    }

    public function addCertification(Certifications $certification): static
    {
        if (!$this->certifications->contains($certification)) {
            $this->certifications->add($certification);
            $certification->setUserId($this);
        }

        return $this;
    }

    public function removeCertification(Certifications $certification): static
    {
        if ($this->certifications->removeElement($certification)) {
            // set the owning side to null (unless already changed)
            if ($certification->getUserId() === $this) {
                $certification->setUserId(null);
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
            $lessonCompletion->setUserId($this);
        }

        return $this;
    }

    public function removeLessonCompletion(LessonCompletion $lessonCompletion): static
    {
        if ($this->lessonCompletions->removeElement($lessonCompletion)) {
            // set the owning side to null (unless already changed)
            if ($lessonCompletion->getUserId() === $this) {
                $lessonCompletion->setUserId(null);
            }
        }

        return $this;
    }
}
