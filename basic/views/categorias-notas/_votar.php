<?php

use kartik\slider\Slider;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Categoria */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="categoria-form">

    <?php $form = ActiveForm::begin(['action' => ['categorias-notas/votar', 'id'=> $id]]); ?>

<?= $form->field($nota, 'nota')->widget(Slider::classname(), [
    'pluginOptions'=>[
        'min'=>0,
        'max'=>10,
        'step'=>1

    ]
]);?>
    <div class="form-group">

        
        <?= Html::submitButton('Poner nota', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
