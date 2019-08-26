<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;
use yii\widgets\ListView;
use yii\data\ActiveDataProvider;



?>
<div class="site-index">

<div class="perfil-index">

    <h1><?= Html::encode($this->title) ?></h1>
   
<!--Main column-->
		<div class="col-md-8">

			<!--First row-->
			<div class="row">
					<div class="col-md-12">
						<div class="divider-new">
							<h1 class="h1-responsive"><span class="glyphicon glyphicon-trash">&nbsp;</span>Eliminar perfil</h1>
						</div>
					<?= DetailView::widget([
						 'model' => $model,
        				'attributes' => [
							'email:email',
							'nick',
							'nombre',
							'apellidos',
							'fecha_nacimiento',
							'fecha_registro'

				//		['class' => 'yii\grid\ActionColumn'],
						],
					]); ?>

					 <?php $form = ActiveForm::begin(); ?>

				 
				 <input type="hidden" name="id" value="<?= Yii::$app->user->id ?>"/>

				 <div class="form-group">
						<?= Html::submitButton(Yii::t('app', 'Eliminar perfil'), [
						'class' => 'btn btn-danger',
						'data' => [
							'confirm' => Yii::t('app', '¿Estás seguro que quieres dar de baja el perfil?'),
							'method' => 'post',
							],
						]) ?>
	    

						<?php ActiveForm::end(); ?>
				</div>

					</div>
				</div>
			</div>



		</div>
	</div>