# Business Process Management
  Gestion des processus métier 

Business Process Management (BPM) tool provides the ability to model and automate business processes in EspoCRM. It's an engine 
executing business processes described in BPMN 2.0 standard. BPM tool is available in [Advanced Pack](https://www.espocrm.com/
extensions/advanced-pack/) extension.

L'outil de gestion des processus métier (BPM) fournit la capacité de modéliser et d'automatiser les processus métier dans 
EspoCRM. C'est un moteur exécutant des processus métier décrits dans la norme BPMN 2.0. L'outil BPM est disponible dans  
[Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) extension.

![BPM example](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/bpm-1.png)

### Difference from Workflows tool
    Différence de l'outil des flux de travail 

Workflows tool is intended for automation of simple business rules, w/o sequential flow items, when there is no need to display
the flow graphically.

L'outil des flux de travail est destiné à l'automatisation de règles métier simples, sans éléments de flux séquentiels, lorsqu
'il n'est pas nécessaire d'afficher graphiquement le flux.

BPM tool is intended for more complex business flows, where there can be diverging and converging flows, execution delays, user
interactions. A flowchart view makes the business process more comprehensible for a human, a log allows to see how the process 
was held.

L'outil de gestion des processus métier (BPM) est destiné à des flux métier plus complexes, avec des flux divergents et
convergents, des retards d'exécution et des interactions utilisateur. Une vue d'organigramme rend le processus métier plus
compréhensible pour un humain, un journal permet de voir comment le processus a été tenu.

## Process Flowcharts
   Graphiques de flux des processus

The link to process flowcharts is available from administration panel. It also can be added as a tab on the navigation panel.

Le lien vers les graphiques de flux des processus est disponible depuis le panneau d'administration. Il peut également être
ajouté comme un onglet sur le panneau de navigation.

Flowcharts are intended for business processes modeling. Administrator can create and edit flowcharts. Regular users can only
view flowcharts.

les graphiques de flux sont destinés à la modélisation des processus métier. L'administrateur peut créer et modifier les
graphiques de flux.Les utilisateurs réguliers ne peuvent voir que les graphiques de flux.

Every flowchart has its specific entity type (Target Type field). The flowchart determines execution of future process 
instances. It comprises flowchart elements and connections between elements.

Chaque graphique de flux a son type d'entité spécifique (champ Type de cible). le graphique de flux détermine l'exécution 
des futures instances de processus. Il comprend des éléments des graphiques de flux  et des connexions entre les éléments.

If process flowchart has the unchecked 'Is Active' field then it won't initiate process instances.

Si les graphiques de flux de processu a le champ "Actif" non coché, alors il n'initiera pas d'instances de processus

To show details and parameters of a certain flowchart element you need to click on it. In edit mode you will be able to edit
parameters.

Pour afficher les détails et les paramètres d'un certain élément du graphique de flux  , vous devez cliquer dessus. En mode 
d'édition, vous serez en mesure d'éditer les paramètres.

## Processes
   Processus
Processes are available from administration panel. The link also can be added as a tab on the navigation panel.

Les processus sont disponibles depuis le panneau d'administration. Le lien peut également être ajouté sous la forme d'un onglet
dans le panneau de navigation.

Process represents business process instance. When it's initiated it gets the status 'Started'. When process is finished it gets
the status 'Ended'. The process can also be stopped manually by a user who has an access to edit the process. If it's stopped 
manually it gets status the 'Stopped'.

Le processus représente l'instance de processus métier. Quand il est lancé, il obtient l'etat 'Démarré'. Lorsque le processus
est terminé, il obtient l'etat 'Terminé'. Le processus peut également être arrêté manuellement par un utilisateur qui a un 
accès pour modifier le processus. Si il est arrêté manuellement, il obtient l'etat "Arrêté".

The process is executed according the flowchart. Flowchart of process can't be changed after process is started.

Le processus est exécuté selon le graphique de flux.Le graphique de flux du processus ne peut pas être changé après que le 
processus
demarre.

The process obligatorily is related to single target record.

Le processus est lié  obligatoirement à un enregistrement cible unique.

Processes can be started automatically (upon specific conditions or by scheduling) or manually (where there is at least one
Start Event in the flowchart). To start process manually the user needs to click 'Start Process' button on the list view of
processes.

Le processus peut être démarré automatiquement (selon des conditions spécifiques ou par la planification) ou manuellement 
(lorsqu'il y a au moins un événement de démarrage dans le graphique de flux). Pour démarrer le traitement manuellement, 
l'utilisateur doit cliquer sur le bouton «Démarrer le processus» dans la liste des processus.

## Flowchart Elements
   Eléments de graphique de flux

### Events
    Événements

Events are displayed on a flowchart as circles.
Les événements sont affichés sur un graphique de flux comme des cercles

#### Start Event
     Démarrer l'événement

Doesn't have parameters. It's a starting point of the process. Start Event can be initiated manually by a user who has an access
to create processes. The user needs to click  'Start Process' button on the list view of processes.

Il n'a pas de paramètres. C'est un point de départ du processus. L'événement de début peut être initié manuellement par un 
utilisateur qui a un accès pour créer des processus. L'utilisateur doit cliquer sur le bouton "Démarrer le processus" sur la
vue liste des
processus.


#### Conditional Start Event
     Événement de démarrage conditionnel

A starting point of the process. It's supposed to be triggered automatically when specified conditions are met. There are two 
types of trigger: 'After record created', 'After record saved'.

Un point de départ du processus. Il est censé d'être déclenché automatiquement lorsque les conditions spécifiées sont remplies.
Il existe deux types de déclencheurs: 'Après enregistrement créé'', 'Après enregistrement effectué'.

#### Timer Start Event
     L'événement de démarrer de minuteur

A starting point of the process. It initiates processes by scheduling. You need to specify the list report that returns records
for initiating processes and scheduling in crontab notation.

Un point de départ du processus. Il initie les processus en ordonnant. Vous devez spécifier le rapport de liste qui renvoie les
enregistrements pour initier les processus et la planification dans la notation crontab.

#### Conditional Intermediate Event
     Événement intermédiaire conditionnel

This event stops the flow until specified criteria is met.

Cet événement arrête le flux jusqu'à ce que la critère spécifiée soit remplie.

#### Timer Intermediate Event
     Événement intermédiaire de minuterie

This event stops the flow and waits as long as is specified by event's parameters.

Cet événement arrête le flux et attend aussi longtemps que spécifié par les paramètres de l'événement

For more complex timer settings you can utilize [formula](formula.md). Formula scripts should return Date-Time value (in UTC 
timezone). Once this time comes the flow will be proceeded to the next element.

Pour les paramètres de minuterie plus complexe, vous pouvez utiliser [formula](formula.md). Les scripts de formule doivent
renvoyer la valeur date-heure (dans le fuseau horaire UTC). Une fois ce temps venu, le flux sera dirigé vers l'élément suivant.

By utilizing datetime\closest formula function it's possible to set the timer to a specific time in the future, e.g. the begin
ning of the next working day.  
En utilisant heuredatele\plus proche fonction de formule, il est possible de régler la minuterie à une heure spécifique dans le
futur, par ex. le début de la prochaine journée de travail.

#### End Event
     Fin d'événement

Ends the current flow. It doesn't end flows running in parallel. When the flow reaches the end event and there is no anything 
running in parallel then process ends.

Terminer le flux actuel. Il ne met pas fin aux flux en parallèle. Lorsque le flux atteint l'événement de fin et qu'il n'y a 
plus rien en parallèle, le processus se termine.

#### Terminate End Event
     Terminer l'événement de fin

Ends all flows. Process is subsequently ended.

Terminer tous les flux. Le processus est ensuite terminé.

### Gateways
    Passerelles

Gateways are displayed as diamonds.

Les passerelles sont affichées comme des diamants.

#### Exclusive Gateway
     Passerelle exclusive

Can diverge or converge flows.

Peut diverger ou converger des flux.

In case of diverging it defines a single flow (path) that will be chosen according specified criteria. The first met condition
determines the flow, next conditions are omitted. There is an ability to specify default flow. Default flow is chosen if there
are no any met conditions. Default flow is marked with a slash sign.


En cas de divergence, il définit un seul flux (chemin) qui sera choisi en fonction de critères spécifiés. La première condition
rencontrée détermine le flux, les conditions suivantes sont omises. Il est possible de spécifier le flux par défaut. Le flux par
défaut est choisi s'il n'y a pas de conditions rencontrées. Le flux par défaut est marqué d'un slash.

In case of converging it just directs the flow to the outgoing element. It doesn't get blocked after the flow come though, so 
parallel flows won't be merged into the single flow.

En cas de convergence, il dirige simplement le flux vers l'élément sortant. Il ne se bloque pas après le flux, donc les flux 
parallèles ne seront pas fusionnés dans le flux unique.

![exclusive gateway divergent](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inclusive Gateway
     Passerelle inclusive

Can diverge or converge flows.

Peut diverger ou converger les flux

In case of diverging, it can direct to one or multiple parallel flows (paths), depending on accomplishment of criteria of each 
flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

En cas de divergence, il peut diriger vers un ou plusieurs flux parallèles (chemins), en fonction de l'accomplissement des 
critères de chaque flux. Le flux par défaut est choisi s'il n'y a pas de conditions rencontrées. Le flux par défaut est marqué

d'un slash.

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway you need to use a converging inclusive
gateway. It will wait for all incoming flows and then continue to the outgoing element.

S'il est nécessaire de fusionner des flux parallèles produits par une passerelle inclusive divergente, vous devez utiliser une 
passerelle inclusive convergente. Il attendra tous les flux entrants puis continuera vers l'élément sortant.

![inclusive gateway](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-inclusive.png)

Note: Diverging and converging gateways must be balanced.

Remarque:Les passerelles convergentes et divergentes doivent être équilibrées

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will 
be blocked. Avoid a flowchart design that can bring about such a situation.

Remarque: Si l'un des flux parallèles a été arrêté pour une raison quelconque, la passerelle divergente ne sera jamais traitée.
Le processus sera bloqué. Évitez d'une conception de Graphique de flux qui peut entraîner une telle situation.

#### Parallel Gateway
     Passerelle parallèle

Can diverge or converge flows.

Peut diverger ou converger des flux.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

En cas de divergence, il divise le flux en plusieurs flux parallèles. Il n'y a pas de paramètres pour ce type de passerelle.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

En cas de convergence, il attend jusqu'à ce que tous les flux entrants arrivent, puis il continue vers l'élément sortant suivant.


![parallel gateway](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-parallel.png)

Note: Diverging and converging gateways must be balanced.

Remarque: les passerelles convergentes et divergentes doivent être équilibrées.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will
be blocked. Avoid a flowchart design that can bring about such a situation.

Remarque: Si l'un des flux parallèles a été arrêté pour une raison quelconque, puis la passerelle divergente ne sera jamais 
traitée. Le processus sera bloqué. Évitez d'une conception de graphique de flux qui peut entraîner une telle situation.

#### Event Based Gateway
     Passerelle basée sur l'événement

Can only diverge flows.

Peut seulement diverger les flux.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing 
events get rejected.

Il arrête le flux jusqu'à ce que l'un des événements sortants soit déclenché. L'événement déclenché détermine le flux unique. 
Les autres événements sortants sont rejetés.

Only intermediate events can be on the other end of outgoing sequence flows.

Seulementles événements intermédiaires peuvent se trouver à l'autre extrémité des flux de séquence sortants

![event based gateway](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-event-based.png)

### Activities
    Activités

Activities are displayed as rounded rectangles.

Les activités sont affichées comme de rectangles arrondis

#### Task

Task can execute following the actions:
* Create Record - creates new record of any entity type;
* Create Related Record - creates new record related to the target record;
* Update Target Record;
* Update Related Record - updates the record or records related to the target record;
* Update Created Record - updates specific field of any record created in the current process;
* Update Process Record - can be used to assign the process to specific user or team;
* Link to Another Record - links the target record with a specified record;
* Unlink from Another Record - unlinks the target record from the specified record;
* Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the 
specific rule;
* Create Notification - creates in-app notification for specific users;
* Make Followed - makes specific users follow the target record, the process record or any record created by the process;
* Run Service Action - runs custom service actions implemented by developers.
    
    Tâche
La tâche peut exécuter suivant des actions:
* Créer l'enregistrement - crée un nouvel enregistrement de tout type d'entité;
* Créer l'enregistrement associé - crée un nouvel enregistrement lié à l'enregistrement cible
* Mettre à jour l'enregistrement cible;
* Mettre à jour l'enregistrement associé 
* Mettre à jour l'enregistrement créé - mets à jour le champ spécifique de tout enregistrement créé dans le processus en cours
* Mettre à jour l'enregistrement du processus - peut être utilisé pour affecter le processus à un utilisateur ou une équipe 
spécifique;
* Lien vers un autre enregistrement - lie l'enregistrement cible avec un enregistrement spécifié;
* Dissocier d'un autre enregistrement - dissocie l'enregistrement cible de l'enregistrement spécifié;
* Appliquer la règle d'affectation - assigne l'enregistrement cible, l'enregistrement du processus ou tout enregistrement créé
par le processus en fonction de la règle spécifique;
* Créer une notification - crée une notification intégrée à l'application pour des utilisateurs spécifiques
* Faire suivre -fait suivre à des utilisateurs spécifiques l'enregistrement cible, l'enregistrement de processus ou tout enregis
trement créé par le processus
* Exécuter l'action de service -exécute des actions de service personnalisées implémentées par les développeurs.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

Les actions disponibles pour la tâche sont presque les mêmes comme dans la fonctionnalité de flux de travail  Voir plus de 
détails sur [les actions de flux de travail] (workflows.md # actions).

#### Send Message Task

Sends email message to specific recipient.

#### User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment 
rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: 
Approve, Review, Accomplish.

* Approve type requires the user to chose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.


The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable 
email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification

in the process flow.

#### Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available 
within the process.

### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#condition
s).

## Examples

### Example 1

![Example 1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-2.png)

### Example 3.

![Example 3](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-3.png)
