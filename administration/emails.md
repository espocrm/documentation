# E-mails

> Important. [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) doivent être configurés dans votre système pour faire des e-mail à aller chercher de travail. Vous pouvez trouver les informations dans votre EspoCRM à Administration > tâches Planifiées.

## Vue d'ensemble

EspoCRM a une capacité de surveiller les boîtes aux lettres IMAP. E-mail peut être archivé de deux façons: Groupe de Comptes Mail et Comptes de Messagerie Personnels. Groupe Entrant Comptes sont destinés au groupe de boîtes aux lettres: le cas le plus fréquent est une boîte de support. Comptes de Messagerie personnels sont destinés à des utilisateurs de boîte aux lettres personnelle.

Comme e-mail est à venir, le système tente de faire le lien avec le document approprié (Comptes, de Plomb, d'Opportunité, de Cas). Les utilisateurs qui suivent ce dossier de recevoir une notification sur un nouvel e-mail dans le système, même si elles ne sont pas À ou CC.

## Groupe De Comptes De Messagerie

Seul l'administrateur peut configurer le Groupe de Comptes de Messagerie. Groupe de Comptes de Courriel peut être utilisé pour la réception et l'envoi des e-mails. L'envoi d'e-mails à partir de comptes de groupe est disponible depuis la version 4.9.0.

Les équipes de terrain qui détermine les équipes d'e-mails entrants seront affectés. 

Si le groupe compte de messagerie SMTP a et il est vérifié que la mise en commun puis un accès sera contrôlé par les Rôles à travers le Groupe Compte e-Mail d'autorisation. Les équipes de terrain sera utilisé si le niveau d'autorisation est défini à "l'équipe".

Il y a la capacité de rendre le système d'envoyer une réponse automatique pour les e-mails entrants.

## Email à l'

Il y a une option pour rendre le système de créer des cas de l'entrée du groupe e-mails. 
Cette fonctionnalité est destinée aux équipes de soutien. 
Cas peut être distribué aux utilisateurs de l'équipe en fonction de ces façons: 
`affectation directe`, `round-robin " et "moins occupée". 
Seul le premier e-mail dans le thread crée un nouveau cas. 
Chaque ultérieure sera relié à l'existant enregistrement de cas et affiché dans son Flux de panneau.

Lorsque les utilisateurs souhaitent envoyer une réponse au client dont ils ont besoin pour s'assurer que l'affaire est sélectionné en tant que parent de l'e-mail qui est envoyé. Elle permettra de rendre le client à répondre à l'e-mail de groupe d'adresses plutôt que propres à l'utilisateur.

## Comptes De Messagerie Personnels

Les utilisateurs peuvent configurer leurs propres comptes de messagerie qui doivent être surveillés. E-Mails > En Haut À Droite Du Menu Déroulant > Comptes De Messagerie Personnels. L'administrateur peut aussi gérer les e-mail des utilisateurs des comptes.

## Des Filtres E-Mail

Ceux-ci permettent le filtrage des e-mails entrants en fonction de certains critères. E. g. si vous ne voulez pas que les messages de notification envoyé par une application à être importés à EspoCRM vous pouvez créer un filtre pour EspoCRM de les ignorer.

L'administrateur peut créer des filtres globaux, applicables à tous les comptes de messagerie. Les utilisateurs peuvent créer des filtres pour leur propre compte de messagerie personnel et pour l'ensemble de la boîte de réception.
