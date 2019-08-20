<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ArticuloComentario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="articulo-comentario-form">

    <?php $form = ActiveForm::begin([

 			'action' =>['/articulos-comentarios/crear','articulo_id' => $articulo_id]

			]) ?>

    

    <?= $form->field($comentarios, 'texto') ?>    
   

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Comentar'), ['class' => 'btn btn-success']) ?>
         <a class="btn btn-primary" href="#articulo">Volver al artículo</a>
    </div>

    <?php ActiveForm::end(); ?>

</div>
