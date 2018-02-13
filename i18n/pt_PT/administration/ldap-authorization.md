# Autorização LDAP

Neste guia, nós vamos mostrar como configurar a autorização LDAP para EspoCRM. Vamos lá.

Vai para o teu servidor LDAP e cria uma base DN para os utilizadores EspoCRM como a seguinte:
```
cn=espo-users,ou=users,dc=espo,dc=local
```

Nós temos que criar um utilizador para o sistema que vai ter acesso aos utilizadores DN (“cn=espo-users,ou=users,dc=espo,dc=local”). Sendo assim, o DN completo para este utilizador do sistema será
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Agora, nós podemos adicionar o utilizador LDAP para aceder o EspoCRM. Ex: Teste de Espo com o utilizador 'teste' dentro do “cn=espo-users,ou=users,dc=espo,dc=local” DN. Por favor, nota que: para seres capaz de usares este formato de login para o EspoCRM, deves especificar as opções para o "Atributo Nome de Utilizador" e para "Base DN".

Então, vai até as configurações da Autenticação EspoCRM no painel Administrador, seleciona o método 'LDAP' e preenche os detalhes no LDAP:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – LDAP IP ou nome da hospedagem.
* Port – porta de conexão.
* Auth – credenciais de acesso para o servidor LDAP:
 * Full User DN – o utilizador DN do sistema completo que vai permitir pesquisar por outros utilizadores.
 * Password – a senha de acesso para o servidor LDAP.
* Security – protocolo SSL ou TSL.
* Username Attribute – o atributo para identificar o utilizador. Para o Active Directory, ele pode ser  “userPrincipalName” ou “sAMAccountName”.
* Account Canonical Form – tipo de sua conta em formulário canónico. Existem 4 opções:
 * Dn – o formulário no formato `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – o formulário 'teste'.
 * Backslash – o formulário `COMPANHIA\teste`.
 * Principal – o formulário `teste@companhia.com`.
* Bind Requires Dn – se for necessário formatar o nome de utilizador no formulário DN.
* Base Dn – a base DN padrão usada para pesquisas de utilizadores.
* User Login Filter – o filtro que permite restringir utilizador que são capazes de usar o EspoCRM. Ex: `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – O domínio em que a autorização do servidor LDAP está sendo usada.
* Account Domain Name Short – O domínio curto em que a autorização do servidor LDAP está sendo usada.
* Try Username Split – a opção para separar um nome de utilizador com o domínio
* Opt Referrals – se referidos devem ser seguidos até o cliente LDAP..
* Create User in EspoCRM – essa opção permite o EspoCRM criar um utilizador do LDAP.
 * User First Name Attribute – atributo LDAP que é usado para determinar o primeiro nome do utilizador.
 * User Last Name Attribute – atributo LDAP que é usado para determinar o último nome do utilizador.
 * User Title Attribute – atributo do LDAP que é usado para determinar o título do utilizador.
 * User Email Address Attribute – atributo LDAP que é usado para determinar endereço de email do utilizador.
 * User Phone Number Attribute – atributo LDAP que é usado para determinar o número de telefone do utilizador.

Agora, vai para a página de login e digite as credenciais do utilizador.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

O utilizador foi autenticado e automaticamente criado no EspoCRM.

##Instruções de configuração baseadas no teu servidor:
* [Servidor Active Directory](ldap-authorization-for-ad.md)
* [Servidor OpenLDAP](ldap-authorization-for-openldap.md)

Para mais informações sobre como configurar LDAP podem ser lidas na página da [biblioteca Zend\Ldap](https://zendframework.github.io/zend-ldap/intro/), visto que EspoCRM usa esta biblioteca.




