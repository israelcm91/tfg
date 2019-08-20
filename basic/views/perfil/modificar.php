<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;
use yii\widgets\ListView;
use yii\data\ActiveDataProvider;



?>


<div class="perfil-index">

    <h1><?= Html::encode($this->title) ?></h1>
   
<!--Main column-->
		<div class="col-md-8">

			<!--First row-->
			<div class="row">
					<div class="col-md-12">
						<div class="divider-new">
							<h1 class="h1-responsive"><span class="glyphicon glyphicon-pencil">&nbsp;</span>Actualizar perfil</h1>
						</div>


                                <?= $this->render('_actualizar', [
                                    'model' => $model,
                                ]) ?>


                    </div>
            </div>
        </div>
</div>
