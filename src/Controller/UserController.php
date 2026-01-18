<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;


class UserController extends AbstractController
{
    // ************** Afficher tous les Articles *********************************************/
    #[Route('/users', name: 'app_users')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $listeUsers = $entityManager->getRepository(User::class)->findAll();
        return $this->render('user/showUsers.html.twig', [
            'listeUsers' => $listeUsers,
        ]);
    }
}
