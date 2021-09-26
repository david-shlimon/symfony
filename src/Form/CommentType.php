<?php

namespace App\Form;

use App\Entity\Comment;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class CommentType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add("name", TextType::class, [
          'label' => 'Pseudo',
            "attr" => [
  
              "class" => "form-control"
            
            ]
            ])
            ->add("content", TextareaType::class, [
              'label' => 'Commentaire',
              "attr" => [
    
                "class" => "form-control"
    
              ]
              ])
            ->add("submit", SubmitType::class, [

              'label' => 'Envoyer',
              "attr" => [
  
                "class" => "btn btn-dark"
              ]
            ])
            
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Comment::class,
        ]);
    }
}
