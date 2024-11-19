<?php

namespace App\Entity;

use App\Repository\UsersRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(repositoryClass: UsersRepository::class)]
#[ORM\UniqueConstraint(name: 'UNIQ_IDENTIFIER_EMAIL', fields: ['email'])]
#[UniqueEntity(fields: ['email'], message: 'There is already an account with this email')]
class Users implements UserInterface, PasswordAuthenticatedUserInterface
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
    
    /**
     * @var list<string> The user roles
     */
    #[ORM\Column]
    private array $roles = [];

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

    #[ORM\Column]
    private bool $isVerified = false;

    /**
     * @var Collection<int, UserCourses>
     */
    #[ORM\OneToMany(targetEntity: UserCourses::class, mappedBy: 'user_id', orphanRemoval: true)]
    private Collection $userCourses;

    /**
     * @var Collection<int, UserLessons>
     */
    #[ORM\OneToMany(targetEntity: UserLessons::class, mappedBy: 'user_id', orphanRemoval: true)]
    private Collection $userLessons;

    public function __construct()
    {
        $this->orders = new ArrayCollection();
        $this->certifications = new ArrayCollection();
        $this->lessonCompletions = new ArrayCollection();
        $this->userCourses = new ArrayCollection();
        $this->userLessons = new ArrayCollection();
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

        /**
     * @see PasswordAuthenticatedUserInterface
     */
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
    
    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return $this->email;
    }

    /**
     * @see UserInterface
     *
     * @return list<string>
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    /**
     * @param list<string> $roles
     */
    public function setRoles(array $roles): static
    {
        $this->roles = $roles;

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
     * @see UserInterface
     */
    public function eraseCredentials(): void
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
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

    public function isVerified(): bool
    {
        return $this->isVerified;
    }

    public function setVerified(bool $isVerified): static
    {
        $this->isVerified = $isVerified;

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
            $userCourse->setUserId($this);
        }

        return $this;
    }

    public function removeUserCourse(UserCourses $userCourse): static
    {
        if ($this->userCourses->removeElement($userCourse)) {
            // set the owning side to null (unless already changed)
            if ($userCourse->getUserId() === $this) {
                $userCourse->setUserId(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, UserLessons>
     */
    public function getUserLessons(): Collection
    {
        return $this->userLessons;
    }

    public function addUserLesson(UserLessons $userLesson): static
    {
        if (!$this->userLessons->contains($userLesson)) {
            $this->userLessons->add($userLesson);
            $userLesson->setUserId($this);
        }

        return $this;
    }

    public function removeUserLesson(UserLessons $userLesson): static
    {
        if ($this->userLessons->removeElement($userLesson)) {
            // set the owning side to null (unless already changed)
            if ($userLesson->getUserId() === $this) {
                $userLesson->setUserId(null);
            }
        }

        return $this;
    }
    
}
