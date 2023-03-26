<?php
ini_set('display_errors', 'off');
$value = $_POST['boutonstats'];
?>
<html lang="en">

<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Statistiques</title>

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
            <h1>Statistiques</h1>

        </div><!-- /.hero-text -->
    </div><!-- /.hero-content -->
</div><!-- /.hero -->

<main id="main" class="site-main">


    <div class="panneau">

        <div>
            <!-- Bloc permettant d'afficher les statistiques -->

            <h2><span>Statistiques de la base</span></h2>

            <form class="bloc_commandes" method="post" action="#">


                <select class="selectpicker" name="boutonstats" id="statistiques" onchange="this.form.submit()" value="<?php echo $value ?>">

                    <option value="">Choisir statistique</option>
                    <option value="projetsActifs" <?php if ($value == "projetsActifs") {
                                                        echo " selected";
                                                    } ?>>Projets Actifs</option>
                    <option value="projetEtat" <?php if ($value == "projetEtat") {
                                                    echo " selected";
                                                } ?>>Projet et état</option>
                    <option value="equipeUE" <?php if ($value == "equipeUE") {
                                                    echo " selected";
                                                } ?>>Equipe qui acceptent plus de 2 étudiants</option>
                    <option value="projetMax" <?php if ($value == "projetMax") {
                                                    echo " selected";
                                                } ?>>UE avec maximum de projet</option>
                    <option value="projetEnseignant" <?php if ($value == "projetEnseignant") {
                                                            echo " selected";
                                                        } ?>>Enseignant ayant encadré le plus de projet</option>
                    <option value="note" <?php if ($value == "note") {
                                                echo " selected";
                                            } ?>>Meilleures notes et informations suplémentaires</option>
                </select>



            </form>


            <?php if (isset($message)) {

                if (is_array($message)) {
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
                            foreach ($message as $row) {  // pour parcourir les n-uplets

                                echo '<tr>';
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

            <?php } ?>
  



                <section class="site-section subpage-site-section section-project">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-8">
                                <!--                    <div class="project-img">
                                <img src="assets/img/portfolio-1.jpg" class="img-res" alt=""> -->
                            </div>
                     

                        </div>
                        <aside class="col-md-4">
                            <div class="project-info">
                                <h5>Description</h5>

                                <p class="project-description">Un gestionnaire qui permet au enseignant et au étudiant de s'organiser.
                                    Il permet la gestion des projet du coté des enseignant et facilite la tache au étudiant.
                                </p>

                                <div class="project-date-category">
                                    <p><span>Date:</span> Mai 20, 2022</p>
                                    <p><span>Category:</span> Etudes, projet et enseignement</p>
                                </div><!-- /.project-cat -->

                                <a href="https://perso.liris.cnrs.fr/nicolas.lumineau/ens/BDW1/" class="btn btn-gray">Site de l'UE</a>

                            </div><!-- /.project-description -->
                        </aside>
                    </div>
        </div>

                </section><!-- /.section-project -->
    </div>
</main> <!-- /#main -->