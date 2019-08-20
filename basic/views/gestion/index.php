<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use app\models\Categoria;


?>

<?php 
                                    //mostrar alertas.
                                if((isset($limpiar)) && ($limpiar !== null)){ 
                                    ?>

                                <div class="alert alert-danger" role="alert">
                                     <strong>Registros limpios</strong> Se han eliminado todos los logs del sistema.
                                </div>


                            <?php }?>


                       

						<div class="divider-new">
								<h1 class="h1-responsive"><span class="glyphicon glyphicon-file">&nbsp;</span>Logs.</h1>
						</div>

 	<hr/>
    <?php if(Yii::$app->user->can('adminsistema'))
    {

    echo Html::a("Limpiar todo",['registros/limpiar'],
                                ['class'=>'btn btn-danger','data' => [
                            'confirm' => Yii::t('app', '¿Deseas eliminar todos los registros?')]]
                );
    echo "<hr/>";
    }

    
     echo GridView::widget([
                        'dataProvider' =>  $dataProvider,                       
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],
                            'tipo',
                            'fecha_registro',
                            'modulo',
                            'texto:ntext',
                            //'ip',
                            //'browser:ntext',
                        ],
                    ]); ?>

