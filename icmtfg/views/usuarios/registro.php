<?php

use yii\helpers\Html;

$this->title = Yii::$app->name.' - '.'Registro';

?>
<div class="usuario-create">
	<div class="col-md-12">

  <h1>¡Registrate! Es gratutito.</h1>

  <hr/>

    <?= $this->render('_form-registro', [
        'model' => $model,
    ]) ?>
	</div>
</div>
