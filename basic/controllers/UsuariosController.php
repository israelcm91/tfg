<?php

namespace app\controllers;

use Yii;
use app\models\Registro;
use app\models\Usuario;
use app\models\UsuarioSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use app\models\LoginForm;
use yii\data\ActiveDataProvider;
use yii\helpers\Url;

/**
 * UsuariosController implements the CRUD actions for Usuario model.
 */
class UsuariosController extends Controller
{
    /**
     * {@inheritdoc}
     */
public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            
            'access'=>[
                'class'=>AccessControl::className(),
                'rules'=>[
                   
                    [
                        'allow'=>true,
                        'actions'=>['publicar','borrarpropio'],
                        'roles'=>['redactor','sysadmin','admin'],
                    ],

                    [
                        'allow'=>true,
                        'actions'=>['ver','login'],
                        'roles'=>['?','usuario','redactor','admin','sysadmin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['logout','like','dislike'],
                        'roles'=>['usuario','redactor','admin','sysadmin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['roles','admin'],
                        'roles'=>['sysadmin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['registro','confirmar','reenviar'],
                        'roles'=>['?'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['index','delete','update','create','view'],
                        'roles'=>['sysadmin'],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Usuario models.
     * @return mixed
     */
    public function actionIndex()
    {

        $this->layout="gestion";
        $searchModel = new UsuarioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

        /**
     * Acción de registro de usuario.
     * Si el registro es correcto, se redirigirá a la pantalla de login.     
     */

    public function actionRegistro()
    {
        $model = new Usuario();

        if ($model->load(Yii::$app->request->post())) {

            //preparamos los datos recibidos para guardar en la base de datos, y añadimos los necesarios.

            //hashear password
            $model->password=md5($model->password);
            $model->password2=md5($model->password2);

            //convertir fecha nacimiento           
            $fecha_aux = str_replace('/', '-', $model->fecha_nacimiento);            
            $model->fecha_nacimiento=date('Y-m-d', strtotime($fecha_aux));

            //obtener fecha actual
            $model->fecha_registro=date("Y-m-d H:i:s");

            //inicializar otros campos...
            $model->num_accesos="0";
            $model->bloqueado="0";
            $model->confirmado="0";
            
            if($model->save()){
                Registro::Registrar('I',"Usuario ".$model->id." se ha registrado",Yii::$app->controller->id); 
                //asignamos el rol usuario
                $auth = Yii::$app->authManager;
                $authorRole = $auth->getRole('usuario');
                $auth->assign($authorRole, $model->id);

                //envio de email para confirmar el registro del usuario.
                $ctrl = md5($model->id.$model->nick.$model->email.$model->fecha_registro);
                Yii::$app->mailer->compose()->
                setFrom('icmtfg@gmail.com')->
                setTo($model->email)->setSubject('TFG ICM - !Completa tu registro, '.$model->nick.'!')->
                setTextBody('Haz click en el siguiente enlace para completar el registro: '.Url::toRoute(['usuarios/confirmar', 'id' => $model->id, 'ctrl' => $ctrl ], true))->
                send();
                return $this->redirect(['confirmar', 'id' => $model->id]);
                
            }
        }

        return $this->render('registro', [
            'model' => $model,
        ]);

    }

    /**
     * Acción de login de usuario.  
     */

    public function actionLogin()
    {
        
        //comprobar si el usuario está logueado... si ya esta logueado, volver al inicio. (No hay necesidad de login)       
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post())) {

            if($model->login() && !$model->confirmar){
                //registrar la fecha de acceso en la base de datos y reiniciar el contador de accesos...
                $usuario = Usuario::findOne(['id' => Yii::$app->user->id]);
                $usuario->updateAttributes(['fecha_acceso' => date("Y-m-d H:i:s"),'num_accesos' => 0]);            
                Registro::Registrar('I',"Usuario ".Yii::$app->user->id." se ha conectado",Yii::$app->controller->id); 
                return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);

            }else if($model->confirmar){

                $usuario = Usuario::find()->where(['nick'=>$model->username])->one();
                

                return $this->redirect(['confirmar', 'id' => $usuario->id]);
            }
            
        }

        $model->password = '';
        
        return $this->render('login', [
            'model' => $model,
        ]);
    }
    //acción de logout

    public function actionLogout()
    {
        Registro::Registrar('I',"Usuario ".Yii::$app->user->id." se ha desconectado",Yii::$app->controller->id); 
        Yii::$app->user->logout();

        return $this->goHome();
    }

        /**
     * Acción de confirmación del usuario, marca al usuario como confirmado en la base de datos. 
     */
/*
    public function actionConfirmar($id)
    {
        $model = new Usuario();
        if (Yii::$app->request->get("confirmar")) 
        {
            $model = Usuario::findOne($id);
            $model->confirmado="1";
            //si se recibe confirmar, modificarlo y redirigir a id
            Yii::$app->db->createCommand("UPDATE usuarios SET confirmado=1 WHERE id = '$id' ")->execute();
            Registro::Registrar('I',"Usuario ".$id." ha confirmado su registro",Yii::$app->controller->id); 
           return $this->redirect(['login', 'id' => $id]);
        }
        return $this->render('confirmar', [
            'model' => $this->findModel($id),
        ]);
    }*/


    public function actionConfirmar($id,$ctrl=null,$re=null){

        $model = Usuario::findOne($id);

        if(($model !== null) && ($model->confirmado == 0)){

            if($ctrl !== null){

                 $control = md5($model->id.$model->nick.$model->email.$model->fecha_registro);

                if($control === $ctrl)
                {

                        $model->confirmado = 1;
                        if($model->save())
                        {
                            //usuario confirmado, loguear

                            $login = new LoginForm();
                            //simulamos la entrada de usuario y contraseña y logueamos
                            $login->username = $model->nick;
                            $login->password = $model->password;
                            $login->login();
                            $model->updateAttributes(['fecha_acceso' => date("Y-m-d H:i:s"),'num_accesos' => 0]);            
                    
                            return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);

                        }
                }else
                {
                    //control no valido
                    return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
                }

           }else{

                 return $this->render('esperarconfirmacion', ['model' => $model,'re'=>$re]);
           }
       }
       return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);

    }//function

    public function actionReenviar($id){

        $model = Usuario::findOne($id);

        if(($model !== null) && ($model->confirmado == 0)){
                echo $id;
                $ctrl = md5($model->id.$model->nick.$model->email.$model->fecha_registro);
                Yii::$app->mailer->compose()->
                setFrom('icmtfg@gmail.com')->
                setTo($model->email)->setSubject('TFG ICM - !Completa tu registro, '.$model->nick.'!')->
                setTextBody('Haz click en el siguiente enlace para completar el registro: '.Url::toRoute(['usuarios/confirmar', 'id' => $model->id, 'ctrl' => $ctrl ], true))->
                send();
                return $this->redirect(['confirmar', 'id' => $model->id,'re'=>true]);

        }
       
    }//function


    

    


    /**
     * Displays a single Usuario model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {

        $this->layout="gestion";
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Usuario model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {

        $this->layout="gestion";
        $model = new Usuario();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Usuario model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {

        $this->layout="gestion";
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Usuario model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->layout="gestion";

        $this->layout="gestion";
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Usuario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Usuario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        
        if (($model = Usuario::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

    //muestra todos los usuarios y su rol correspondiente para modificarlos
    public function actionRoles()    {

        $this->layout="gestion";

        if (!Yii::$app->user->isGuest) 
        {

            $id=Yii::$app->user->identity->id;
            $userRole = Yii::$app->authManager->getRolesByUser($id);


            if ($userRole) 
            {

                    foreach ($userRole as $role) 
                    {
                       $roles[] = $role->name;
                    }
                    $userRole = count($roles) === 1 ? $roles[0] : $roles ;
            }


            if ($userRole=='sysadmin') 
            {                
                $searchModel = new UsuarioSearch();
                $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

                return $this->render('admin_roles', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,

                ]);
            }

            echo "No tienes permiso para entrar a este sitio";
        }





    }


    //cambia el rol del usuario, se viene aqui desde la pantalla de administrar roles
    public function actionAdmin($id, $opcion, $rol)
    {

        $this->layout="gestion";
        //Se crea un array con los roles para ascender o descender mas facilmente 
        $roles= array("usuario" , "redactor", "admin");
        switch ($rol) //se calcula el índice en el que esta el rol actual
        {
            case 'usuario':
                $idrol=0;
                break;
            case 'redactor':
                $idrol=1;
                break;
            case 'admin':
                $idrol=2;
                break;
        }


        $auth = Yii::$app->authManager;
        
        $auth->revokeAll($id);


        if ($opcion=='ascender') 
        {
            $authorRole = $auth->getRole($roles[$idrol+1]);
            $auth->assign($authorRole, $id);
        }
        else if ($opcion=='degradar')
        {
            $authorRole = $auth->getRole($roles[$idrol-1]);
            $auth->assign($authorRole, $id);

        }

         return $this->redirect(['usuarios/roles']);
    }
}
