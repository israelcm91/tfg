<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
$this->title = Yii::$app->name.' - '.'Login';
?>
<div class="site-login">
    <div class="col-md-12">

    <?php 
                                    //mostrar alertas.
                                if((isset($confirmado)) && ($confirmado !== null)){ 
                                    ?>

                                <div class="alert alert-success" role="alert">
                                     <strong>Usuario confirmado</strong> Ahora puedes conectarte.
                                </div>


                            <?php }?>

                            <?php 
                                    //mostrar alertas.
                                if((isset($recuperar)) && ($recuperar !== null)){ 
                                    ?>

                                <div class="alert alert-success" role="alert">
                                     <strong>Email enviado</strong> Se envió un email para restablecer la contraseña.
                                </div>


                            <?php }?>

                            <?php 
                                    //mostrar alertas.
                                if((isset($cambiada)) && ($cambiada !== null)){ 
                                    ?>

                                <div class="alert alert-success" role="alert">
                                     <strong>Contraseña cambiada</strong> Has cambiado la contraseña con éxito.
                                </div>


                            <?php }?>
    <h1>¡Conéctate! Usa tus credenciales.</h1>
    <hr/>
    <?php $form = ActiveForm::begin([
        'id' => 'login-form',
        'layout' => 'horizontal',
        'fieldConfig' => [
            'template' => "<div class='row'>{label}\n<div class=\"col-lg-3\">{input}</div>\n<div class=\"col-lg-8\">{error}</div></div>",
            'labelOptions' => ['class' => 'col-lg-1 control-label'],
        ],
    ]); ?>

        <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

        <?= $form->field($model, 'password')->passwordInput() ?>

        <?= $form->field($model, 'rememberMe')->checkbox([
            'template' => "<div class=\"col-lg-offset-1 col-lg-3\">{input} {label}</div>\n<div class=\"col-lg-8\">{error}</div>",
        ]) ?>

        <div class="form-group">
            <div class="col-lg-offset-1 col-lg-11">
                <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
            </div>
        </div>

    <?php ActiveForm::end(); ?>

    <div class="row" style="color:#999;">
        <div class='col-lg-6'>
            <p>¿No estás registrado?  <?= Html::a('Registrate aquí', ['usuarios/registro'], ['class' => 'profile-link']) ?></p>
             <p>¿Has olvidado tu contraseña?  <?= Html::a('¡Recupérala!', ['usuarios/recuperarpass'], ['class' => 'profile-link']) ?>  </p>
        </div>
    </div>
</div>
</div>