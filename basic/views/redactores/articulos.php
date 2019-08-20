<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\Pjax;
use yii\widgets\ListView;
use yii\data\ActiveDataProvider;



?>
<div class="site-index">

    <!--Main layout-->
    
    

<div class="articulos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
<!-- No interesa crear, solo ver
    <p>
        <?= Html::a(Yii::t('app', 'Create Perfil'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
-->
<!--Main column-->
        <div class="col-md-12">

            <!--First row-->
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
            </div>
        </div>
    </div>
</div>
