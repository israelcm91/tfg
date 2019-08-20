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

<?= ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' =>  '../categorias/_categoriaMini',
            'layout' => '{items}<div style="clear: both;"></div>{pager}',
            
            /*'layout' => 
            '<div class="container container-fluid">{items}</div> 
                <div>
                    {pager}
                    <select class="custom-select" style="margin-bottom: 15px;">
                      <option value="10" '.( (strcasecmp( $nPages, '10') == 0) ? 'selected' : '').'>Mostrar 10 gangas</option>
                      <option value="25" '.( (strcasecmp( $nPages, '25') == 0) ? 'selected' : '').'>Mostrar 25 gangas</option>
                      <option value="50" '.( (strcasecmp( $nPages, '50') == 0) ? 'selected' : '').'>Mostrar 50 gangas</option>
                      <option value="75" '.( (strcasecmp( $nPages, '75') == 0) ? 'selected' : '').'>Mostrar 75 gangas</option>
                      <option value="100" '.( (strcasecmp( $nPages, '100') == 0) ? 'selected' : '').'>Mostrar 100 gangas</option>
                      <option value="1" '.( (strcasecmp( $nPages, '1') == 0) ? 'selected' : '').'>Mostrar todas las gangas</option>
                    </select>
                    {summary}
                </div>'*/
        ]); ?>    


</body>
</html>