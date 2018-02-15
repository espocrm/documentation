Configuration du serveur Apache pour EspoCRM 

+Ces instructions sont supplémentaires à la directive [Configuration du serveur] (server-configuration.md). Veuillez noter que 
+tous les paramètres de configuration affichées ici sont faits sur le serveur Ubuntu 

+PHP Exigences 
+Pour installer toutes les bibliothèques nécessaires, appliquez ces commandes dans un terminal 

sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart

Résolution du problème "Erreur API:API EspoCRM est indisponible 
Prenez seulement les étapes nécessaires.Après chaque étape, vérifiez si le problème est résolu. 

1. Veuillez activer le support "mod_rewrite" dans Apache
+Pour activer "mod_rewrite", appliquez ces commandes dans un terminal

sudo a2enmod rewrite
sudo service apache2 restart

2. Veuillez Activer le support .htaccess
Pour l’activation du support .htaccess, ajoutez / modifiez les paramètres de la configuration du serveur/etc/apache2/sites-
available/ESPO_VIRTUAL_HOST.conf or /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>

Ensuite, demarrez cette commande dans un terminal:

sudo service apache2 restart

3. Ajouter le chemin RewriteBase
Ouvrez un fichier /ESPOCRM_DIRECTORY/api/v1/.htaccess et remplacez la ligne suivante:

# RewriteBase /

Avec

RewriteBase /REQUEST_URI/api/v1/
+où REQUEST_URI est une partie de l'URL e.g.. pour "http://example.com/espocrm/", REQUEST_URI est "espocrm"

Veuillez activer le support HTTP AUTHORIZATION (seulement  pour FastCGI).
FastCGI ne supporte pas HTTP AUTHORIZATION par défaut. Si vous utilisez FastCGI, vous devez l'activer dans votre VirtualHost
ou /etc/apache2/apache2.conf (httpd.conf) en ajoutant le code suivant:+

Pour le module Fcgid

<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>

Pour le modüle FastCgi

<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                           -pass-header Proxy-Athorization \
                           -pass-header HTTP_AUTHORIZATION  
</IfModule>

Pour vérifier quel module est actuellement utilisé, exécutez cette commande et trouvez le module: 

Pour vérifier quel module est actuellement utilisé, exécutez cette commande et trouvez le module:     

apache2ctl -M
