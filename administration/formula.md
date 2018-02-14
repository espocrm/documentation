# Les Champs Calculés (Formule)

Dans le gestionnaire d'entités, il est possible de définir un script (formule) pour le type d'entité. Ce script sera exécuté à chaque fois avant d'enregistrement. 
Il fournit une capacité de régler automatiquement certains champs (attributs) avec les valeurs obtenues à partir du calcul.

Pour modifier la formule de suivre l'Administration > Gestionnaire d'Entité > menu déroulant à droite sur la ligne de l'entité > Formule.

Vous pourriez aussi avoir à définir des champs, qui sont censés être calculé, en Lecture seule via le Gestionnaire d'entités.


## La syntaxe

EspoCRM formule est écrite dans un langage simple, conçu spécifiquement pour cette fonction.

Il y a des opérateurs, des fonctions d'attributs et de valeurs qui peuvent être utilisées dans la formule. Séparés les expressions doivent être délimitées par le caractère `;`.

### Les opérateurs

* ` = ` affectation.
* `||` - OU logique,
* `&&` - logique ET,
* `!` - NON logique,
* `+`- numérique de sommation,
* `-` - numérique soustraction,
* `*` - numériques de multiplication,
* ` / ` numériques de la division,
* `%` - numérique modulo,
* `==` - comparaison égale,
* `!=` - comparaison pas d'égal à égal,
* `>` - comparaison de plus de,
* `<` - comparaison de moins de,
* `>=` - comparaison plus grand ou égal,
* `<=` - comparaison inférieur ou égal à égal.

La priorité des opérateurs:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Attributs

Les attributs représentent des valeurs des champs de l'entité cible. Vous pouvez insérer des attributs disponibles en cliquant sur le bouton "plus".

Il est possible d'accéder aux attributs des entités associées avec le format suivant `linkName.nom de l'attribut`.


### Fonctions

Format de fonctionnement utilisation: "groupName\functionName(argument1, argument2, ..., argumentN)`.

Out-of-the-box les fonctions sont listées ci-dessous.

#### ifThenElse
`ifThenElse(à l'ÉTAT, à la suite, ALTERNATIVE)` Si la CONDITION est remplie, puis faire CONSÉQUENTE. Si pas, alors n'ALTERNATIVE.

#### ifThen
`ifThen(à l'ÉTAT, à la suite) " Si la CONDITION est remplie, puis faire CONSÉQUENTE. Si non -- ne rien faire.

#### chaîne de caractères\concaténer(
`string\concaténer(STRING_1, STRING_2)` Concatène deux chaînes ou plus.

#### chaîne de caractères\sous-chaîne
`string\substring(CHAÎNE, DÉBUT, LONGUEUR)` Extrait les caractères d'une CHAÎNE en position de DÉPART et la LONGUEUR.

Si la LONGUEUR est omis, la sous-chaîne commençant du DÉBUT jusqu'à la fin de la CHAÎNE sera retournée.

Si la LONGUEUR est négatif, alors que le nombre de caractères doit être omis de la fin de la CHAÎNE.

#### chaîne de caractères\\garniture
`string\trim(STRING)` Bandes les espaces de début et de fin de CHAÎNE.

#### chaîne de caractères\\minuscules
`string\minuscules(STRING) " Convertit les lettres en minuscules. (depuis la version 5.0.0)

#### chaîne de caractères\\majuscules
`string\majuscules(STRING) " Convertit les lettres majuscules. (depuis la version 5.0.0)

#### datetime\\aujourd'hui
`datetime\today()` Retourne la date du jour.

#### datetime\maintenant
`datetime\now()` Retourne actuel datetime.

#### datetime\format
`datetime\format(VALEUR, [FUSEAU horaire], [FORMAT]) " Convertit la date ou datetime VALEUR en chaîne de caractères formatée en fonction des paramètres d'application. Le FUSEAU horaire et le FORMAT peut être omis. Si le FUSEAU horaire est omis, alors fuseau horaire par défaut sera utilisé. Si le FORMAT est omis, alors le format par défaut sera utilisé.

#### datetime\date
`datetime\date(VALEUR, [FUSEAU horaire])` Retourne la date du mois (1-31). `0` si la VALEUR est vide. Si le FUSEAU horaire est omis, alors le système de fuseau horaire est utilisé. (depuis la version 4.7.0)

#### datetime\mois
`datetime\mois(VALEUR, [FUSEAU horaire])` Retourne le mois (1-12). `0` si la VALEUR est vide. Si le FUSEAU horaire est omis, alors le système de fuseau horaire est utilisé. (depuis la version 4.7.0)

#### datetime\année
`datetime\an(VALEUR, [FUSEAU horaire])` Retourne l'année. `0` si la VALEUR est vide. Si le FUSEAU horaire est omis, alors le système de fuseau horaire est utilisé. (depuis la version 4.7.0)

#### datetime\heure
`datetime\heure(VALEUR, [FUSEAU horaire])` Retourne l'heure (0 à 23). `-1` si la VALEUR est vide. Si le FUSEAU horaire est omis, alors le système de fuseau horaire est utilisé. (depuis la version 4.7.0)

#### datetime\minutes
`datetime\minutes(VALEUR, [FUSEAU horaire])` Retourne minute (0 à 59). `-1` si la VALEUR est vide. Si le FUSEAU horaire est omis, alors le système de fuseau horaire est utilisé. (depuis la version 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALEUR, [FUSEAU horaire])` Retourne le jour de la semaine (0-6). `-1` si la VALEUR est vide. `0` - pour le dimanche. Si le FUSEAU horaire est omis, alors le système de fuseau horaire est utilisé. (depuis la version 4.7.3)

#### datetime\diff
`datetime\diff(VALEUR_1, VALUE_2, INTERVAL_TYPE)` Renvoie la différence entre deux dates ou datetimes. INTERVAL_TYPE peut être 'ans', 'mois', 'jours', 'heures', 'minutes'. Renvoie "null" si l'échec. Le résultat sera négatif si VALEUR_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALEUR, MINUTES) " Ajoute MINUTES de VALEUR de type datetime. Procès-verbal peut être négatif.

#### datetime\addHours
`datetime\addHours(VALEUR, HEURES)` Ajoute des HEURES de VALEUR de type datetime. Les HEURES peuvent être négatifs.

#### datetime\addDays
`datetime\addDays(VALEUR, JOURS)` Ajoute des JOURS de la date ou datetime. JOURS peut être négatif.

#### datetime\addWeeks
`datetime\addWeeks(VALEUR, SEMAINES)` Ajoute SEMAINES à la date ou datetime. SEMAINES peut être négatif.

#### datetime\addMonths
`datetime\addMonths(VALEUR, MOIS)` Ajoute MOIS à la date ou datetime. Le MOIS peut être négatif.

#### datetime\addYears
`datetime\addYears(VALEUR, en ANNÉES)` Ajoute des ANNÉES à la date ou datetime. ANS peut être négatif.

#### datetime\plus proche
`datetime\la plus proche(VALEUR, TYPE, CIBLE, [IS_PAST], [FUSEAU horaire])` Retourne le plus proche de la date ou datetime de la VALEUR fondée sur des arguments passés. (depuis la version 5.0.0)

TYPE peut prendre l'une des valeurs suivantes: 'le temps', 'minute', 'heure', 'jour', 'mois', 'dayOfWeek'. La CIBLE est une valeur de type entier ou une chaîne de valeur. IS_PAST moyens pour trouver le plus proche dans le passé. Si le FUSEAU horaire est omis, alors fuseau horaire par défaut est utilisé.

Exemples:

`datetime\la plus proche(datetime\now(), 'heure', '20:00')` Sera de retour le plus proche de la valeur de type datetime dans l'avenir à 20:00 le temps.

`datetime\la plus proche('2017-11-20', 'date', 1, true)` Sera de retour `2017-11-01", le premier jour du mois. 

`datetime\la plus proche(datetime\now(), 'dayOfWeek', 1)` Sera de retour le lundi suivant (le début de la journée). 

#### nombre\format
le nombre\(format de VALEUR, [DÉCIMALES], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Convertit une VALEUR numérique en chaîne de caractères formatée selon un format spécifique ou par défaut des paramètres de l'application. Si DÉCIMALES, DECIMAL_MARK OU THOUSAND_SEPARATOR puis paramètres système par défaut sont utilisés.

Exemples:

le nombre\format(2.666667, 2)` - les résultats de 2,67;

le nombre\format(1000, 2)` - les résultats de 1 000.00;

le nombre\(format 10.1, 0)` - résultats 10.


#### nombre\abs
le nombre\abs(VALEUR)` valeur Absolue. Retourne null si la VALEUR n'est pas numérique.

#### nombre\ronde
le nombre\round(VALEUR, PRÉCISION)` Retourne la valeur arrondie de la VALEUR spécifiée de la PRÉCISION (nombre de chiffres après la virgule). La PRÉCISION peut également être négatif ou égal à zéro (valeur par défaut).

#### nombre\étage
le nombre\étage(VALEUR)` Retourne le prochain plus faible valeur entière par arrondissement à la baisse de la valeur si nécessaire. (depuis la version 4.9.0)

#### nombre\ceil
le nombre\ceil(VALEUR)` Retourne la prochaine plus haute valeur entière en arrondissant la valeur si nécessaire. (depuis la version 4.9.0)

#### entity\isNew
`entity\isNew()` Retourne TRUE si l'entité est nouveau (en cours de création) et FALSE sinon (mis à jour).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUT)` Retourne TRUE si l'ATTRIBUT de l'entité a été modifiée.

Exemple:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUT)` retourne TRUE si l'ATTRIBUT de l'entité n'a pas été modifié.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUT)` Attribut qui a été définie lors de l'entité cible a été extraite de la base de données. Avant il a été modifié.

Exemple:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LIEN, ID)` Ajoute l'ID de Lier Plusieurs domaine. Par exemple, ajouter "someTeamId" pour les équipes de terrain". 

`entity\addLinkMultipleId(LIEN, ID_LIST)` Ajoute la liste des ids. (depuis la version 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LIEN, ID)` Vérifie si le Lien de Multiples champ ID spécifique.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LIEN, ID)` Supprime l'ID à partir du Lien sur Plusieurs champs.

#### entity\isRelated
`entity\isRelated(LIEN, ID)` Vérifie si la cible entité est liée à une autre entité représentée par LIEN et ID.

#### env\userAttribute
"env\userAttribute(ATTRIBUT)` Retourne l'ATTRIBUT de l'utilisateur actuel.

#### liste
liste(VALEUR 1, ... VALEUR-N)` Retourne un tableau. (depuis la version 4.7.0)

#### tableau\inclut
le tableau\inclut(LISTE, VALEUR)` Retourne true si la LISTE contient une VALEUR. Peut être utilisé pour le Tableau et Multi-champs de type Enum. (depuis la version 4.7.0)

#### tableau\push
le tableau\push(LISTE, VALEUR1 [, VALUE2,...]) ` Ajoute un ou plusieurs éléments à la fin d'un tableau et renvoie la nouvelle tableau. (depuis la version 5.0.0)

#### tableau\longueur
le tableau\longueur(LISTE)` Renvoie nombre d'éléments dans la LISTE. (depuis la version 4.8.1)


### Valeurs

* Les chaînes de caractères. E. g. 'une chaîne de caractères';
* Des nombres entiers. E. g. 1, 100, 40300.
* Les nombres réels. E. g. 5.2.

### Variables

Il est possible de définir des variables dans la formule.
``
$someVariableName = 'Test';
description = $test;
``


## Exemples

``
ifThen(
entity\isNew() && assignedUserId == null,
assignedUserId = 'managerId'
);

ifThen(
entity\isNew() && closeDate == null && phase == 'Fermé Gagné",
datetime\today()
);
``

``
montant = produit.listPrice - (produit.listPriceConverted * rabais / 100.0);
amountCurrency = 'USD';
``

``
someField = string\concaténer(prénom, " '", middleName, "' ", nom);
``

``
ifThenElse(
entity\isNew() && status == 'Prévu' && dateStart == null,
dateStart = datetime\addDays(datetime\now(), 10),
ifThen(
status == 'Lieu' && dateStart == null,
dateStart = datetime\now()
)
);

``

## À l'aide de la formule dans les flux de travail

Vous pouvez utiliser la formule du flux de travail de conditions et d'actions. Voir [les flux de travail de documentation](flux de travail.md) pour plus d'informations.
