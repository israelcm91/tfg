<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ArticuloLike */

$this->title = Yii::t('app', 'Create Articulo Like');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Articulo Likes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="articulo-like-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
