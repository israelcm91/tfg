<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */

$this->title = "Contraseña olvidada";
?>
<div class="usuario-view">
	<?php 
                                    //mostrar alertas.
                                if((isset($re)) && ($re !== null)){ 
                                    ?>

                                <div class="alert alert-success" role="alert">
                                     <strong>Email reenviado</strong> Se ha reenviado el email de confirmación.
                                </div>


                            <?php }?>

    <h1>Recupera tu contraseña</h1>
    


    <?=$this->render('_formforgotpass',['model'=>$model]) ?>    


</div>