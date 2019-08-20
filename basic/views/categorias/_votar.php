<?php

use kartik\slider\Slider;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Categoria */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="categoria-form">

    <?php $form = ActiveForm::begin(); ?>

    
 

<?= $form->field($model, 'rating')->widget(Slider::classname(), [
    'pluginOptions'=>[
        'min'=>0,
        'max'=>10,
        'step'=>1
    ]
]);?>
    <div class="form-group">

        
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
