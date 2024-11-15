<?php

namespace App\Entity;

use App\Repository\CertificationsRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CertificationsRepository::class)]
class Certifications
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $certification_id = null;

    #[ORM\ManyToOne(targetEntity: Users::class, inversedBy: 'certifications')]
    #[ORM\JoinColumn(name: "user_id", referencedColumnName: "id", nullable: false)]
    private ?Users $user = null;

    #[ORM\ManyToOne(targetEntity: Themes::class, inversedBy: 'certifications')]
    #[ORM\JoinColumn(name: "theme_id", referencedColumnName: "id", nullable: false)]
    private ?Themes $theme_id = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $date_obtained = null;

    public function getId(): ?int
    {
        return $this->certification_id;
    }

    public function getUserId(): ?Users
    {
        return $this->user;
    }

    public function setUserId(?Users $user_id): static
    {
        $this->user = $user_id;

        return $this;
    }

    public function getThemeId(): ?Themes
    {
        return $this->theme_id;
    }

    public function setThemeId(?Themes $theme_id): static
    {
        $this->theme_id = $theme_id;

        return $this;
    }

    public function getDateObtained(): ?\DateTimeInterface
    {
        return $this->date_obtained;
    }

    public function setDateObtained(\DateTimeInterface $date_obtained): static
    {
        $this->date_obtained = $date_obtained;

        return $this;
    }
}
