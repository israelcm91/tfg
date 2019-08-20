<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="usuario-form">

    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'id')->hiddenInput()->label(false);?>	
    
    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'password2')->passwordInput(['maxlength' => true]) ?>

    

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Restablecer contraseña'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
