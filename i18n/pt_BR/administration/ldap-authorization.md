# Autorização LDAP

Nesse guia, nós vamos mostrar como configurar a autorização LDAP para EspoCRM. Vamos lá.

Vá para seu servidor LDAP e crie uma base DN para os usuários EspoCRM como a seguinte:
```
cn=espo-users,ou=users,dc=espo,dc=local
```

Nós temos que criar um usuário para o sistema que vai ter acesso aos usuários DN (“cn=espo-users,ou=users,dc=espo,dc=local”). Sendo assim, o DN completo para esse usuário do sistema será
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Agora, nós podemos adicionar o usuário LDAP para acessar o EspoCRM. Ex: Teste de Espo com o usuário 'teste' dentro do “cn=espo-users,ou=users,dc=espo,dc=local” DN. Por favor, note que: para ser capaz de usar esse formato de login para o EspoCRM, você deve especificar as opções para o "Atributo Nome de Usuário" e para "Base DN".

Então, vá até as configurações da Autenticação EspoCRM no painel Administrador, selecione o método 'LDAP' e preencha os detalhes no LDAP:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – LDAP IP ou nome da hospedagem.
* Port – porta de conexão.
* Auth – credenciais de acesso para o servidor LDAP:
 * Full User DN – o usuário DN do sistema completo que vai permitir pesquisar por outros usuários.
 * Password – a senha de acesso para o servidor LDAP.
* Security – protocolo SSL ou TSL.
* Username Attribute – o atributo para identificar o usuário. Para o Active Directory, ele pode ser  “userPrincipalName” ou “sAMAccountName”.
* Account Canonical Form – tipo de sua conta em formulário canônico. Existem 4 opções:
 * Dn – o formulário no formato `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – o formulário 'teste'.
 * Backslash – o formulário `COMPANHIA\teste`.
 * Principal – o formulário `teste@companhia.com`.
* Bind Requires Dn – se for necessário formatar o nome de usuário no formulário DN.
* Base Dn – a base DN padrão usada para pesquisas de usuários.
* User Login Filter – o filtro que permite restringir usuários que são capazes de usar o EspoCRM. Ex: `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – O domínio em que a autorização do servidor LDAP está sendo usada.
* Account Domain Name Short – O domínio curto em que a autorização do servidor LDAP está sendo usada.
* Try Username Split – a opção para separar um nome de usuário com o domínio
* Opt Referrals – se referidos devem ser seguidos até o cliente LDAP..
* Create User in EspoCRM – essa opção permite o EspoCRM criar um usuário do LDAP.
 * User First Name Attribute – atributo LDAP que é usado para determinar o primeiro nome do usuário.
 * User Last Name Attribute – atributo LDAP que é usado para determinar o último nome do usuário.
 * User Title Attribute – atributo do LDAP que é usado para determinar o título do usuário.
 * User Email Address Attribute – atributo LDAP que é usado para determinar endereço de email do usuário.
 * User Phone Number Attribute – atributo LDAP que é usado para determinar o número de telefone do usuário.

Agora, vá para a página de login e digite as credenciais do usuário.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

O usuário foi autenticado e automaticamente criado no EspoCRM.

##Instruções de configuração baseadas em seu servidor:
* [Servidor Active Directory](ldap-authorization-for-ad.md)
* [Servidor OpenLDAP](ldap-authorization-for-openldap.md)

Para mais informações sobre como configurar LDAP podem ser lidas na página da [biblioteca Zend\Ldap](https://zendframework.github.io/zend-ldap/intro/), visto que EspoCRM usa essa biblioteca.




