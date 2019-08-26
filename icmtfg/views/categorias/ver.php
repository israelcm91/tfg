<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\widgets\ListView;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */
$this->title = Yii::$app->name.' - '.$model->nombre;


?>

	<div class="col-md-8" style="position:relative"> 
		<div>
			<hr/>
				<p>
						<h1><?= $model->nombre ?> </h1>
							<?php if($model->stream !== null)
							{
								    
							    echo Html::a('Ver en directo', $model->stream,['class'=>'btn btn-primary']);
							    echo '&nbsp';
							    echo Html::a('Noticias relacionadas', ['site/index','categoria_id'=>$model->id],['class'=>'btn btn-primary']);
							}
							?>
				</p>   
				<hr/>
				<div class="Descripcion">
				    <?= $model->descripcion ?>
				</div>

				<hr/>
			</div>
						
	</div>


<!--Renderizamos la vista del artículo -->

<?= $this->render('_categoriaMini', [
        'model' => $model,
        'nota' => $nota
    ]) ?>
<!--Renderizamos la vista de los comentarios -->






