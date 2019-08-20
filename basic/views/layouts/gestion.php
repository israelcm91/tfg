<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

$this->title = Yii::$app->name.' - '.'Gestión';
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
       
        <?= Alert::widget() ?>
       
    
        <div class="col-md-4">

            
            <div class="widget-wrapper">

                <h3><span class="glyphicon glyphicon-star-empty">&nbsp;</span>Admin</h3>
                <hr/>
                <h5><span class="glyphicon glyphicon-th-list">&nbsp;</span>General</h5>  
                <div class="list-group">
                  
                    <?= Html::a('Logs', ['/gestion/index'], ['class' => 'list-group-item']) ?>
                </div>
                <h5><span class="glyphicon glyphicon-exclamation-sign">&nbsp;</span>Moderar Comentarios</h5>
                <div class="list-group">
                    <?= Html::a('Comentarios Reportados', ['/gestion/comentarios'], ['class' => 'list-group-item']) ?>
                    <?= Html::a('Comentarios Bloqueados por Administración', ['/gestion/comentariosbloqueados'], ['class' => 'list-group-item']) ?>
                    <?= Html::a('Comentarios Bloqueados por Usuarios', ['/gestion/revisarcomentarios'], ['class' => 'list-group-item']) ?>
                    
                </div>
            </div>
            <?php if(Yii::$app->user->can('adminsistema')){
                ?>
            <div class="widget-wrapper">
                <h3><span class="glyphicon glyphicon-console">&nbsp;</span>Administrador del sistema</h3>
                <hr/>
                <div class="list-group">
                    <h5><span class="glyphicon glyphicon-tasks">&nbsp;</span>Funciones</h5>
                    <?= Html::a('Configuraciones', ['/configuraciones/index'], ['class' => 'list-group-item']) ?>
                    <?= Html::a('Gestión de roles', ['/usuarios/roles'], ['class' => 'list-group-item']) ?>
                    <?= Html::a('Copias de seguridad', ['/db-manager'], ['class' => 'list-group-item']) ?>
                </div>
                <div class="list-group">
                    <h5><span class="glyphicon glyphicon-wrench">&nbsp;</span>Mantenimientos</h5>

                    <?= Html::a('Usuarios', ['/usuarios/index'], ['class' => 'list-group-item']) ?>
                    <?= Html::a('Articulos', ['/articulos/index'], ['class' => 'list-group-item']) ?>
                    <?= Html::a('Comentarios', ['/articulos-comentarios/index'], ['class' => 'list-group-item']) ?>
                    <?= Html::a('Categorías', ['/categorias/index'], ['class' => 'list-group-item']) ?>
                    
                    
                
                </div>
            </div>

        <?php } ?>
        </div>
        <div class="gestion-index">

   
<!--Main column-->
        <div class="col-md-8">

            <!--First row-->
            <div class="row">
                    <div class="col-md-12">

                         <?= $content ?>


                    </div>
            </div>
        </div>
</div>

       
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
