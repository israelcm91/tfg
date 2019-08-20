<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\Pjax;
use yii\widgets\ListView;
use yii\data\ActiveDataProvider;



?>
<div class="site-index">

    <!--Main layout-->
    
    

<div class="categorias-index">

    <h1><?= Html::encode($this->title) ?></h1>
   
        <div class="col-md-12">

            <!--First row-->
            <div class="row">
                    <div class="col-md-12">
                        <div class="divider-new">
                            <h1 class="h1-responsive"><span class="glyphicon glyphicon-star">&nbsp;</span>Juegos que me gustan</h1>
                        </div>
                   <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= ListView::widget([
        'dataProvider' => $dataProvider,
        'itemView' => '//categorias/_categoriaMiniPerfil',
        'layout' => '{items}<div style="clear: both;"></div>{pager}'
    ]); ?>    

    <?php Pjax::end(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
