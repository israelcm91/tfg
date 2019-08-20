<?php

use yii\bootstrap\ActiveForm;
use yii\bootstrap\Html;
use bs\dbManager\models\BaseDumpManager;


?>

                        <div class="divider-new">
                                <h1 class="h1-responsive"><span class="glyphicon glyphicon-floppy-disk">&nbsp;</span>Copias de seguridad</h1>
                        </div>

    <hr/>
       <div class="dbManager-default-restore">

    <div class="well">
        <h4><?= Yii::t('dbManager', 'Restore') . ': ' .  $file ?></h4>
        <?php $form = ActiveForm::begin([
            'action' => ['restore', 'id' => $id],
            'method' => 'post',
        ]) ?>

        <?= $form->errorSummary($model) ?>

        <?= $form->field($model, 'db')->dropDownList($model->getDBList(), ['prompt' => '']) ?>

        <?php if (!BaseDumpManager::isWindows()) {
            echo $form->field($model, 'runInBackground')->checkbox();
        } ?>

        <?php if ($model->hasPresets()): ?>
            <?= $form->field($model, 'preset')->dropDownList($model->getCustomOptions(), ['prompt' => '']) ?>
        <?php endif ?>

        <?= Html::submitButton(Yii::t('dbManager', 'Restore'), ['class' => 'btn btn-success']) ?>

        <?php ActiveForm::end() ?>
    </div>

</div>
