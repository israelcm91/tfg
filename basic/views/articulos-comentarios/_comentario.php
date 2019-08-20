<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Comentario;
use app\models\Usuario;

$usuario = new Usuario();
$usuario = $usuario->findOne($model->crea_usuario_id);
$formatter = \Yii::$app->formatter;

?>

<!--Inicio de la tarjeta del articulo-->

<div class="comentario col-md-12">

	<div class="opciones-container">
		<div class="opciones">
			
			<?php
			if(!Yii::$app->user->isGuest)
			{	
				echo '&nbsp';
				echo Html::a(" ",['articulos-comentarios/reportar','id' => $model->id],
								['class'=>'glyphicon glyphicon-warning-sign']
							);
				if($model->crea_usuario_id === Yii::$app->user->identity->id)
				{
					echo '&nbsp';
					echo Html::a(" ",['articulos-comentarios/borrarpropio','id' => $model->id],
								['class'=>'glyphicon glyphicon-erase']
				);

				}
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
	
