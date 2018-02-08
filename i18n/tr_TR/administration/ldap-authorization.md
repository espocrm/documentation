# Ldap Authorization

In this guide, we will show how to configure LDAP authorization for EspoCRM. Let’s go.

Go to your LDAP server and create a base DN for the EspoCRM users like
```
cn=espo-users,ou=users,dc=espo,dc=local
```

We have to create a system user which will have access to the users DN (“cn=espo-users,ou=users,dc=espo,dc=local”). So, the full DN for this system user will be
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Now, we can add LDAP user to access to EspoCRM. E.g. Espo Tester with the username “tester” inside the “cn=espo-users,ou=users,dc=espo,dc=local” DN. Please note: to be able to use this login format for EspoCRM, you have to specify the “Username Attribute” and “Base DN” options.

Then, go to EspoCRM  Authentication settings in the Administrator panel, select `LDAP` method and fill in the LDAP details:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – LDAP IP or host name.
* Port – connection port.
* Auth – access credentials for the LDAP server:
 * Full User DN – the full system user DN which allows to search other users.
 * Password – the password to access the LDAP server.
* Security – SSL or TSL protocol.
* Username Attribute – the attribute to identify the user. For Active Directory it can be “userPrincipalName” or “sAMAccountName”.
* Account Canonical Form – type of your account canonical form. There are 4 options:
 * Dn – the form in the format `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – the form `tester`.
 * Backslash – the form `COMPANY\tester`.
 * Principal – the form `tester@company.com`.
* Bind Requires Dn – if need to format the username in the DN form.
* Base Dn – the default base DN which is used for searching users.
* User Login Filter – the filter which allows to restrict users who are able to use EspoCRM. E.g. `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – The domain which is used for authorization the LDAP server.
* Account Domain Name Short – The short domain which is used for authorization the LDAP server.
* Try Username Split – the option to split a username with the domain.
* Opt Referrals – if referrals should be followed to the LDAP client.
* Create User in EspoCRM – this option allows EspoCRM to create a user from the LDAP.
 * User First Name Attribute – LDAP attribute which is used to determine the user first name.
 * User Last Name Attribute – LDAP attribute which is used to determine the user last name.
 * User Title Attribute – LDAP attribute which is used to determine the user title.
 * User Email Address Attribute – LDAP attribute which is used to determine the user email address.
 * User Phone Number Attribute – LDAP attribute which is used to determine the user phone number.

Now, go to the login page and enter user credentials.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

User has been authenticated and automatically created in the EspoCRM.

##Configuration instructions based on your server:
* [Active Directory server](ldap-authorization-for-ad.md)
* [OpenLDAP server](ldap-authorization-for-openldap.md)

More information about configuring LDAP you can read on the [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/) page, as EspoCRM uses this library.




