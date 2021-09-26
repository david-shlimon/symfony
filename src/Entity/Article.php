<?php

namespace App\Entity;

use App\Repository\ArticleRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ArticleRepository::class)
 * @ORM\Table(name="article")
 */
class Article
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $title;

    /**
     * @ORM\Column(type="date")
     */
    private $artdate;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $arttext;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $artpic;

    /**
     * @ORM\OneToMany(targetEntity=Comment::class, mappedBy="post")
     */
    private $comments;

    public function __construct()
    {
        $this->comments = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getArtdate(): ?\DateTimeInterface
    {
        return $this->artdate;
    }

    public function setArtdate(\DateTimeInterface $artdate): self
    {
        $this->artdate = $artdate;

        return $this;
    }

    public function getArttext(): ?string
    {
        return $this->arttext;
    }

    public function setArttext(string $arttext): self
    {
        $this->arttext = $arttext;

        return $this;
    }

    public function getArtpic(): ?string
    {
        return $this->artpic;
    }

    public function setArtpic(string $artpic): self
    {
        $this->artpic = $artpic;

        return $this;
    }

    public function getArtId(): ?int
    {
        return $this->art_id;
    }

    /**
     * @return Collection|Comment[]
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setPost($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): self
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getPost() === $this) {
                $comment->setPost(null);
            }
        }

        return $this;
    }
}
