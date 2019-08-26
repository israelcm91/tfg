<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Categoria;
use app\models\CategoriaLike;
use app\models\CategoriaNota;

//obtener nota media
$totalNotas = CategoriaNota::find()->where(['categoria_id'=>$model->id])->count();

//si esta puntuado, obtenemos la media, si no esta puntuado, la media = 0
if($totalNotas!=0)
$media= CategoriaNota::find()->where(['categoria_id'=>$model->id])->sum('nota')/$totalNotas;
else $media = 0;

if(!Yii::$app->user->isGuest){
	$notaUsuario = CategoriaNota::find()->where(['categoria_id'=>$model->id])->
											andWhere(['usuario_id'=>Yii::$app->user->id])->One();

	if($notaUsuario!==null)	$notaUsuario = $notaUsuario->nota;
}

//sacar likes totales
$nLikes = CategoriaLike::find()->categoria($model->id)->count();

if(!Yii::$app->user->isGuest)
{
	//determinar si el usuario conectado ya le dio like o no 
	$like = CategoriaLike::find()->usuarioCategoria(Yii::$app->user->id,$model->id)->One();
	if ($like !== null) $like = true;
	else 				$like = false;
	
//si no esta conectado, mostrar como si no  se hubiera dado like.
}else{
	$like = false;
}

$votarOK =  $nLikes." ".Html::a("",['categorias/like','id'=>$model->id],['class'=>'glyphicon glyphicon glyphicon-heart-empty']);
$votarKO =  $nLikes." ".Html::a("",['categorias/dislike','id'=>$model->id],['class'=>'glyphicon glyphicon glyphicon-heart']);


?>

<!--Inicio de la tarjeta del articulo-->




	<div class="card-cat col-md-3" >
				<div>
					<?php
							if($model->biblioteca == 1){
											echo "<span class='glyphicon glyphicon-book'></span>";
							}
							echo '&nbsp';
							if(Yii::$app->user->can('publicar')) 
							{
								echo Html::a(" ",['categorias/modificar','id'=>$model->id],['class'=>'glyphicon glyphicon glyphicon-pencil']);
								echo '&nbsp';
								echo Html::a("", ['categorias/eliminar', 'id'=>$model->id], ['class' =>'glyphicon glyphicon glyphicon-erase','data' => [
                            'confirm' => Yii::t('app', '¿Seguro que quieres eliminar esta categoria?')]]);               
						    } 


				?></div>
				<!--Imagen del anuncio-->
				<a style="display:block" href="?r=categorias/ver&id=<?=$model->id ?>">
				<div class="view overlay hm-white-slight" style="position:relative">
                   					
				 <img <?=(($model->imagen !== null) && (file_exists($model->imagen)))?'src="'.$model->imagen.'"':'src="'.Url::base().'/imagenes/articulo_default.jpg"'; ?>class="img-fluid no-descuadrar-img-cat" alt="">
					<!-- Enlazar la imagen con la vista detallada del anuncio!-->
					
					
				</div>

		<!--/.Imagen del anuncio-->	
			
		<hr/> 
		<!--Contenido del articulo-->
		<div class="card-cat-block">
			

			<h1 class="card-cat-title"> <?= Html::a($model->nombre, ['categorias/ver', 'id'=>$model->id], ['class' =>'waves-effect waves-light']) ?></h1>

		</div>

		
		<?php

		if(isset($nota)){  ?>
			<div>
				<h3>Nota media</h3>
				<h1><?=$media?></h1>
				<h5>¡Puntúa este juego!</h5>
				<?php if(isset($notaUsuario)) echo "<h6>(Has puntuado: ".$notaUsuario.")</h6>"; ?> 

				<?php	echo $this->render('//categorias-notas/_votar', [
	        			'nota' => $nota,
	        			'id' => $model->id
	    		]);?>


    		</div>

	<?php	}?>


	</div>