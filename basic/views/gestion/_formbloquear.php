<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Perfil */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="gestion-form">

    <?php $form = ActiveForm::begin(); ?>
    <input type="hidden" name="reportar" value="true"/>
    <?= $form->field($model, 'notas_bloqueo') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Bloquear comentario'), [
                        'class' => 'btn btn-primary',
                        'data' => [
                            'confirm' => Yii::t('app', '¿Bloquear este comentario?'),
                            'method' => 'post',
                            ],
                        ]) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
