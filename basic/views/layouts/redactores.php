<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;


AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
     <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <link href="css/icm_tfg.css" rel="stylesheet">
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?= //Barra de navegación principal
        \Yii::$app->view->renderFile('@app/views/layouts/navbar.php');?>



    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
       
    
        <div class="col-md-4">

            <div class="widget-wrapper">
                
                <h3><span class="glyphicon glyphicon-send">&nbsp;</span>Zona redactores </h3>
                <br>
                <div class="list-group">
                   <?= Html::a('Zona redactores', ['redactores/index'], ['class' => 'list-group-item']) ?>
                   <?= Html::a('Publicar un artículo', ['redactores/publicar'], ['class' => 'list-group-item']) ?>
                   <?= Html::a('Añadir categoría o juego en la biblioteca', ['redactores/crear'], ['class' => 'list-group-item']) ?>              

                </div>

                <div class="list-group">
                   <?= Html::a('Mis artículos', ['redactores/articulos'], ['class' => 'list-group-item']) ?>
                   <?= Html::a('Categorias', ['redactores/categorias'], ['class' => 'list-group-item']) ?>                    

                </div>

                

            </div>
        </div>
    
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Israel Cáceres Marcos <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
