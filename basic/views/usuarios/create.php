<?php

use yii\helpers\Html;


?>

	<div class="divider-new">
                                <h1 class="h1-responsive">Usuarios/Crear</h1>
      </div>
       <hr/>
    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

