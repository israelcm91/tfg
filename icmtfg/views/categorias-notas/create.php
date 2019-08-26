<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CategoriaNota */

$this->title = Yii::t('app', 'Create Categoria Nota');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Categoria Notas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categoria-nota-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
