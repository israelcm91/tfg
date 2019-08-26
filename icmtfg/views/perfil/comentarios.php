<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\ListView;
use yii\helpers\ArrayHelper;
use app\models\Categoria;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */
/* @var $form ActiveForm */

$categoria = Categoria::find()->all();
$categorialista=ArrayHelper::map($categoria,'id','nombre');
?>


<div class="perfil-index">

    <h1><?= Html::encode($this->title) ?></h1>
   
<!--Main column-->
		<div class="col-md-8">

			<!--First row-->
			<div class="row">
					<div class="col-md-12">
                         <?php 
                                    //mostrar alertas.
                                if((isset($eliminado)) && ($eliminado !== null)){ 
                                    ?>

                                <div class="alert alert-danger" role="alert">
                                     <strong>Comentario eliminado</strong> Se ha eliminado el comentario.
                                </div>


                            <?php }?>

                              
						<div class="divider-new">
								<h1 class="h1-responsive"><span class="glyphicon glyphicon-exclamation-sign">&nbsp;</span>Mis comentarios</h1>
						</div>

 	<hr/>

     <?= ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' =>  '../articulos-comentarios/_comentarioPerfil',
            'layout' => '{items}<div style="clear: both;"></div>{pager}',        
        ]); ?>    



                    </div>
            </div>
        </div>
</div>

