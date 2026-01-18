<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Categorie;
use RequestParseBodyException;
use Symfony\Config\Doctrine\Orm\EntityManagerConfig;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\FormType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use App\Entity\Article;


class CategorieController extends AbstractController
{
    // ************** Afficher Categories *********************************************/
    #[Route('/categorie', name: 'app_categorie')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $listeCategories = $entityManager->getRepository(Categorie::class)->findAll();
        return $this->render('categorie/showCategorie.html.twig', [
            'listeCategories' => $listeCategories,
        ]);
    }
    //****************** Afficher Categorie ****************************************** */
    #[Route('/categorie/{id}', name: 'categorie_show')]
    public function show(EntityManagerInterface $entityManager, $id)
    {
        $categorie = $entityManager->getRepository(Categorie::class)->find($id);
        $listArticles=$entityManager->getRepository(Article::class)
->findBy(['categorie'=>$categorie]);
if (!$categorie) {
throw $this->createNotFoundException(
'No article found for id '.$id
);
}
        return $this->render('categorie/show.html.twig', [
'categorie' =>$categorie,
'listeArticles'=> $listArticles,
]);
    }
    ///////////////////////////  user show /////////////////////////////////////
    #[Route('/categori/{id}', name: 'categorie_userShow')]
    public function show1(EntityManagerInterface $entityManager, $id)
    {
        $categorie = $entityManager->getRepository(Categorie::class)->find($id);
          
         $listeCategories = $entityManager->getRepository(Categorie::class)->findAll();
        $listArticles=$entityManager->getRepository(Article::class)
->findBy(['categorie'=>$categorie]);
if (!$categorie) {
throw $this->createNotFoundException(
'No article found for id '.$id
);
}
        return $this->render('categorie/userShowCategorie.html.twig', [
'categorie' =>$categorie,
'listeArticles'=> $listArticles,
'listeCategories' => $listeCategories,

]);
    }
    //************** Ajouter Categorie *********************************************/
    #[Route('/AddCategorie', name: 'add_Categorie')]
    public function AddArticle(Request $request, EntityManagerInterface $em): Response
    {
        $categorie = new Categorie();
        $fb = $this->createFormBuilder($categorie)
            ->add('nom_Categorie', TextType::class);
            
            $form = $fb->getForm();
        // Récupération des données
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($categorie);
            $em->flush();
            return $this->redirectToRoute('app_categorie');
        }

        return $this->render('categorie/AddCategorie.html.twig', [
            'f' => $form->createView(),
        ]);
    }
}
