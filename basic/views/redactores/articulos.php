<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\Pjax;
use yii\widgets\ListView;
use yii\data\ActiveDataProvider;



?>


 
            <div class="row">
                    <div class="col-md-12">
                        <div class="divider-new">
                            <h1 class="h1-responsive"><span class="glyphicon glyphicon-hand-right">&nbsp;</span> Mis artículos</h1>
                        </div>
                        <hr/>
                   <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= ListView::widget([
        'dataProvider' => $dataProvider,
        'itemView' => '//articulos/_articulosMiniPerfil',
        'layout' => '{items}<div style="clear: both;"></div>{pager}'
    ]); ?>    

    <?php Pjax::end(); ?>
                    </div>
                </div>



