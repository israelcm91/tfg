<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

?>


<div class="divider-new">
                                <h1 class="h1-responsive">Articulos</h1>
      </div>
<hr/>

    <p>
        <?= Html::a(Yii::t('app', 'Create Articulo'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget(
       [
'tableOptions' => [
    'class' => 'table table-striped',
],

        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'titular:ntext',

            'subtitulo:ntext',
            'categoria_id',
            //'fecha_publicacion',
            //'imagen',
            //'visible',
            //'crea_usuario_id',
            //'visitas',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ], ); ?>

    <?php Pjax::end(); ?>

