<?php

use yii\helpers\Html;
use yii\widgets\Menu;
use yii\widgets\ListView;
use app\models\Categorias;
use yii\web\View;


/* @var $this yii\web\View */




?>


<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<body>

<div class="jumbotron">
  <div class="container text-center">
    <h1>Biblioteca</h1>      
    <p>Todos los juegos relacionados con los eSports</p>
  </div>
</div>
<hr/>

<div class="row">
  <div class="col-md-12 busqueda">

<?= //Barra de navegación de categorias, generada dinamicamente desde la base de datos
\Yii::$app->view->renderFile('@app/views/site/_busquedabiblioteca.php');?>
</div>
</div>

<?= ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' =>  '../categorias/_categoriaMini',
            'layout' => '{items}<div style="clear: both;"></div>{pager}',
         
        ]); ?>    


</body>
</html>