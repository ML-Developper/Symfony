<?php

namespace App\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Controller\CategorieController;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\Categorie;
use App\Entity\Article;



class HomeController extends AbstractController
{
#[Route('/home', name: 'home')]
public function index(EntityManagerInterface $entityManager)
{
    $listeCategories = $entityManager->getRepository(Categorie::class)->findAll();
 
return $this->render('home/index.html.twig',[
            'listeCategories' => $listeCategories,
         

        ]);
}
#[Route('/admin/dashboard', name: 'admin_dashboard')]
public function admin()
{
return $this->render('admin/dashboard.html.twig');
}
}
