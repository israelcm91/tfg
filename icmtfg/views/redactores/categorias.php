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
                            <?php 
                                    //mostrar alertas.
                                if((isset($eliminado)) && ($eliminado !== null)){ 
                                    ?>

                                <div class="alert alert-danger" role="alert">
                                     <strong>Categoria eliminada</strong> Se elimino la categoria con éxito.
                                </div>


                            <?php }?>

                            <h1 class="h1-responsive"><span class="glyphicon glyphicon-list-alt">&nbsp;</span>Todas las categorias</h1>
                        </div>
                        <hr/>
                   <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= ListView::widget([
        'dataProvider' => $dataProvider,
        'itemView' => '//categorias/_categoriaMiniRedactor',
        'layout' => '{items}<div style="clear: both;"></div>{pager}'
    ]); ?>    

    <?php Pjax::end(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

