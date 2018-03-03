# Recommandations Pour L'Utilisation Des Emails  

EspoCRM  permet de quérir les emails placées dans la boite de réception IMAP. Cet atout permet à EspoCRM d'être utilisé comme un client de messagerie qui possède aussi des fonctionnalités spécifiques pour la gestion des relations avec la clientèle.  

## Comptes IMAP  

*Remarque : Afin d'assurer le bon fonctionnement de la réception d'emails, vous avez besoin d'avoir [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) configuré correctement dans votre système.*  

L'utilisateur peut établir le compte IMAP sur la page des Comptes Emails Personnels (section Messages > menu en haut à droite > Comptes de Messages Personnels).  

Vous pouvez spécifier quels sont les dossiers à surveiller avec le champ Dossiers Surveillés. De manière générale, ce réglage est défini pour la boite de réception INBOX. Si vous utilisez des clients de messagerie externes pour envoyer des emails, vous pouvez ajouter le dossier des Messages Envoyés pour archiver ces messages.  

*Fetch Since* vous permet de choisir la date à partir de laquelle les messages doivent être archivés. Si vous avez besoin d'archiver des messages passés, choisissez une date antérieure à celle d'aujourd'hui.  

Vous pouvez spécifier un dossier ou *Folder* dans votre Compte Email Personnel. Les messages entrants seront placés dans ce dossier.   

## Comptes SMTP  

Les utilisateurs peuvent établir les paramètres SMTP dans leurs Préférences, de même que dans leurs Comptes de Messages Personnels. L'administrateur peut aussi permettre l'utilisation du système SMTP (en le rendant Partagé).  

Les utilisateurs ont la possibilité d'avoir plusieurs comptes SMTP (depuis la version 4.2.0). Ceci étant, les adresses emails que l'utilisateur peut utiliser pour l'envoi de messages sont définies dans les adresses emails attachées aux données de l'utilisateur, *User*.  

## Travailler avec des Emails  

Cron (application fonctionnant à l'arrière-plan) cherche les messages périodiquement après l'écoulement d'un certain nombre de minutes (cette durée peut être spécifiée par l'Administrateur).  

Vous pouvez voir tous vos messages dans la section Messages. Cette section contient les dossiers Boite de Réception, Messages Envoyés, et Messages Brouillons sur le côté gauche.  

Vous avez le champ *Status*. `Sent` signifie que le message a été envoyé à partir du CRM, `Archived` – message obtenue à partir du compte IMAP ou archivés manuellement, `Draft` – veut dire que cet email a été créé comme brouillon.   

Lorsqu'un message arrive, le système tente de reconnaitre les données qui corresponde à ce message. Il peut lier ce message avec le Compte, Lead, Opportunité, Cas (et Contact en mode B2C) etc. Si aucune reconnaissance n'est établie, l'utilisateur peut créer un lien manuellement en remplissant le champ *Parent*.  

Si un email est reçu d'un client potentiel, l'utilisateur peut le convertir en lead avec **convert it to Lead**. Ouvrez l'entrée Email et Cliquez sur Créer Un Lead dans le menu en haut à droite.  

Il est aussi possible de créer une tache ou un cas, **create Task or Case** à partir d'une donnée email.  

Si les adresses emails (de, a, cc) dans les données d'un email sont connus par le système, il montrera la personne à qui ces données sont liées (Contact, Lead, Utilisateur etc). Si une adresse email est nouvelle, vous pouvez créer un contact, **create contact** à cette étape.  

Tous les emails reliés à une donnée spécifique sont présentés dans le panneau de configuration de l'Historique de cette donnée. Si une adresse email par exemple est reliée à une opportunité alors que cette opportunité est aussi reliée à ce compte, la donnée sera montrée pour l'opportunité et le compte.  

## Envoi De Messages  

Vous pouvez composer des messages de plusieurs manières :  

* Bouton *Compose Email* dans la vue liste de Messages ;  

* en répondant à un autre message ;  

* en cliquant sur une adresse email attachée à certaines données ;  

* avec l'action *Compose Email* du panneau d'Activités.  

Vous avez la possibilité de choisir un message préconfiguré **select template** pour votre message.  

Vous pouvez mettre en place une signature pour vos messages **email signature** dans les Préférences.  

## Dossiers Emails  

Les utilisateurs peuvent créer leurs propres dossiers de messages pour y insérer des emails pour plus de commodité. La liste des dossier disponibles est accessible sur la page Messages à gauche. Dans le but de créer, éditer des dossiers veuillez suivre Messages > menu dépliant en haut à gauche > Dossiers. `Skip Notification` signifie que vous ne voulez pas recevoir de notification pour les messages entrant qui sont automatiquement placés dans un dossier spécifique. L'utilisation des Filtres de Messages permet de ranger automatiquement des emails dans des dossiers spécifiques en fonction de certains critères.  

## Filtres de Messages  

L'administrateur peut créer des filtres de messages ayant applicables globalement sur le système pour omettre des messages non désirés. Ces filtres sont disponibles dans Administration > Filtres de Messages.  

Un utilisateur peut généralement créer des filtres de messages pour son Compte Email Personnel. Ces filtres sont accessibles à Messages > menu dépliant en haut dans le coin droit > Filtres.  

Il y a deux types de filtres :  

* Ignorer - le message sera mis dans la corbeille *Trash* ou ne sera pas importé si le filtre est lié à un Compte Email Personnel ;  

* Insérer Dans Un Dossier - les messages importés seront automatiquement placés dans un dossier spécifié de l'utilisateur.  

## Messages Préconfigurés  

Les messages préconfigurés sont disponibles à Messages > menu dépliant dans le coin droit en haut > Messages Préconfigurés. Ils peuvent être utilisés pour l'envoi de messages en masse ou pour l'envoi de messages classiques. La case à cocher `One-off` veut dire que le message préconfiguré ne devra être utilisé qu'une fois, ce qui est la norme dans le domaine de la promotion par emails.  

Il est possible d'instaurer des espaces réservés à l'intérieur du texte d'un messages préconfiguré et dans le sujet du messages - exemple : {Account.name}, {Person.emailAddress}. Ces espaces réservés seront remplacés avec les valeurs des données reliées.   

Vous pouvez utiliser des espaces réservés additionnels dans le texte du message: {optOutUrl} et {optOutLink}.  

```  
<a href="{optOutUrl}">Unsubscribe</a>  

```  

Ceci est le lien de désinscription pour l'envoi de messages en masse.  
