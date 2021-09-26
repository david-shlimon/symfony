<?php

namespace App\DataFixtures;

use App\Entity\Article;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;


class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);
        $faker = Factory::create('fr_FR'); //create variable faker who calls the faker library 


        for($i=0;$i < 6; $i++) {
        $post = new Article();

        $post->setTitle($faker->sentence($nbWords = 1, $variableNbWords = true))
            ->setArtdate($faker->dateTimeBetween($startDate = '-6 months', $endDate = 'now', $timezone = null))
            ->setArttext($faker->sentence($nbWords = 20, $variableNbWords = true))
            ->setArtpic($faker->imageUrl($width = 640, $height = 480));

        $manager->persist($post);
        }


        $manager->flush();
    }
}
