<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

?>
                        <div class="divider-new">
                                <h1 class="h1-responsive"><span class="glyphicon glyphicon-king">&nbsp;</span>Administrar Roles</h1>
                        </div>

    <hr/>

    <?php Pjax::begin(); ?>

     <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'email:email',           
            'nick',
            'nombre',
            
            [
                'class' => 'yii\grid\DataColumn', 
                'value' => function ($dataProvider) 
                {

                    $userRole = Yii::$app->authManager->getRolesByUser($dataProvider->id);

                    if ($userRole) {

                        foreach ($userRole as $role) {
                           $roles[] = $role->name;
                        }
                        $userRole = count($roles) === 1 ? $roles[0] : $roles ;
                    }

                    return $userRole; 
                },
                'label' => 'Rol',

            ],

            [
            'class' => 'yii\grid\ActionColumn',
            'template' => '{ascender}', 
            'buttons' => [
                    'ascender' => function ($dataProvider) {
                        $id=substr($dataProvider,-1);

                        $userRole = Yii::$app->authManager->getRolesByUser($id);

                        if ($userRole) 
                        {
                            foreach ($userRole as $role) {
                               $roles[] = $role->name;
                            }                           

                            $userRole = count($roles) === 1 ? $roles[0] : $roles ;
                        }

                        if ($userRole==='sysadmin' || $userRole==='admin' ) return 'No se puede ascender';
                        else return Html::a('Ascender', ['usuarios/admin', 'id'=>$id, 'opcion'=>'ascender', 'rol'=>$userRole]);
                    },
                ]
            
             ],


             [
            'class' => 'yii\grid\ActionColumn',

            'template' => '{degradar}',  
            'buttons' => [
                    'degradar' => function ($dataProvider) {
                        $id=substr($dataProvider,-1);

                        $userRole = Yii::$app->authManager->getRolesByUser($id);

                        if ($userRole) 
                        {

                            foreach ($userRole as $role) {
                               $roles[] = $role->name;
                            }
                            
                            $userRole = count($roles) === 1 ? $roles[0] : $roles ;
                        }

                        if ($userRole=='usuario' || $userRole=='sysadmin') return 'No se puede degradar';
                        else return Html::a('Degradar', ['usuarios/admin', 'id'=>$id, 'opcion'=>'degradar', 'rol'=>$userRole]);
                    },
                ]
            
             ],

        ],

    ]); ?>
    
