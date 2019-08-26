<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Perfil */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="perfil-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'oldpass')->passwordInput(['maxlength' => true, 'required'=>true]) ?>
   <?= $form->field($model, 'newpass')->passwordInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'newpass2')->passwordInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Actualizar password'), [
                        'class' => 'btn btn-warning',
                        'data' => [
                            'confirm' => Yii::t('app', '¿Actualizar contraseña?'),
                            'method' => 'post',
                            ],
                        ]) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<style>

    .active-pink-2 input[type=text]:focus:not([readonly]) {
border-bottom: 1px solid #f48fb1;
box-shadow: 0 1px 0 0 #f48fb1;
}
.active-pink input[type=text] {
border-bottom: 1px solid #f48fb1;
box-shadow: 0 1px 0 0 #f48fb1;
}
.active-purple-2 input[type=text]:focus:not([readonly]) {
border-bottom: 1px solid #ce93d8;
box-shadow: 0 1px 0 0 #ce93d8;
}
.active-purple input[type=text] {
border-bottom: 1px solid #ce93d8;
box-shadow: 0 1px 0 0 #ce93d8;
}
.active-cyan-2 input[type=text]:focus:not([readonly]) {
border-bottom: 1px solid #4dd0e1;
box-shadow: 0 1px 0 0 #4dd0e1;
}
.active-cyan input[type=text] {
border-bottom: 1px solid #4dd0e1;
box-shadow: 0 1px 0 0 #4dd0e1;
}
.active-cyan .fa, .active-cyan-2 .fa {
color: #4dd0e1;
}
.active-purple .fa, .active-purple-2 .fa {
color: #ce93d8;
}
.active-pink .fa, .active-pink-2 .fa {
color: #f48fb1;
}
    </style>
