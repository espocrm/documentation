# La Configuration d'EspoCRM pour B2C (Business-to-Client)

Par défaut, EspoCRM est conçu pour utiliser pour B2B business. Mais vous pouvez facilement l’installer pour B2C.

Veuillez Changer b2cMode en vrai dans votre fichier de configuration data / config.php. Depuis la version 4.3.0, il se peut être configuré dans Administration > paramètres. Supprimez l'onglet Compte du menu de navigation (Administration > Interface utilisateur).

  Supprimez les champs du compte de vos mises en page (Administation > Gestionnaire de mise en page). Désactivez un accès à l'étendue du compte pour tous vos rôles (Administration > Rôles).  Supprimez le compte, des listes de sélection de tous les champs parents (Administration > Gestionnaire d'entités > {Réunion / Appel / Tâche / E-mail}> Champs> Parent
