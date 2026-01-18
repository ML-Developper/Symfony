<?php
namespace App\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Security\Http\Authenticator\AbstractLoginFormAuthenticator;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Http\Authenticator\Passport\Passport;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\UserBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Credentials\PasswordCredentials;

class LoginFormAuthenticator extends AbstractLoginFormAuthenticator
{
public function __construct(private UrlGeneratorInterface $urlGenerator) {}
public function authenticate(Request $request): Passport
{
return new Passport(
new UserBadge($request->request->get('_username')),
new PasswordCredentials($request->request->get('_password'))
);
}
public function onAuthenticationSuccess(Request $request, TokenInterface $token,
string $firewallName): ?Response
{
$roles = $token->getUser()->getRoles();
if (in_array('ROLE_ADMIN', $roles, true)) {
return new RedirectResponse($this->urlGenerator->generate('admin_dashboard'));
}
return new RedirectResponse($this->urlGenerator->generate('home'));
}
protected function getLoginUrl(Request $request): string
{
return $this->urlGenerator->generate('app_login');
}
}