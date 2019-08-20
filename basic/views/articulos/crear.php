<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */
/* @var $form ActiveForm */
?>
<div class="articulos-crear">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

        <?= $form->field($model, 'titular') ?>       
        <?= $form->field($model, 'subtitulo') ?>
        <?= $form->field($model, 'cuerpo')->textarea(['rows' => '6']) ?>      
        <?= $form->field($model, 'imagen')->fileInput() ?>
    
        <div class="form-group">
            <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- articulos-index -->
