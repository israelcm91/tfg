<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\widgets\ListView;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */


?>


<?php 
//mostrar alertas.
if((isset($reportar)) && ($reportar !== null)){ 
  ?>

<div class="alert alert-info" role="alert">
  <strong>Denuncia realizada</strong> Has denunciado el comentario con éxito.
</div>


<?php }

if((isset($comentar)) && ($comentar !== null)){ 
  ?>
<div class="alert alert-success" role="alert">
  <strong>Comentario realizado</strong> Has comentado el artículo con éxito.
</div>

<?php }?>


<?php if((isset($modificar)) && ($modificar !== null)){;
  ?>
<div class="alert alert-info" role="alert">
  <strong>Artículo modificado</strong> Has modificado el artículo con éxito.
</div>

<?php }?>

<a name="articulo">.</a>

<!--Renderizamos la vista del artículo -->

<?= $this->render('_articulos', [
        'model' => $model,
        'comentarios'=> $comentarios,
        'nComentarios' => $nComentarios	
    ]) ?>
<!--Renderizamos la vista de los comentarios -->

<?php

//generamos el mensaje a mostrar según el número de comentarios que tenga el artículo.

$mensaje = '';

if($nComentarios == 0) 			$mensaje = "¡Sé el primero en comentar!";
else if($nComentarios == 1) 	$mensaje = $nComentarios . " Comentario.";
else 							$mensaje = $nComentarios . " Comentarios.";


?>


<div>        
		<h1><?= $mensaje ?></h1>
		<!--El formulario para comentar, que se mostrara solo si el usuario está logueado -->
        <?php

         if(!Yii::$app->user->isGuest)
         {
              echo  $this->render('//articulos-comentarios/_nuevo', [
                      'articulo_id'=>$model->id,
                      'comentarios'=> $comentarios,
                 ]);

         }else{
              echo Html::a("Conéctate para comentar",['usuarios/login'],['class' =>'btn btn-primary grid-button']);
              echo "<hr/>";
         }
                   
         ?>
</div>
<!--Todos los comentarios para el anuncio elegido -->
<?= ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' =>  '../articulos-comentarios/_comentario',
            'layout' => '{items}<div style="clear: both;"></div>{pager}',        
        ]); ?>    
