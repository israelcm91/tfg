<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use app\models\Categoria;
use app\models\Usuario;
use app\models\ArticuloLike;



$categoria = Categoria::findOne($model->categoria_id);
$usuario = Usuario::findOne($model->crea_usuario_id);
if($usuario!=null) $autor = $usuario->nick;
else $autor = "No existe";
if($categoria!==null) $categoria = $categoria->nombre;
else $categoria = "General";


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


    
    <div class="col-md-12">
               <!--Imagen del anuncio-->
                <a style="display:block" href="?r=articulos/ver&id=<?=$model->id ?>">
                <div class="view overlay hm-white-slight" style="position:relative">
                     <div class="categoria" style="position: absolute;"><?=$categoria ?></div>

                    <!-- OJO! modificar cuando este claro que se guarda en el campo imagen_id de la base de datos..-->
                <img <?=(($model->imagen !== null) && (file_exists($model->imagen)))?'src="'.$model->imagen.'"':'src="'.Url::base().'/imagenes/articulo_default.jpg"'; ?>class="img-fluid no-descuadrar-img-big" alt="">
                    <!-- Enlazar la imagen con la vista detallada del anuncio!-->
                    
                    
                </div>
                <!--/.Imagen del articulo--> 

            <div class="herramientas">
                    <div class="tiempo-desde">
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
                </div>

                <p>

                    <a class="btn btn-primary" href="#comentarios"> Ir a los comentarios</a>
                    &nbsp
                <?php

                //si somos el creador del articulo, mostramos opciones para modificar o eliminar
                if(Yii::$app->user->id === $model->crea_usuario_id)
                {

                      
                    echo Html::a( "",['articulos/modificarpropio', 'id'=>$model->id], ['class' =>'btn  btn-warning glyphicon glyphicon-pencil']);                   
                
                    echo "&nbsp";
                    
                    echo Html::a("", ['articulos/borrarpropio', 'id'=>$model->id], ['class' =>'btn  btn-warning glyphicon glyphicon-remove','data' => [
                            'confirm' => Yii::t('app', '¿Seguro que quieres eliminar este artículo?')]]);                   
              
                            
                   
                }                   
                ?>
                </p>
                
            </div>
        
            
            <div class="numero-comentarios">
                
                        <hr/>
                            <p><span><?= $nComentarios." " ?></span>
                            <a class="glyphicon glyphicon-comment" href="#comentarios"> </a>

                            <?php

                                if($like)   echo $votarKO;
                                else        echo $votarOK;                               
                            ?>
                          
                            <span><?= $model->visitas." " ?></span>
                            <span class="glyphicon glyphicon-eye-open"> </span>
                            </p>
                        <hr/>

                        <div class="firma-articulo">
                    <span><?= "Escrito por ".$autor." " ?>

                    el 
                        <?= Yii::$app->formatter->asDate($model->fecha_publicacion, 'd/M/Y')?>
                    a las
                        <?= Yii::$app->formatter->asDate($model->fecha_publicacion, 'H:i:s')?>
                    </span>
                </div>
                
            </div>
        
        <!--Contenido del articulo-->
        <div class="">
            <!--Titular del articulo-->

            <h1 class=""> <?= Html::a($model->titular, ['articulos/ver', 'id'=>$model->id], ['class' =>'waves-effect waves-light']) ?></h1>

            <h6 class=""> <?= Html::a($model->subtitulo, ['articulos/ver', 'id'=>$model->id], ['class' =>'waves-effect waves-light']) ?></h6>
                
            <div class="cuerpo col-md-8">
                <!--descripcion del articulo-->
                
                <?php
                
                echo $model->cuerpo;
                    
                ?>  

                
            </div>

                </div>
        </div>
        <hr/>
    </div>

    <a name="comentarios">.</a>
    <hr/>
