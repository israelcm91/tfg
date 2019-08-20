<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

?>


    <div class="divider-new">
                                <h1 class="h1-responsive">Categorias</h1>
      </div>
<hr/>

    <p>
        <?= Html::a(Yii::t('app', 'Create Categoria'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nombre',
            //'descripcion:ntext',
            //'imagen:ntext',
            //'stream:ntext',
            'biblioteca',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

    <?php Pjax::end(); ?>


