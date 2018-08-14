# Manageur d'Entité

Le Manageur d'Entité est disponible dans le panneau de configuration Administratif. Il donne la possibilité de modifier votre instance d'EspoCRM. Vous pouvez ainsi accomplir les actions suivantes :

* Ajouter de nouveaux types d'entités;

* Customiser les types d'entités existantes: Changer les dénominations, l'ordre par défaut dans la vue liste, activer ou désactiver un courant.

* Configurer les champs : Ajouter de nouveaux champs, customiser les champs existants.

* Configurer les relations : Ajouter de nouvelles relations, changer les dénominations des relations existantes.

 
## Création De Nouvelles Entités

Cliquez sur le bouton 'Créer une Entité' ou `Create Entity` sur la page du Manageur d'Entité. Spécifiez le nom, les dénominations et le type. Si le type d'entité que vous choisissez est 'Personne' ou 'Person', votre entité aura des champs pour un Email, Téléphone, Prénom, Nom de Famille et Salutation. Cochez 'Courant' ou 'Stream' si vous voulez que votre entité ait un panneau de configuration courant et si vous voulez que les utilisateurs puissent suivre les entités de ce type.

 
Types :

* Base - Entité vide ayant seulement des champs basic comme Nom, Utilisateur Assigné, Equipes, Description.

* Base Plus - Similaire au type Base mais avec les champs Activités, Historique, panneaux de Taches (disponible depuis la version 4.3.0).

* Evènement - Champs pour Date de Début, Date de Fin, Durée, Parent et Statut. Disponible en Calendrier et dans le panneau des Activités (depuis la version 4.3.0, doit être activée avec Administration > Réglages) 

* Personne - Champs pour Email, Prénom, Nom de Famille, Salutation, et Adresse. Panneau pour les Activités, l'Historique, et les Taches.

* Compagnie - Champs pour l'Email, le Téléphone, l'Adresse de Facturation, Adresse de Livraison. Panneaux pour les Activités, l'Historique, et les Taches.

 
## Mettre À Jour Une Entité Existante

Si vous cliquez sur le lien 'Modifié' ou 'Edit' sur une entité particulière, vous aurez la possibilité de changer certains des paramètres de cette entités.

* Dénominations - Nom de l'entité au singulier ou au pluriel.

* Les données de l'ordre par défaut sont organisées dans la vue liste.

* Courant ou Stream - Indique si le Courant ou Stream est actif pour cette entité.

* Désactivé - Vérifie si vous n'avez pas besoin de cette entité dans votre système.

* Champs de Filtrage Textuel - Dans quels champs la recherche doit être effectuée pour le filtre textuel principal et la recherche globale.
 

## Champs 

Cliquer sur le lien 'Champs' ou 'Fields' vous emmènera à une page différente. Sur cette page, vous aurez la possibilité de créer de nouveaux champs ou de mettre à jour des champs existants. Les types de champs suivants sont disponibles dans le Manageur d'Entité.

* Adresse - adresse incluant la rue, la ville, l'état, le code postale et le pays ;

* Série - Liste de valeurs, avec capacité de sélectionner multiples valeurs (pas une bonne option si vous avez besoin de faire une recherche basée sur ce champ) ; les utilisateurs peuvent ajouter leurs propres valeurs s'il n'y a pas d'option spécifiées.

* Attachement Multiples - attachement de fichiers multiples;

* Auto-increment ou Incrément -Automatiques - ne fait la lecture que de nombres générés;

* Boolean ou Booléen - case à cocher, vrai ou faux;

* Monnaie - pour les valeur monétaires;

* Date; 

* DateTime;

* Enum - case à sélectionner, avec la possibilité de ne sélectionner qu'une seule valeur;

* File ou Fichier - Mise en ligne d'un fichier;

* Float ou Nombre Flottant - nombre ayant une portion décimale; 

* Foreign ou Etranger - Un champ d'une entité reliée;

* Image - Mise en ligne d'une image avec un aperçu de l'image;

* Integer ou Nombre Entier - nombre entier;

* Nombre - incrémentation automatique du nombre du type de série avec un préfixe possible et d'une longueur spécifique;

* Multi-enum - Liste de valeur, avec la capacité de choisir de multiples valeurs (pas une bonne option si vous devez faire une recherche basée sur ce champ), similaire a la Série mais en plus joli. 

* Text ou Texte - section texte, pour des textes longs de plusieurs lignes ;

* Url - pour les liens;

* Varchar - texte court;

* Wysiwyg - Similaire au champ de texte, avec la possibilité de formater le texte;


Paramètres:

* Requis - si le remplissage du champ est obligatoire.

* Valeur Par Défaut - La valeur du champ établie lors de la création de la donnée.

* Audité - les mises à jour du champ seront enregistrées dans le Courant ou Stream.

**Remarque**: Après avoir ajouté un nouveau champ, vous devez mettre ce champ sur les plans ou [layouts](layout-manager.md) (Administration > Layout Manager ou Manageur des Plans)


### Logique Dynamique

Donne la possibilité de rendre les formulaires dynamiques. Il est possible de définir des conditions rendant certains champ visibles, requis, ou en lecture simple. Les conditions seront vérifiées automatiquement lorsque l'information dans le formulaire est modifiée.

Pour Enum, la Série, et les champs Multi-Enum, il est possible de définir différentes collections d'options qui seront disponibles en fonction de la condition remplie. Obtenez plus d'informations [ici](dynamic-logic.md). 


## Relations

Vous pouvez créer de nouvelles relations entre les entités out-of-box et les entités customisées. Il y a 3 types de relations disponibles:

* One-to-Many ou Un-à-Plusieurs: après avoir créé cette relation, vous pouvez mettre un champ lien au plan détaillé de l'entité de droite et ajouter un panneau de relation à l'entité de gauche;

* Many-to-One ou Plusieurs-à-Un: le même que celui du Un-à-Plusieurs mais en vice versa;

* Many-to-Many ou Plusieurs-à-Plusieurs: panneaux de relations sur les deux côtés.

Le paramètre 'Link Multiple Field' indique qu'un champ de type 'LinkMultiple' sera créé de même qu'une relation. Vous pouvez ajouter ce type de champ au plan. Il rend plus aisée le choix rapide de données reliées. Ceci n'est pas une bonne option si votre relation est sensée contenir une multitude de données qui peuvent ralentir le chargement de la vue détaillée de l'écran.

Si le paramètre 'Audité' ou 'Audited' est coché, les mises à jours de la relation seront enregistrées dans le Courant ou Stream.
