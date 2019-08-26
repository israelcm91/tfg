<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Perfil */

$this->title = Yii::t('app', 'Cambiar contraseña: {nameAttribute}', [
    'nameAttribute' => $model->nick,
]);

?>
<div class="perfil-update">
<div class="col-md-8">

			<!--First row-->
			<div class="row">
					<div class="col-md-12">
						<div class="divider-new">
							<h1 class="h1-responsive"><span class="glyphicon glyphicon-asterisk">&nbsp;</span>Modificar contraseña</h1>
						</div>
						<?php 
									//mostrar alertas.
								if((isset($error)) && ($error !== null)){ 
  									?>

								<div class="alert alert-danger" role="alert">
 									 <strong>Contraseña incorrecta</strong> La contraseña antigüa no es correcta.
								</div>


							<?php }?>


                              <?= $this->render('_form_pass', [
        'model' => $model,
    ]) ?>


                    </div>
            </div>
        </div>
</div>


    

</div>
