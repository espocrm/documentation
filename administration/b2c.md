#Configuring EspoCRM for B2C (Business-to-Client)

By default EspoCRM is configured to use for B2B business. But you can easily setup it for B2C.

* Change `b2cMode` to true in your config file `data/config.php`. Since version 4.3.0 it can be configured at Administration > Seetings.
* Remove *Account* tab from the navigation menu (Administration > User Interface).
* Remove *Account* fields from your layouts (Administation > Layout Manager).
* Disable an access to *Account* scope for all your roles (Administration > Roles).
* Remove Account from picklists of all parent fields (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).

Configuration d'EspoCRM pour B2C (Business-to-Client)

Par défaut, EspoCRM est conçu pour utiliser pour B2B business. Mais vous pouvez facilement l’installer pour B2C.

-Veuillez Changer b2cMode en vrai dans votre fichier de configuration data / config.php. Depuis la version 4.3.0, il se peut être configuré dans Administration> paramètres
- Supprimez l'onglet Compte du menu de navigation (Administration> Interface utilisateur).
- Supprimez les champs du compte de vos mises en page (Administation> Gestionnaire de mise en page).
- Désactivez un accès à l'étendue du compte pour tous vos rôles (Administration> Rôles).
- Supprimez le compte, des listes de sélection de tous les champs parents (Administration> Gestionnaire d'entités> {Réunion / Appel / Tâche / E-mail}> Champs> Parent

