<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use RequestParseBodyException;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
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
use App\Entity\Categorie;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Session\Session;
use Vich\UploaderBundle\Form\Type\VichImageType;

class ArticleController extends AbstractController
{
   
                                // ************** Afficher tous les Articles *********************************************/
                                #[Route('/article', name: 'app_article')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $listeArticles = $entityManager->getRepository(Article::class)->findAll();
        return $this->render('article/index.html.twig', [
            'listeArticles' => $listeArticles,
        ]);
    }
                                //******************* Afficher article ***********************************************/
                                #[Route('/Article/{id}', name: 'Article_show')]
    public function show(EntityManagerInterface $entityManager, $id)
    {
        $article = $entityManager->getRepository(Article::class)->find($id);
      
if (!$article) {
throw $this->createNotFoundException(
'No article found for id '.$id
);
}
        return $this->render('article/showArticle.html.twig', [
'article' => $article,

]);
    }
    

   
                                ////************** Ajouter Article form*********************************************/
                                #[Route('/AddArticle', name: 'add_article')]
    public function AddArticle(Request $request, EntityManagerInterface $em): RedirectResponse|Response
    {
        $article = new Article();
        $form    = $this->createForm("App\Form\ArticleType", $article);
        $form  ->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($article);
            $em->flush();
            return $this->redirectToRoute('app_article');
        }
        

        return $this->render('article/AddArticle.html.twig', 
        [
            'f' => $form->createView(),
        ]);
        }
                                    //******************* supprimer article ************************************* */
                                    #[Route('/Article/delete/{id}', name: 'article_delete')]
        public function delete(Request $request, $id, EntityManagerInterface $entityManager): Response
        {
            $c = $entityManager->getRepository(Article::class)->find($id);
            if (!$c) {
                throw $this->createNotFoundException(
                    'No article found for id ' . $id
                );
            }
            $entityManager->remove($c);
            $entityManager->flush();
            return $this->redirectToRoute('app_article');
        }
                            //*********************** update article **************************************** */#[Route('/editU/{id}', name: 'edit_user', methods: ['GET', 'POST'])]
                            #[Route('/article/editArticle/{id}', name: 'edit_article', methods: ['GET', 'POST'])]
        public function edit(Request $request, $id, EntityManagerInterface $em)
{
$article = new Article();
$article = $em->getRepository(Article::class)->find($id);
if (!$article) {
throw $this->createNotFoundException(
'No candidat found for id '.$id
);
}
$fb = $this->createFormBuilder($article)
            ->add('libelle')
  
            ->add('is_disponible')
            ->add('price')
            ->add('marque')
            ->add('categorie', EntityType::class, [
                'class'        => Categorie::class,
                'choice_label' => 'nom_categorie',
            ])
            ->add('imageFile', VichImageType::class,
            [
                'required'   => false,
                'label'      => "Image de l'Article",
                'label_attr' => [
                    'class' => 'form-label mt-4',
                ],
            ]
            )
            ->add('Valider',SubmitType::class)
            ;

                            // générer le formulaire à partir du FormBuilder
$form = $fb->getForm();
$form->handleRequest($request);
if ($form->isSubmitted()) {
$em->flush();
return $this->redirectToRoute('app_article');
}
return $this->render('article/AddArticle.html.twig',
['f' => $form->createView()] );
}   

                            ////////////////////////////////////////////////////////////////////////////////
                            #[Route('/articleuser/{id}', name: 'Article_showUser')]
    public function showUser(EntityManagerInterface $entityManager, $id)
    {
        $article = $entityManager->getRepository(Article::class)->find($id);
      
if (!$article) {
throw $this->createNotFoundException(
'No article found for id '.$id
);
}
        return $this->render('article/showArticleUser.html.twig', [
'article' => $article,

]);
    }
      
}
