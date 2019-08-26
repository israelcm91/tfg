<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

use yii\widgets\ListView;
use yii\data\ActiveDataProvider;



?>
<div class="site-index">

	<!--Main layout-->
	
	

<div class="perfil-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
<!-- No interesa crear, solo ver
    <p>
        <?= Html::a(Yii::t('app', 'Create Perfil'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
-->
<!--Main column-->
		<div class="col-md-8">

			<!--First row-->
			<div class="row">
					<div class="col-md-12">
							<?php
								if((isset($modificar)) && ($modificar !== null)){ 
  									?>

								<div class="alert alert-success" role="alert">
 									 <strong>Modificaste con éxito tu perfil</strong> Has cambiado tus datos correctamente.
								</div>


							<?php }?>


							<?php
								if((isset($pass)) && ($pass !== null)){ 
  									?>

								<div class="alert alert-success" role="alert">
 									 <strong>Contraseña cambiada</strong> Has cambiado tu contraseña con éxito.
								</div>


							<?php }?>


						<div class="divider-new">
							<h1 class="h1-responsive"><span class="glyphicon glyphicon-user">&nbsp;</span>Perfil</h1>
						</div>
					<?= DetailView::widget([
						 'model' => $model,
        'attributes' => [
							//['class' => 'yii\grid\SerialColumn'],

							//'id',
							'email:email',
							//'password',
							'nick',
							'nombre',
							'apellidos',
							'fecha_nacimiento',
							'fecha_registro'

				//		['class' => 'yii\grid\ActionColumn'],
						],
					]); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>