<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\Registro;
use app\models\RegistroSearch;
use app\models\ArticuloComentario;
use yii\data\ActiveDataProvider;
use yii\helpers\Url;
use yii\web\Request;

class GestionController extends Controller
{

    public $layout="gestion";
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
                        'actions'=>['index',
                                    'comentarios',
                                    'comentariosbloqueados',
                                    'revisarcomentarios',
                                    'comentariocorrecto',
                                    'bloquearcomentario',
                                    'eliminarcomentario'],
                        'roles'=>['admin'],
                    ],
                   
                ],
            ],
        ];
    }
    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex($limpiar=null)
    {
        $query = Registro::find()->orderBy(['id'=>SORT_DESC]);
        $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination' => ['pageSize' => 10],
                
            ]);
       
		//Registro::Registrar('S',"Usuario ".Yii::$app->user->id." accede a gestion.",Yii::$app->controller->id); 
        return $this->render('index', ['dataProvider' => $dataProvider,'limpiar'=>$limpiar]);
    }

     public function actionComentarios($correcto=null,$eliminado=null,$bloqueado=null)
    {
          $query = ArticuloComentario::find()->where(['bloqueado'=>0])->andWhere(['>','num_denuncias','0']);
            //preeparamos el proveedor de datos con paginación.
           
                    //preparamos el proveedor de datos...
                    $dataProvider = new ActiveDataProvider([
                    'query' => $query,
                    'pagination' => ['pageSize' => 5],
                ]);
            
            
        return $this->render('comentarios', ['dataProvider' => $dataProvider,'correcto' => $correcto,'eliminado'=>$eliminado,'bloqueado'=>$bloqueado]);
    }


    public function actionComentariosbloqueados($correcto=null,$eliminado=null,$bloqueado=null)
    {
          $query = ArticuloComentario::find()->where(['bloqueado'=>2]);
            //preeparamos el proveedor de datos con paginación.
           
                    //preparamos el proveedor de datos...
                    $dataProvider = new ActiveDataProvider([
                    'query' => $query,
                    'pagination' => ['pageSize' => 5],
                ]);
            
            
        return $this->render('comentariosbloqueados', ['dataProvider' => $dataProvider,'correcto' => $correcto,'eliminado'=>$eliminado,'bloqueado'=>$bloqueado]);
    }

    public function actionRevisarcomentarios($correcto=null,$eliminado=null,$bloqueado=null)
    {
          $query = ArticuloComentario::find()->where(['bloqueado'=>1]);
            //preeparamos el proveedor de datos con paginación.
           
                    //preparamos el proveedor de datos...
                    $dataProvider = new ActiveDataProvider([
                    'query' => $query,
                    'pagination' => ['pageSize' => 5],
                ]);
            
            
        return $this->render('revisarcomentarios', ['dataProvider' => $dataProvider,'correcto' => $correcto,'eliminado'=>$eliminado,'bloqueado'=>$bloqueado]);
    }


    public function actionComentariocorrecto($id,$url=null)
    {

        if($url==null) $url = "gestion/comentarios";  

            $model = ArticuloComentario::findOne($id);

            if($model!==null)
            {

                $model->updateAttributes(['num_denuncias' => 0]);
                $model->updateAttributes(['fecha_denuncia1' => null]);
                $model->updateAttributes(['fecha_bloqueo' => null]);
                $model->updateAttributes(['bloqueado' => 0]);
                $model->updateAttributes(['notas_bloqueo' => null]);
                $model->updateAttributes(['visible' => 1]);
                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." marca comentario ".$id." como correcto",Yii::$app->controller->id); 
                return $this->redirect([$url,'correcto' => 'true']);
            }


        return $this->redirect(['gestion/comentarios']);

    
    }

    public function actionBloquearcomentario($id,$url=null)
    {

            if($url==null) $url = "gestion/comentarios";  

            $model = ArticuloComentario::findOne($id);

            if (Yii::$app->request->post("reportar")) 
            {

                if($model->load(Yii::$app->request->post())){

                    $model->updateAttributes(['bloqueado' => 2]);
                    $model->updateAttributes(['visible' => 0]);
                    if($model->save()){
                        Registro::Registrar('S',"Usuario ".Yii::$app->user->id." bloquea comentario ".$id,Yii::$app->controller->id); 
                        return $this->redirect([$url, 'bloqueado'=>'true']);

                    }


                }

            }


            return $this->render('bloquearcomentario', [
            'model' => $model
            ]);

    
    }

    public function actionEliminarcomentario($id,$url=null)
    {   
            if($url==null) $url = "gestion/comentarios";                

             $model = ArticuloComentario::findOne($id);


            if($model!==null)
            {


               if($model->delete()){
                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." elimina comentario ".$id,Yii::$app->controller->id); 
                     return $this->redirect([$url, 'eliminado'=>'true']);
               }

                
            }

       
        return $this->redirect(['gestion/comentarios']);


    
    }






}