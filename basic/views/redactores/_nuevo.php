<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Categoria */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="categoria-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>


    <?= $form->field($model, 'descripcion')->widget(\yii\redactor\widgets\Redactor::className()) ?>

    <?= $form->field($model, 'biblioteca')->checkbox(); ?>
    	<?= $form->field($model, 'stream')->textInput() ?>

     <?= $form->field($upload, 'imageFile')->fileInput() ?>
     <hr/>
    <div class="form-group">

        
        <?= Html::submitButton(Yii::t('app', 'Crear categoría'), ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
