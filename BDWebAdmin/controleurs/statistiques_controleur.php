<?php 
// ini_set('display_error',1); ?>
<?php 
$message = "";
$stats = "";


	// TODO

	


		
		if($stats == null) 
		{
			$message = "Aucune table n'a été trouvée dans la base de données !";
		}
			if(isset($_POST['boutonstats'])) 
			{

				if($_POST['boutonstats']=== 'projetsActifs'){$stats = get_projet_actifs();}
				else if($_POST['boutonstats']=== 'projetEtat') {$stats = get_etat_projet() ;}
				else if($_POST['boutonstats']=== 'equipeUE') {$stats = get_equipe_deux();}
				else if($_POST['boutonstats']=== 'projetMax') {$stats = get_max_projet();}
				else if($_POST['boutonstats']=== 'projetEnseignant') {$stats = get_enseignant_projet();}
	
				/* else if($_POST['note']=== 'projetEnseignant'){} */

				if($stats !== '') {
					$keyStats = array_keys($stats[0]);
				}
				
				$message = $stats;
				$value = $_POST['boutonstats'];
			}

				
		
 


		
	


		

		

?>