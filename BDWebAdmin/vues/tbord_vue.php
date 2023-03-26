<?php
//ini_set('display_errors', 'off');
$val = $_POST['encadrant'];
?>
<html lang="en">

<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Tableau de bord</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">

    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

    <!-- Favicon
    ================================================== -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon.png">

    <!-- Stylesheets
    ================================================== -->
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>


<div id="hero" class="hero overlay subpage-hero portfolio-hero">
    <div class="hero-content">
        <div class="hero-text">
            <h1>Tableau de bord</h1>
        </div><!-- /.hero-text -->
    </div><!-- /.hero-content -->
</div><!-- /.hero -->

<main id="main" class="site-main">


    <div class="panneau">

        <div>
            <!-- Bloc permettant d'afficher les statistiques -->

            <h2><span>Tableau de bord</span></h2>

            <form class="bloc_commandes" method="post" action="#">

                <!-- <label for="stats"><span>Obtenir</span></label> -->
                <select class="selectpicker" name="encadrant" id="encadrant" onchange="this.form.submit()">

                    <?php foreach ($enseignant as $e) { ?>
                        <option class = "selectpicker" value=<?php echo $e['nom'] ?><?php  if ($val == $e['nom']) {
                                                    echo " selected";
                                                } ?>> <?php echo $e['nom'] ?> </option>
                    <?php } ?>


                </select>       
                
                
            </form>






            <?php if (isset($liste)) {

                if (is_array($liste)) {
            ?>

                    <table class="table table-bordered table-condensed table-striped table-hover">
                        <thead>
                            <tr>

                                <?php
                                for ($i = 0; $i < count($keyStats); $i++) {  // pour parcourir les attributs
                                    echo '<th>';

                                    echo $keyStats[$i];

                                    echo '</th>';
                                }
                                ?>
                            </tr>
                        </thead>
                        <tbody>

                            <?php
                            foreach ($liste as $row) {  // pour parcourir les n-uplets
                                
                                ?>
                                <tr name="proj" id="<?php $row['Id_Projet']?>" onclick = "afficherJalon(this.id)">;

                                <?php 
                                //var_dump($row['Id_Projet']);
                                foreach ($row as $valeur) { // pour parcourir chaque valeur de n-uplets

                                    echo '<td>' . $valeur . '</td>';
                                }
                                echo '</tr>';
                            }
                            ?>
                        </tbody>
                    </table>

                
                <?php } ?>

            <?php } else { ?>


                <?php print_r($message) ?>


            <?php }
            ?>
        <div class = "container" >
            <div class = "col-md-6" id="jalon">
                    Liste Jalon

            </div>

            <div class = "col-md-6" id="infojalon">
                Détails Jalon
            </div>
        </div>




            <div>

            </div>




</main><!-- /#main -->

<script>
      




        function afficherJalon(idligne){

            document.getElementById("jalon").innerHTML = `
                    <table class="table table-bordered table-condensed table-striped table-hover">
                                <thead>
                                    <tr>

                                        <?php
                                        for ($i = 0; $i < count($cle); $i++) {  // pour parcourir les attributs
                                            echo '<th>';
                                            echo $cle[$i];

                                            echo '</th>';
                                        }
                                        ?>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    foreach ($projet as $row) {  // pour parcourir les n-uplets
                                        
                                        ?>
                                        <tr >;

                                        <?php 
                                        //var_dump($row['Id_Projet']);
                                        foreach ($row as $valeur) { // pour parcourir chaque valeur de n-uplets

                                            echo '<td>' . $valeur . '</td>';
                                        }
                                        echo '</tr>';
                                    }
                                    ?>
                                </tbody>
                            </table>
            `;
       }
 
        
</script>

</body>