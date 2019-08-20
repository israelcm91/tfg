<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Categoria;
use app\models\Usuario;
use app\models\ArticuloLike;
use app\models\ArticuloComentario;

$categoria = Categoria::findOne($model->categoria_id);
$usuario = Usuario::findOne($model->crea_usuario_id);

$autor = $usuario->nick;
if($categoria!==null) $categoria = $categoria->nombre;
else $categoria = "Sin categoria";
$nComentarios = ArticuloComentario::find()->articulo_id($model->id)->count();
//sacar likes totales
$nLikes = ArticuloLike::find()->articulo($model->id)->count();

if(!Yii::$app->user->isGuest)
{
    //determinar si el usuario conectado ya le dio like o no 
    $like = ArticuloLike::find()->usuarioArticulo(Yii::$app->user->id,$model->id)->One();
    if ($like !== null) $like = true;
    else                $like = false;
    
//si no esta conectado, mostrar como si no  se hubiera dado like.
}else{
    $like = false;
}

$votarOK =  $nLikes." ".Html::a("",['articulos/like','id'=>$model->id],['class'=>'glyphicon glyphicon glyphicon-heart-empty']);
$votarKO =  $nLikes." ".Html::a("",['articulos/dislike','id'=>$model->id],['class'=>'glyphicon glyphicon glyphicon-heart']);
?>

<!--Inicio de la tarjeta del articulo-->

<div>
	<div class="<?= ($index ==0)?'card col-md-8':'card col-md-4' ?>" style='position:relative'>
				<!--Imagen del anuncio-->
				<a style="display:block" href="?r=articulos/ver&id=<?=$model->id ?>">
				<div class="view overlay hm-white-slight" style="position:relative">
                     <div class="categoria" style="position: absolute;"><?=$categoria ?></div>

					
				 <img <?=(($model->imagen !== null) && (file_exists($model->imagen)))?'src="'.$model->imagen.'"':'src="'.Url::base().'/imagenes/articulo_default.jpg"'; ?>class="img-fluid no-descuadrar-img" alt="">
					<!-- Enlazar la imagen con la vista detallada del anuncio!-->
					
					
				</div>

		<!--/.Imagen del anuncio-->	
			

			<span class="fecha-publicacion">
				<?php 

				//cuanto hace que se creo el el articulo
				if($model->fecha_publicacion !=null || $model->fecha_publicacion != 0){

					$tiempo_pasado = ((time()-strtotime($model->fecha_publicacion))<1)?1:(time()-strtotime($model->fecha_publicacion));

				    $equivalencias = array ( 31536000 => 'año',2592000 => 'mes',604800 => 'semana',
				    							86400 => 'dia',3600 => 'hora',60 => 'minuto',1 => 'segundo' );
				    foreach ($equivalencias as $unidad => $texto) {
				        if ($tiempo_pasado < $unidad) continue;
				        $n_unidades = floor($tiempo_pasado / $unidad);
				        echo 'hace '. $n_unidades.' '.$texto.(($n_unidades>1)?'s':'');
				        break;
				    }			   
				} 
				else echo "sin fecha"; ?>
			</span>
		
		
		<!--Contenido del articulo-->
		<div class="card-block">
			<!--Titular del articulo-->

			<h2 class="card-title"> <?= Html::a($model->titular, ['articulos/ver', 'id'=>$model->id], ['class' =>'waves-effect waves-light']) ?></h2>

			<h6 class="card-title"> <?= Html::a($model->subtitulo, ['articulos/ver', 'id'=>$model->id], ['class' =>'waves-effect waves-light']) ?></h5>

		</div>

		<!--descripcion del anuncio-->
				<div class="card-text no-descuadrar-desc">
					<div>
				<?php

					//si la descripcion es muy larga, la recortamos un poco para no descuadrar 
					if($index == 0) $model->cuerpo = substr($model->cuerpo,0,150);
					else $model->cuerpo = substr($model->cuerpo,0,100);

					$cuerpo = explode ("</p>",$model->cuerpo);
				
				if((strlen($model->cuerpo) >= 100) || !isset($cuerpo[1])){
						
						echo $cuerpo[0]."...".Html::a('(ver más)', ['articulos/ver', 'id'=>$model->id]);
				} 
				else{
						echo $cuerpo[0];
				}	

				?>	
					</div>

				</div>
					<!--/.Card content-->
				<div class="articulo-footer">
					<p class="comentarios-likes">
					 <span><?= $nComentarios." " ?></span>
                            <a class="glyphicon glyphicon-comment" href="<?=Url::home()?>?r=articulos/ver&id=<?=$model->id?>#comentarios"> </a>

                            <?php

                                if($like)   echo $votarKO;
                                else        echo $votarOK;                               
                            ?>

					</p>
					<p class="firma">
					<?= "por ".$autor ?>
					el 
						<?= Yii::$app->formatter->asDate($model->fecha_publicacion, 'd/M/Y')?>
			
					</p>
				</div>
				

	</div>


