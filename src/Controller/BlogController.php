<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Comment;
use App\Form\CommentType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;



class BlogController extends AbstractController
{

    /**
     * @Route("/", name="home")
     */
    public function home(): Response
    {

      return $this->render('blog/home.html.twig', []);
    }

    /**
     * @Route("/blog", name="blog")
     */
    public function index(EntityManagerInterface $em): Response
    {

      $rep =  $em->getRepository(Article::class);

        $post = $rep->findAll();

        return $this->render('blog/index.html.twig', [
            'posts' => $post]);
    }

    /**
     * @Route("/post/{id}", name="show_post")
     */
    public function show(Article $article, Request $req, EntityManagerInterface $em): Response
    {

      $comment = new Comment();

      $form = $this->createForm(CommentType::class, $comment);



              $comment->setCreatedAt(new \DateTime());
              $comment->setPost($article);

              $form->handleRequest($req);
              
              if($form->isSubmitted() && $form->isValid()) {
                $em->persist($comment);
                $em->flush();

              }

      return $this->render('blog/post.html.twig', [
            'post' => $article,
            "form" => $form->createView()
      ]);
    }

}
