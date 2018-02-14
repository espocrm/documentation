# Installation

### Exigences
EspoCRM fonctionne sur la plupart des fournisseurs d'hébergement. Conditions requises sont les suivantes:

* PHP 5.6 ou la dernière version de PHP avec l'option pdo, json, bibliothèque GD, mcrypt extensions (généralement activé par défaut);
* MySQL 5.5.3 ou plus.

Voir [Configuration du Serveur](configuration de serveur.md) de l'article pour plus d'informations.

### 1. Télécharger le EspoCRM package d'installation
Pour obtenir la dernière version de EspoCRM suivre [page de téléchargement](http://www.espocrm.com/download/) lien.

### 2. Télécharger le EspoCRM des Fichiers sur Votre Serveur

Une fois le téléchargement terminé, envoyez le paquet à votre serveur web. 
Pour la télécharger, vous pouvez utiliser SSH, FTP ou à l'accueil du panneau d'administration.
Extraire l'archive dans votre répertoire du serveur web (par exemple, `public_html`, `www`, etc.).

_Note: Pour FTP, vous devez extraire l'archive avant de la télécharger à votre serveur web._

### 3. Créer une Base de données MySQL pour EspoCRM à utiliser

Aller à votre hébergement panneau d'administration, ou par SSH, et de créer une nouvelle base de données et de l'utilisateur pour EspoCRM (par exemple, Bases de données MySQL " dans cPanel).

### 4. Exécuter EspoCRM processus d'installation

Maintenant, ouvrez votre navigateur web et accédez à l'URL avec EspoCRM des fichiers (par exemple, `http://yourdomain.com/espo`).

Si vous voyez cet écran, vous avez une erreur "Autorisation refusée". 
Donc, vous devez exécuter la commande affichée dans le terminal via SSH, ou de définir les autorisations correctes. 
Il convient de 755 pour les répertoires, 644 pour les fichiers et 775 pour les `données` annuaire. 
Assurez-vous également que vous avez la bonne _owner_ et _group_.

![1](../_static/images/administration/installation/1.png)

Si vous voyez l'écran suivant, l'autorisation est correct et vous pouvez commencer à installer EspoCRM.

![2](../_static/images/administration/installation/2.png)

Sur cette page, vous pouvez lire et accepter le Contrat de Licence.

![3](../_static/images/administration/installation/3.png)

Entrez les détails de votre nouvellement créé de base de données MySQL.

![4](../_static/images/administration/installation/4.png)

Entrez le nom d'utilisateur et le mot de passe de l'Administrateur EspoCRM.

![5](../_static/images/administration/installation/5.png)

Sur cette page, vous pouvez définir les paramètres par défaut de EspoCRM, comme la date et le format de l'heure, le fuseau horaire, la monnaie et les autres.

![6](../_static/images/administration/installation/6.png)

Entrez les paramètres du serveur SMTP pour l'envoi d'e-mails, si vous voulez avoir la possibilité d'envoyer des e-mails. 
Cette étape peut être sautée en cliquant sur le _Next_ bouton. 
Toutes ces options peuvent être ajoutées ou modifiées dans EspoCRM après l'installation.

![7](../_static/images/administration/installation/7.png)

Félicitation! L'Installation est terminée. 
La dernière chose à la configuration des Tâches Planifiées pour être exécuté par votre système. Il peut être fait en exécutant `crontab -e` en ligne de commande linux et dans _Windows Tâches Scheduler_ dans les systèmes Windows.

![8](../_static/images/administration/installation/8.png)

Nous espérons que vous aurez plaisir à travailler dans EspoCRM.
