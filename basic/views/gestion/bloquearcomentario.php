<?php

use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

?>



            <div class="divider-new">
              <h1 class="h1-responsive"><span class="glyphicon glyphicon-asterisk">&nbsp;</span>Bloquear comentario</h1>
            </div>
              <?= $this->render('../articulos-comentarios/_comentarioGestion', [
                        'model' => $model        
                  ]) ?>

                              <?= $this->render('_formbloquear', [
                                                    'model' => $model,
                              ]) ?>


