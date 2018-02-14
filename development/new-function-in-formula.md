# Définition de nouvelles fonctions pour la Formule

EspoCRM offre la possibilité de créer des fonctions personnalisées qui peuvent être utilisés dans la formule. 

Si votre fonction est liée à l'un des groupes comme la Chaîne, de la Logique, de la Date, de créer un fichier dans __{GroupName}Group__ dossier, nommé __{Nomfonction}Type.php__ __{Nomfonction}Type__ déclaration de la classe. Vous devez définir la méthode __'processus'__.

Par exemple, nous allons créer une nouvelle chaîne de fonction permettant de vérifier si une chaîne de caractères (MEULE de foin) contient une autre chaîne (à l'AIGUILLE) avec un possible décalage (OFFSET).

Créer un fichier `application/Espo/Core/Formula/Functions/StringGroup/ContainsType.php " avec le code:

``
espace de noms Espo\Core\Formule\Fonctions\StringGroup;

utiliser \Espo\Core\Exceptions\Erreur;

classe ContainsType s'étend \Espo\Core\Formule\Fonctions\Base
{
public function process(\StdClass $item)
{
if (!property_exists($article, 'valeur')) {
throw new Error();
}

if (!is_array($item->valeur)) {
throw new Error();
}

if (count($item->valeur) < 2) {
throw new Error();
}

 $botte de foin = $this->évaluer($item->valeur[0]);
$needle = $this->évaluer($item->valeur[1]);

if (count($item->valeur) > 2) {
$offset = $this->évaluer($item->valeur[2]);
de retour !(strpos($haystack, $aiguille, $offset) === false);
} else {
de retour !(strpos($haystack, $aiguille) === false);
}
}
}
``
## Ajout de la fonction à la liste

Pour ajouter à la création de la fonction de la liste des fonctions de la formule, créer un fichier " custom/Espo/Custom/Ressources/métadonnées/app/formule.json " et ajoutez le code:
``
{
"functionList": [
{
"nom": "string\\contient",
"insertText": "string\\contient(la botte de FOIN, AIGUILLE, OFFSET)"
}
}
``

__"Vider le cache" __ et de l'utilisation de cette fonction dans la formule. Vous pouvez taper " string\contient(la botte de FOIN, AIGUILLE, OFFSET) ou sélectionner à partir de la fonction de la liste, si vous l'ajoutez.
