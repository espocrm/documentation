# Workflows

La fonctionnalité Workflows est disponible dans l'[Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Les Workflows permettent aisément d'automatiser votre entreprise. Vous pouvez trouver cette fonction dans le panneau de configuration Administratif. La création d'une règle pour un workflow nécessitera de définir les éléments suivants:

* Entité cible - A quel type d'entité le worklow doit être appliqué;

* Type d'élément déclencheur - Quand est ce que le workflow devra être déclenchée;

* Conditions - Conditions à remplir pour déclencher un workflow;

* Actions - Que faire si un workflow est déclenché.


## Types d'Eléments Déclencheurs

### Apres Création d'une donnée

Déclenché seulement après la création d'une donnée. Si les conditions spécifiées sont remplies, les actions seront exécutées.


### Après la Sauvegarde d'une Donnée

Déclenché lorsqu'une nouvelle donnée est créée ou lorsqu'une donnée existante est mise à jour. Si les conditions spécifiées sont remplies, les actions seront exécutées.

Les règles de workflow ayant ce type d'élément déclencheur ont communément une condition qui vérifie si certains des champs ont été changées ou 'changed'. Exemple: Si le statut du Cas a changé, alors exécute certaines actions.


### Programmé de Manière Temporelle

Déclenché en fonction du programme temporel défini. Vous pouvez l'établir pour fonctionner chaque jour, chaque semaine, etc.. Les actions seront appliquées pour des données produites par le rapport d'une liste spécifiée. Par conséquent, vous devez aussi créer le rapport d'une liste.

Le programme temporel est spécifié à partir d'une notation crontab.

```
* * * * * *
| | | | | |
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

### Séquentielle

Utilisée rarement. Supposée être lancée par un autre workflow. Donne la possibilité d'établir une logique complexe.

Remarque: pour les workflow sequenciel, il est recommandee d'utiliser l'outil BPM ou [BPM tool](bpm.md) plutôt que l'option workflow.


## Conditions

Vous pouvez spécifier les conditions qui doivent être remplies pour le déclenchement du workflow. Il y a deux manières de spécifier les conditions: avec le constructeur de condition sur Interface Utilisateur ou avec une formule.


### Constructeur de Condition sur l'Interface Utilisateur

Quelques types de condition disponibles:

* _equals_ - le champ est égal a une valeur spécifique ou égal à la valeur d'un autre champ;

* _was equal_ - le champ est égal a une valeur spécifique avant que le workflow n'ait été déclenché;

* _not equals_ - le champ n'est pas égal a une valeur spécifique ou à la valeur d'un autre champ;

* _was not equal_ - le champ n'était pas égal à une valeur spécifique avant que le workflow n'est été déclenché;

* _empty_ - la valeur du champ est vide;

* _not empty_ - la valeur du champ n'est pas vide;

* _changed_ - le champ a été modifié;

* _not changed_ - le champ n'a pas été modifié;


### Conditions Basées sur une Formule

L'utilisation d'une formule permet de définir des conditions de n'importe quelles complexités. Pour lire des informations sur la syntaxe d'une formule suivez [cet article](../../../docs/user-guide/reports.md).

Remarque : Il ne doit y avoir aucune délimitation `;` employée dans le code de la formule lorsqu'elle détermine une condition.


## Actions

### Envoyer un Email

Le système enverra un email en utilisant un message préconfiguré spécifié. L'adresse email du receveur peut être obtenue à partir des données de la cible, une donnée reliée, l'utilisateur actuel, ceux qui suivent l'utilisateur, équipe d'utilisateurs ou elle peut être spécifiée. Un message peut être envoyé immédiatement ou reportée à un intervalle spécifique.


### Créer une Donnée

Le système créera une nouvelle donnée de n'importe quelle entité. Il est possible de relier les données s'il existe une relation entre la donnée cible et la donnée créée.

Il est possible de définir une formule pour le calcul des champs.


### Créer une Donnée Reliée

Le système créera une donnée reliée à la donne cible. Il est possible de définir une formule pour le calcul des champs.


### Mise à Jour de la Donnée Cible

Permet la modification de champs spécifiques de la donnée cible. Il est possible de définir une formule pour le calcul des champs.

Si vous avez besoin d'ajouter de nouveau élément au champ Link-Multiple sans perdre des informations existantes (exemple: Equipes), vous devez utiliser une fonction formule entity\addLinkMultipleId. Exemple: `entity\addLinkMultipleId('teams', 'teamId')`.


### Mise à Jour de Données Reliées

Permet la modification de champs spécifiques des données relies ou de données. Il est possible de définir une formule pour le calcul des champs.


### Connection avec une Autre Donnée

Relie ou connecte une entité cible avec une autre entité spécifique. Exemple: ajoute une équipe spécifique à la donnée.


### Déconnection d'une Autre Donnée

Retire le lien créé entre une entité cible et une entité spécifique. Exemple: retire une équipe spécifique de la donnée.


### Applique la Règle Assignée

Assigne la donnée cible a un utilisateur à partir d'une règle de distribution. Il y a deux règles disponibles : Round-Robin et Least-Busy

* Round-Robin - les utilisateurs sont choisi du haut vers le bas d'une liste (équipe), le processus est ensuite répété.

* Least-Busy - l'utilisateur ayant le moins de données assigne sera choisi pour l'assignation.

_List Report_ - Détermine quelles sont les données à prendre en compte pour le calcul des données assignées pour la distribution Least-Busy. Exemple: Pour les Cas, seules les données ayant un statuts actif doivent être prises.


### Créer une Notification

Notifie d'un message des utilisateurs spécifiques. Il est possible d'utiliser des espaces réservés dans un message préconfigurée: {entity} - donnée cible, {user} - utilisateur présent.


### Fait Suivre

Emmène des utilisateurs spécifiques à suivre une entité cible ou une entité reliée spécifiée.


### Déclenché un Autre Workflow

Permet de créer des workflows séquentiels. Il est possible d'utiliser une conditions afin d'étendre le workflow: Vous pouvez établir le workflow de manière à déclencher deux autres workflows avec différentes conditions définie dans le workflow principal.

Il est possible de reporter l'exécution d'un workflow séquentiel. À l'intérieur du workflow séquentiel, vous pouvez définir la condition qui vérifiera si des champs spécifiés ont été modifiés depuis l'enclenchement du workflow principale en utilisant les conditions de types _Changed_ and _Was Equal_.

Remarque: Il est recommandé d'utiliser l'outil BPM ou [BPM tool](../../../docs/administration/bpm.md) pour les workflows séquentiels plutôt que l'option workflow.


### Lancer l'Action Service

Permet de lancer des scripts spécifiques de service. Les actions suivantes sont définies par défaut:

* Envoyer des Invitations - pour Rendez-Vous/Appels;

* Ajouter des éléments de Prix d'Offre - Pour les Prix d'Offres.

Les développeurs peuvent écrire leurs propres actions de services. Obtenez [plus de détails](../../../docs/development/workflow-service-actions.md).


## Emploi d'une Formule dans les Actions

Il est possible de définir une formule pour calculer les champs pour la Création d'une Donnée, la Mise A Jour D'une Donnée Cible, la Création D'une Donnée Reliée, La Mise A Jour D'une Donnée Reliée. En ce qui concerne les deux dernières, vous devez utiliser la fonction `targetEntity\attribute` pour accéder aux attribues de l'entité cible qui a été établie avant que le déclenchement du workflow.

Exemple:

```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
