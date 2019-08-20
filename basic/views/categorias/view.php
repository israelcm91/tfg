<?php

use yii\helpers\Html;
use yii\widgets\DetailView;


?>


    <div class="divider-new">
                                <h1 class="h1-responsive">Categorias/Ver</h1>
      </div>
<hr/>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'nombre',
            'descripcion:ntext',
            'imagen:ntext',
            'stream:ntext',
            'biblioteca',
        ],
    ]) ?>


