<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Categoria;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */
/* @var $form ActiveForm */

$categoria = Categoria::find()->all();
$categorialista=ArrayHelper::map($categoria,'id','nombre');
?>
<div class="articulos-publicar">
 	<h1 class="h1-responsive"><span class="glyphicon glyphicon-text-background">&nbsp;</span>¡Publica un artículo!</h1>
 	<hr/>

      <?= $this->render('_nuevo', [
        'model' => $model,
        'upload'=>$upload,
        'categorialista' => $categorialista
    ]) ?>

</div><!-- articulos-publicar -->
