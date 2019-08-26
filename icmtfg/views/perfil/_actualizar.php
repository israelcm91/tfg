<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;




?>

<div class="perfil-form">

        <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

        <?= $form->field($model, 'nombre') ?>       
        <?= $form->field($model, 'apellidos') ?>
        <?= $form->field($model, 'fecha_nacimiento')->input('date') ?>

                
        <div class="form-group">
            <?= Html::submitButton(Yii::t('app', 'Actualizar perfil'), [
                        'class' => 'btn btn-warning',
                        'data' => [
                            'confirm' => Yii::t('app', '¿Actualizar datos de perfil?'),
                            'method' => 'post',
                            ],
                        ]) ?>
            
        </div>
    <?php ActiveForm::end(); ?>

</div>
