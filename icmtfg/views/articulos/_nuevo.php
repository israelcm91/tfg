<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="articulo-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

        <?= $form->field($model, 'titular') ?>       
        <?= $form->field($model, 'subtitulo') ?>
        <?= $form->field($model, 'cuerpo')->widget(\yii\redactor\widgets\Redactor::className()) ?>

        <?= $form->field($upload, 'imageFile')->fileInput() ?>

        <?= $form->field($model, 'categoria_id')->dropdownList(
            $categorialista,
            ['prompt'=>'Selecciona una categoria']); ?>
        <?=Html::a("¿No existe la categoría que necesitas? ¡Créala!",['categorias/crear']) ?>
        <hr/>
                
        <div class="form-group">
          <?php
            if(isset($modificar)) echo Html::submitButton(Yii::t('app', 'Modificar artículo'), ['class' => 'btn btn-primary']);
            else                  echo Html::submitButton(Yii::t('app', 'Publicar artículo'), ['class' => 'btn btn-primary']);
            
        ?>

            
        </div>
    <?php ActiveForm::end(); ?>

</div>
