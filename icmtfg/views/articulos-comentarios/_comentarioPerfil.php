<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Articulo;

use app\models\Comentario;
use app\models\Usuario;
use yii\web\Request;

$usuario = new Usuario();
$usuario = $usuario->findOne($model->crea_usuario_id);
$formatter = \Yii::$app->formatter;
$titular = Articulo::findOne($model->articulo_id);

$titular = $titular->titular;
$request = new Request();
$referrer = Yii::$app->urlManager->parseRequest($request)[0];
$referrerController = explode('/', $referrer)[0];
$referrerAction = explode('/', $referrer)[1];
$url = $referrerController."/".$referrerAction;
?>

<!--Inicio de la tarjeta del articulo-->

<div class="comentario col-md-12">

	<div class="opciones-container">
		<div class="alert alert-success " role="alert">
                 <strong>Artículo</strong> Ir al artículo: "<?= Html::a($titular,['articulos/ver','id' => $model->articulo_id]);?>"
        	</div>
		<div class="opciones">

			
			<?php
			if(!Yii::$app->user->isGuest)
			{	
				
				if($model->crea_usuario_id === Yii::$app->user->identity->id)
				{
					echo '&nbsp';
					echo Html::a(" ",['articulos-comentarios/borrarpropio','id' => $model->id,'url'=>$url],
								['class'=>'glyphicon glyphicon-erase','data' => [
                            'confirm' => Yii::t('app', '¿Eliminar este comentario?')]]);
					echo '&nbsp';
					
				

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
	

