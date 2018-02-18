Emails
Courriers Electroniques

Important. Cron doit être configuré dans votre système pour que le chargement des courriers electroniques fonctionne. Vous 
pouvez trouver les informations dans votre EspoCRM à l'adresse Administration> Tâches planifiées.
  
Aperçu

EspoCRM a la capacité de surveiller les boîtes aux lettres IMAP. Le courrier électronique peut être archivé de deux façons: 
Les comptes de messagerie groupe et les comptes de messagerie personnel. Les comptes de groupe entrant sont destinés aux 
boîtes aux lettres de groupe: le cas le plus commun est une boîte de support. Les comptes de messagerie personnel sont destinés
aux boîtes aux lettres personnelles pour les utilisateurs.

Tant que le courrier électronique arrive, le système tente de le lier avec l'enregistrement approprié (Comptes, Prospect, 
Opportunité, Cas). Les utilisateurs qui suivent cet enregistrement recevront une notification concernant un nouvel e-mail 
dans le système, même s'ils ne sont pas dans To or CC.

Les Comptes  Du  Courrier Electronique  De Groupe

Seulement  l'administrateur peut installer Les Comptes Du Courrier Electronique De Groupe.Les  Comptes Du Courriel de group 
peuvent  être utilisé pour tous les deux ,la réception et l'envoi des e-mails. L'envoi des courriers electroniques  par les 

comptes de groupe est disponible depuis la version 4.9.0

Le champ des equipes détermine les équipes auxquelles les e-mails entrants seront attribués.

Si le compte du courriel de groupe a SMTP  et il est confirmè comme partagé et puis un accès sera contrôlé par les Rôles à 
travers la permission du Compte e-Mail de groupe. Le champ des groupes sera utilisé si le niveau d'autorisation est rangé à 
"l'équipe".

Il y a la capacité de rendre le système d'envoyer une réponse automatique pour les e-mails entrants.

Email-to-Case

Il y a une option pour rendre le système de créer des cas de l'entrée des e-mails.de groupe 

Cette caracteristique est destinée aux équipes de support. 

Ces cas peuvent être distribué aux utilisateurs de l'équipe en fonction de ces façons: 

L’affectation directe`, `round-robin " et "moins occupée". 

Seulement  le premier e-mail dans ce fil crée un nouveau cas. 

Tous les suivants seront liés à l'enregistrement de cas existant et affichés dans son panneau courant.

Lorsque les utilisateurs souhaitent envoyer une réponse au client dont ils ont besoin pour s'assurer que l'affaire est
sélectionné en tant que parent de l'e-mail qui est envoyé. Elle permettra de rendre le client à répondre à l'e-mail de groupe
de s’adresses plutôt que propres à l'utilisateur.

Les Comptes Du Courriel Personnel 

Les utilisateurs peuvent configurer leurs propres comptes de messagerie qui doivent être surveillés. E-Mails > En Haut À 
Droite Du Menu Déroulant > Comptes De Messagerie Personnel. L'administrateur peut aussi  gérer les comptes du courrier 
electronique des utilisateurs des comptes.


Des Filtres de courrier electronique

Ceux-ci  permettent le filtrage des e-mails entrants en fonction de certains critères. E. g. 
Si vous ne voulez pas que les messages de l’annonce envoyée par certaines applications soient importés dans EspoCRM, vous 
pouvez créer un filtre pour que EspoCRM les passe


Administrateur  peut composer des filtres globaux appliqués à tous les comptes de messagerie. Les utilisateurs peuvent créer
des filtres pour leur compte de messagerie personnel et pour la boîte de réception 


