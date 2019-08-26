<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;
use app\models\Articulo;

$titular = new Articulo();
$titular = Articulo::findOne($model->articulo_id);
if($titular !== null) $titular = $titular->titular;


$botonReportar = Html::a('Reportar', 
                        ['articulos-comentarios/reportar', 'id'=>$model->id, 'reportar'=>true], 
                        ['class' =>'btn btn-primary btn-danger']);

$botonVolver = Html::a('Volver', 
                      ['articulos/ver','id'=>$model->articulo_id], 
                      ['class' =>'btn btn-primary']);


?>
<div >

    <h1>Reportar comentario</h1>

    <h3>Comentario asociado al articulo "<?=Html::a($titular, ['articulos/ver','id'=>$model->articulo_id]);?>"</h3>

        <!--Renderizamos la vista del comentario -->

<?= $this->render('_comentario', [
        'model' => $model        
    ]) ?>


    <h1>¿Estás seguro de que deseas reportar este comentario?</h1>
    
    <p><?= $botonReportar ?>
       <?= $botonVolver   ?>
    </p>


</div>