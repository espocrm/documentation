Backup and Restore
Sauvegarder et restauration
Comment sauvegarder manuellement  EspoCRM 

EspoCRM se compose des fichiers et des données (data). Toutes ces données sont nécessaires pour sauvegarder complètement
'EspoCRM.Comment le faire. sur un serveur Ubuntu avec MySQL.Voici les instructions :

Étape 1. Sauvegarder des fichiers
Créez une archive du contenu du répertoire d’EspoCRM installé. Pour Ubuntu,le chemin par défaut est / var / www / html. 
Vous pouvez appliquer cette commande.

tar -czf "fichiers.tar.gz" -C / var / www / html.

Étape 2. Sauvegarder la base de données
Pour sauvegarder toutes vos données, vous devez savoir  le nom de la base de données et l’accés des informations d'identi
fication. Vous pouvez trouver le nom de la base de données dans le fichier de configuration /ESPOCRM_DIRECTORY/data/config.
php sous la base de données de section. Vous pouvez utuliser cette commande pour sauvegarder votre base de données

mysqldump --user = VOTRE_USER --password = VOTRE_PASSWORD VOTRE_DATABASE_NAME> "db.sql"

Étape 3.Copier la sauvegarde
C'est tout. Maintenant, vous devez copier la sauvegarde créée dans une place sûr.

Comment sauvegarder EspoCRM avec un script
Vous pouvez utiliser un script pour sauvegarder toutes les données nécessaires. Connectez-vous via SSH et exécutez les commandes
(testées sur le serveur Ubuntu)

Télécharger un script
wgethttps://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh

Exécuter le script
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH

où

PATH_TO_ESPOCRM est un chemin d'accès au répertoire EspoCRM installé.
BACKUP_PATH est un chemin d'accès au répertoire de sauvegarde

Pour le serveur Ubuntu,cela est :

bash ./backup.sh / var / www / html / opt / sauvegardes
    
Remarquer: Si votre utilisateur MySQL n'a pas les droits nécessaires pour décharger  votre base de données, vous serez invité
à entrer les informations d'identification d'un autre utilisateur MySQL.

Après une création réussie, vous allez obtenir un chemin vers la sauvegarde créée

Restaurer EspoCRM à partir d'une sauvegarde
Vous pouvez restaurer EspoCRM à partir de la sauvegarde créée comme décrit ci-dessus.

Étape 1. Désarchiver les fichiers de sauvegarde
Pour désarchiver les fichiers, vous pouvez utiliser le gestionnaire d'archives ou exécuter la commande ci-dessous. Les fichiers
doivent être placés dans le répertoire du serveur Web

tar -xzf "fichiers.tar.gz" -C / var / www / html

où:

     / var / www / html est un répertoire de serveur Web.

Étape 2. Régler les autorisations requises

Les fichiers doivent appartenir à un utilisateur de serveur Web et avoir les permissions correctes. Veuillez régler définir les 
autorisations requises en suivant cette instruction s’il vous plait. 
www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

Étape 3. ımporter la base de données dump
La base de données dump doit être importée dans la même base de données avec les mêmes informations d'utilisateur, Sinon la 
confirmation doit être effectuée dans le fichier de configuration ESPOCRM_DIRECTORY / data / config.php. Pour importer votre 
base de données à partir de la décharge , exécutez la commande ci-dessous dans un terminal:

mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql

Étape 4. Vérifier / configurer crontab
Vérifiez si votre crontab est configuré d’une façon convenable.Exécutez la commande ci-dessous et vérifiez si un chemin vers
EspoCRM est correct:


sudo crontab -l -u www-data

où:

    . www-data est votre utilisateur de serveur Web.

Si vous devez faire un changement quelconque utilisez cette commande:

sudo crontab -l -u www-data

Plus de détails sur la configuration de crontab pour EspoCRM est décrit ici 
www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab

