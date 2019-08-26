<?php


use yii\widgets\ActiveForm;
use app\widgets\Alert;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\models\Categoria;
use app\models\Articulo;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */
/* @var $form yii\widgets\ActiveForm */




$categoria = Categoria::find()->orderBy(['nombre' => SORT_ASC])->all();
$categorialista=ArrayHelper::map($categoria,'id','nombre');
$itemlist = [] ;
//generamos el primer elemento estático, para generar un link de mostrar todos los artículos disponibles


$itemlist[] = ['label' => '<span class="glyphicon glyphicon-filter"></span>' ,
               'items' => [


                        ['label' => 'Los + vistos' ,'url' => ['/site/index','vistos'=>true]],
                        ['label' => 'Los + gustados' ,'url' => ['/site/index','gustados'=>true]],



                    ],
              ];
$itemlist[] = ['label' => 'Todos los artículos' ,
               'url' => ['/site/index','all'=> true],
               'options' => ['class' =>'nav-item'],];

$itemlist[] = ['label' => 'General' ,
               'url' => ['/site/index','general'=> true],
               'options' => ['class' =>'nav-item'],];

//generar elementos dinamicamente desde la base de datos
foreach($categorialista as $categoria_id=>$nombre)
        	{
        		 $itemlist[] = ['label' => $nombre ,
        		 'url' => ['/site/index','categoria_id'=> $categoria_id],
        		 'options' => ['class' =>'nav-item'],
    			];
        	}


//generamos el navbar con todas las categorias en la base de datos.
?>
<div class="wrap">
    <?php
    NavBar::begin([        
        'options' => [
            'class' => ' navbar navbar-default',
        ],
    ]);

    
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav'],
        'items' => $itemlist
    ,
    'encodeLabels' => false
    ]);
    NavBar::end();
    ?>

   
</div>
