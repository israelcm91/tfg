<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Categoria;

/* @var $this yii\web\View */
/* @var $model app\models\Articulo */
/* @var $form ActiveForm */

$categoria = Categoria::find()->all();
$categorialista=ArrayHelper::map($categoria,'id','nombre');

?>
<div class="articulos-modificar">

    <h1><?= Html::encode($this->title) ?></h1>
   
<!--Main column-->
		<div class="col-md-8">

			<!--First row-->
			<div class="row">
					<div class="col-md-12">
						<div class="divider-new">
								<h1 class="h1-responsive"><span class="glyphicon glyphicon-text-background">&nbsp;</span>¡Modifica tu artículo!</h1>
						</div>

 	<hr/>

       <?= $this->render('_nuevo', [
        'model' => $model,
        'upload'=>$upload,
        'categorialista' => $categorialista
    ]) ?>


                    </div>
            </div>
        </div>
</div>


