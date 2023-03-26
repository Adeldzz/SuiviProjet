<?php

$enseignant = "";
$liste= "";
$projet = "";
$jalon="";



$res= get_nom_encadrant();

if($res == null) 
		{
			$res = "Aucune table n'a été trouvée dans la base de données !";
		}
        else {
            $enseignant = $res;
        }



        if($liste == null) 
		{
			$liste = "Aucune table n'a été trouvée dans la base de données !";
		}






/* On test qui le 'encadrant' est définie   */
if(isset($_POST['encadrant'])) {
    
    //var_dump($_POST['encadrant']);

/* on stocke le resultat de la fonction qui nous renvoie la liste des projet en lui passant le POST en parametre qui est le nom recherché par la requete SQL */

    $var = get_liste_projet($_POST['encadrant']);

/* test si va est null sino non l'affacte a $liste qui lui sera renvoyé a la vue */
    if($var == null){
		$liste = "la table est vide !";
	}else{
        $liste = $var;
	}
    //var_dump($liste);
    
    /* récuperation de la premiere clé de la tabe */
    if($var !== '') {
        $keyStats = array_keys($var[0]);
    }

    /* on stocke toujours le dernier post dans $val pour l'utiliser dans la vu pour que la value de l'option se mette a jour en focntion de la valeur de POST */
    $val = $_POST['encadrant'];
    //var_dump($liste);

}






    $abd = get_jalon_projet(10);
if($abd == null){
    $projet = "la table est vide !";
}else{
    $projet = $abd;
}
if($abd !== '') {
    $cle = array_keys($abd[0]);
}



