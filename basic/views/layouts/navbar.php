<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;



    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);


    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            ['label' => '<span class="glyphicon glyphicon-home">&nbsp</span>Portada', 'url' => ['/site/index']],
            ['label' => '<span class="glyphicon glyphicon-book">&nbsp</span>Biblioteca', 'url' => ['/site/biblioteca']],
            Yii::$app->user->can('publicar')? (
                ['label' => '<span class="glyphicon glyphicon-text-background">&nbsp</span>Zona Redactores', 'url' => ['/redactores/index']]
            ) : (''),
            Yii::$app->user->can('administrar')? (
                ['label' => '<span class="glyphicon glyphicon-lock">&nbsp</span>Administración', 'url' => ['/gestion/index']]
            ) : (''),
            Yii::$app->user->isGuest ? (
                ['label' => '<span class="glyphicon glyphicon-log-in">&nbsp</span>Conectar', 'url' => ['/usuarios/login'],]
            ) : (['label' => 'Bienvenid@, '.Yii::$app->user->identity->nick,
                    'items'=>
                    [

                        ['label'=>'<span class="glyphicon glyphicon-user">&nbsp</span>Mi perfil','url'=>['/perfil/index']],
                        ['label'=>'<span class="glyphicon glyphicon-log-out">&nbsp</span>Desconectar','url'=>['/usuarios/logout']],
                    ]
                ]


            )
        ],
        'encodeLabels' => false,
    ]);

    NavBar::end();
    ?>