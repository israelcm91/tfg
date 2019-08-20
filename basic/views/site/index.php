<?php

use yii\helpers\Html;
use yii\widgets\Menu;
use yii\widgets\ListView;
use app\models\Categorias;
use app\models\Articulo;
use yii\web\View;


/* @var $this yii\web\View */

$this->title = 'My Yii Application';



?>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
      border-radius:0px;
      background-color:#337ab7;
      color:white;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
  

     
<?php 
                if((isset($baja)) && ($baja !== null)){ 
                    ?>

                <div class="alert alert-danger" role="alert">
                   <strong>Cuenta eliminada</strong> Has eliminado tu cuenta con éxito.
                </div>


              <?php }?>


<div class="jumbotron">
  <div class="container text-center">
    <h1>TFG ISRAEL</h1>      
    <p>Revista Online de eSports</p>
  </div>
</div>

<?= //Barra de navegación de categorias, generada dinamicamente desde la base de datos
\Yii::$app->view->renderFile('@app/views/site/_nav.php');?>
<div class="row">
  <div class="col-md-12 busqueda">

<?= //Barra de navegación de categorias, generada dinamicamente desde la base de datos
\Yii::$app->view->renderFile('@app/views/site/_busqueda.php');?>
</div>
</div>

<div class="row">
  <div class="col-md-12">
<?= ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' =>  '../articulos/_articulosMini',
            'layout' => '{items}<div style="clear: both;"></div>{pager}',

        ]); ?>    
</div>
</div>
