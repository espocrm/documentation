# Envoi d'Emails En Masse

## Comment envoyer des emails en masse 

Vous avez besoin d'avoir au moins une liste cible avec des informations cibles et un message préconfiguré dans votre crm.

1. Créez une nouvelle Campagne avec le statut `Email` ou `Newsletter`. Sélectionnez une ou plusieurs listes cibles dans le champ de sélection `Target Lists`.

2. Apres la création des informations de la Campagne, créez Mass Email pour cette campagne: Cliquez plus dans le panneau de Configuration Mass Email. Spécifiez une date de début avec _Date Start_ - pour définir la date d'envoi des emails, sélectionnez _Email Template_. Vérifiez que _Status_ est marqué `Pending`.

Si tout est mis en place correctement, les messages devraient être envoyés automatiquement. Ils devront être envoyés en portion et à chaque heure (vous pouvez changer la taille des portions dans Administration > Outbound Emails). L'administrateur peut le changer en mettant à jour le champ `Scheduling` à l'intérieur des taches paramétrées `Check Group Email Accounts`.

Vous pouvez vérifier l'envoi des emails à travers le panneau de configuration Log.

## Tester ce qui va être envoyer aux destinataires

Cliquez sur le menu déroulant à la droite du panneau de configuration de la rangée pour l'envoi d'emails en masse _Mass Email_. Ensuite cliquez sur _Send Test_ .

## Log

Dans le log vous pouvez voir:

* L'email envoyé;

* Les emails ouverts par le destinataire;

* Les lien cliqués par le destinataires;

* Les destinataires qui se sont désinscrits;

* Les emails retournés (non délivrés au destinataire).

## Lien de désinscription

De manière générale, la possibilité de se désinscrire sera inclue dans tous les emails envoyés. Mais vous pouvez formuler cette possibilité de se désinscrire à votre façon.

Exemple:

```html

<a href="{optOutUrl}">Unsubscribe from the mailing list.</a>

```

L'administrateur peut désactiver le lien de désinscription obligatoire ajouté au système avec Administration > Outbound Emails.

## Lien de Traçage

Si vous voulez savoir si le destinataire de votre message a ouvert le lien placé à l'intérieur de votre message, vous devez créer un lien de traçage. Spécifiez tout nom *_Name_* et lien *_URL* vers lesquels votre lien pointe. Ensuite, vous devrez coller le code généré dans votre message préconfiguré.

Exemple:

```html

<a href="{trackingUrl:55f2c87b09a220a78}">Test our demo</a>

```

## Listes Cibles

Les listes cibles contiennent les listes de comptes, contacts, leads et de données d'utilisateurs.

Les utilisateurs peuvent insérer les listes cibles manuellement en utilisant _Select_ action dans le panneau de configuration correspondant à partir de la vue détaillée des listes cibles. Il est aussi possible de filtrer et de sélectionner ensuite tous les résultats d'une recherche.

## Utiliser les Rapports pour insérer des listes cibles
