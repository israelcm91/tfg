<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */

$this->title = "Registro Completado";
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

    <h1>Registro Completado, Solo un paso más!</h1>
    <h3>Te hemos enviado un email con instrucciones para completar tu registro.</h3>


    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'email',
            'nick',
            'nombre',
            'apellidos',
            //'fecha_nacimiento',            
            'fecha_registro'
             ],
    ]) ?>


    <h2>¿No has recibido el email?</h2>
    
    <p><?= Html::a('Reenviar', ['usuarios/reenviar', 'id'=>$model->id], ['class' =>'btn btn-primary']) ?></p>


</div>