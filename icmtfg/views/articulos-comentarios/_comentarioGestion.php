<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Comentario;
use app\models\Usuario;
use yii\web\Request;

$usuario = new Usuario();
$usuario = $usuario->findOne($model->crea_usuario_id);
$formatter = \Yii::$app->formatter;

$request = new Request();
$referrer = Yii::$app->urlManager->parseRequest($request)[0];
$referrerController = explode('/', $referrer)[0];
$referrerAction = explode('/', $referrer)[1];
$url = $referrerController."/".$referrerAction;

?>

<!--Inicio de la tarjeta del articulo-->

<div class="comentario col-md-12">

	<div class="opciones-container">

		<?php if($model->bloqueado > 0){ ?>

			<div class="alert alert-danger" role="alert">
                                     <strong>(<?=($model->num_denuncias>1)?$model->num_denuncias." denuncias":$model->num_denuncias." denuncia"?>) Notas del bloqueo</strong> <?= $model->notas_bloqueo?>
        	</div>


		<?php }else{ ?>

				<div class="alert alert-danger" role="alert">
                                     <strong><?=($model->num_denuncias>1)?"Denuncias: ".$model->num_denuncias:"Denuncia: ".$model->num_denuncias?></strong> Este comentario ha recibido <?= $model->num_denuncias?> denuncias.
        	</div>



		<?php }?>
		
		<div class="opciones">
			
			<?php
			if(!Yii::$app->user->isGuest)
			{	
				echo '&nbsp';
				echo Html::a("Correcto",['gestion/comentariocorrecto','id' => $model->id,'url'=>$url],
								['class'=>'btn btn-success']
							);
				if($model->bloqueado ==0){


				echo '&nbsp';
				echo Html::a("Bloquear",['gestion/bloquearcomentario','id' => $model->id,'url'=>$url],
								['class'=>'btn btn-warning']
				);
				}
				echo '&nbsp';
				echo Html::a("Eliminar",['gestion/eliminarcomentario','id' => $model->id,'url'=>$url],
								['class'=>'btn btn-danger','data' => [
                            'confirm' => Yii::t('app', '¿Eliminar este comentario?')]]
				);

				
			}
	       ?>
		</div>
	</div>
	<hr/>

	

		<div class="cuerpo-comentario">

			<div>

				<?= Html::encode($model->texto) ?>
				
			</div>

		</div>



		<div class="firma-comentario">
			
				<p>	Escrito por 
					<span class="nombre-usuario"><?= $usuario->nick ?></span> 
				  	el 
				<?= Yii::$app->formatter->asDate($model->crea_fecha, 'd/M/Y')?>
					a las
				<?= Yii::$app->formatter->asDate($model->crea_fecha, 'H:i:s')?>
				</p>

			</div>
			
			
</div>
	
