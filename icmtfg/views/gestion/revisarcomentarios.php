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


                       <?php 
                                    //mostrar alertas.
                                if((isset($correcto)) && ($correcto !== null)){ 
                                    ?>

                                <div class="alert alert-success" role="alert">
                                     <strong>Comentario correcto</strong> Se ha establecido que el comentario era correcto.
                                </div>


                            <?php }?>

                         <?php 
                                    //mostrar alertas.
                                if((isset($eliminado)) && ($eliminado !== null)){ 
                                    ?>

                                <div class="alert alert-danger" role="alert">
                                     <strong>Comentario eliminado</strong> Se ha eliminado el comentario.
                                </div>


                            <?php }?>

                         <?php 
                                    //mostrar alertas.
                                if((isset($bloqueado)) && ($bloqueado !== null)){ 
                                    ?>

                                <div class="alert alert-warning" role="alert">
                                    <strong>Comentario bloqueado</strong> Se ha bloqueado el comentario.
                                     
                                </div>


                            <?php }?>

						<div class="divider-new">
								<h1 class="h1-responsive"><span class="glyphicon glyphicon-question-sign">&nbsp;</span>Comentarios Bloqueados por los usuarios</h1>
						</div>

 	<hr/>

     <?= ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' =>  '../articulos-comentarios/_comentarioGestion',
            'layout' => '{items}<div style="clear: both;"></div>{pager}',        
        ]); ?>    


