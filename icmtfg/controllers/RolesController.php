<?php
namespace app\controllers;

use Yii;
use yii\web\Controller;

class  RolesController extends \yii\web\Controller
{
    public function actionInit()
    {

        $auth = Yii::$app->authManager;
        
       

        //agrega el permiso "adminsistema"
        $adminsistema = $auth->createPermission('adminsistema');
        $adminsistema->description = 'Permisos de administración del sistema';
        $auth->add($adminsistema);

        
        //-----------------------------------------------------------------


        //-----------------------------------------------------------------
        //SE CREAN LOS ROLES Y SE ASIGNAN LOS PERMISOS
        // agrega el rol "usuario" y le asigna el permiso comentar y votar articulos
        $usuario = $auth->createRole('usuario');
        $auth->add($usuario);
        $auth->addChild($usuario, $votar);
        $auth->addChild($usuario, $comentar);
        $auth->addChild($usuario, $modificarComentario);
        $auth->addChild($usuario, $eliminarComentario);
      

        // agrega el rol "redactor", mismos permisos que usuario con la habilidad de CME articulos
        $redactor = $auth->createRole('redactor');
        $auth->add($redactor);
        $auth->addChild($redactor, $usuario);
        $auth->addChild($redactor, $publicar);
        $auth->addChild($redactor, $modificar);
        $auth->addChild($redactor, $eliminar);

        // agrega el rol "moderador" con los mismos permisos que redactor
        $moderador = $auth->createRole('moderador');
        $auth->add($moderador);
        $auth->addChild($moderador, $redactor);

         // agrega el rol "admin" y le agrega todos los permisos de moderador mas modificar
        $admin = $auth->createRole('admin');
        $auth->add($admin);
        $auth->addChild($admin, $redactor);
        $auth->addChild($admin, $administrar);

        // agrega el rol "sysadmin" y le agrega todos los permisos 
        $sysadmin = $auth->createRole('sysadmin');
        $auth->add($sysadmin);
        $auth->addChild($sysadmin, $admin);
        $auth->addChild($sysadmin, $adminsistema);


    }
}

?>