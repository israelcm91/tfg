<?php

namespace app\controllers;

use Yii;
use app\models\Configuracion;
use app\models\Registro;
use app\models\ArticuloComentario;
use app\models\ArticuloComentarioSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * ArticulosComentariosController implements the CRUD actions for ArticuloComentario model.
 */
class ArticulosComentariosController extends Controller
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
                        'actions'=>['crear'],
                        'roles'=>['usuario','redactor','admin','sysadmin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['borrarpropio'],
                        'roles'=>['usuario','redactor','sysadmin','admin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['reportar'],
                        'roles'=>['usuario','redactor','sysadmin','admin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['index','view','create','update','delete'],
                        'roles'=>['sysadmin'],
                    ],
                ],
            ],
        ];
    }




    /**
     * Lists all ArticuloComentario models.
     * @return mixed
     */
    public function actionIndex()
    {

        $this->layout="gestion";
        $searchModel = new ArticuloComentarioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        //Registro::Registrar('I',"Acceso a " ,Yii::$app->controller->action->id,Yii::$app->controller->id); 
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    

    /**
     * Creates a new ArticuloComentario model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCrear($articulo_id)
    {
        $model = new ArticuloComentario();

        if ($model->load(Yii::$app->request->post())) {

            $model->articulo_id = $articulo_id;
            $model->crea_fecha=date("Y-m-d H:i:s");
            $model->crea_usuario_id=Yii::$app->user->identity->id;

            if($model->save())
            {

                Registro::Registrar('S',"Usuario ". Yii::$app->user->identity->id." comenta articulo ".$articulo_id,Yii::$app->controller->id); 
        

                return $this->redirect(['articulos/ver', 'id' => $articulo_id,'comentar'=>true]);
            }
            
        }

        
    }

    

    //Reportar un comentario
    public function actionReportar($id)
    {
 
        $model = new ArticuloComentario();

        if (Yii::$app->request->get("reportar")) 
        {
            $model = ArticuloComentario::findOne($id);

            if($model!==null)
            {


                if($model->num_denuncias > 0 )
                {

                    $model->updateAttributes(['num_denuncias' => ($model->num_denuncias + 1)]);
                    //obtenemos la configuración de maximo de reportes que bloquean automaticamente el comentario.

                    if(!($autobloquear = Configuracion::findOne(['variable' => 'autobloquear']))) $autobloquear = 50;
                    else $autobloquear = $autobloquear->valor;

                    if($model->num_denuncias >= $autobloquear){

                        $model->updateAttributes(['bloqueado' => 1]);

                    }


                }else
                {
                    $model->updateAttributes(['num_denuncias' => ($model->num_denuncias + 1),
                                                'fecha_denuncia1' => date("Y-m-d H:i:s")]); 

                }

                Registro::Registrar('A',"Usuario ".Yii::$app->user->identity->id." reporta el comentario ".$id,Yii::$app->controller->id);                 


                 return $this->redirect(['articulos/ver','id'=>$model->articulo_id,'reportar'=>true]);

            }
          
        }


        return $this->render('reportar', [
            'model' => $this->findModel($id),
        ]);
    }

    //Borrar desde la vista publica...
    //realmente no borra, simplemente oculta cambiando el campo visible en la base de datos...
    //Solo los admins pueden borrar de verdad ;)

    public function actionBorrarpropio($id,$url=null)
    {


        $model = new ArticuloComentario();
        $model = $model->findOne($id);
        if($model!==null)
        {
            //si somos los creadores del articulo, lo podemos borrar
            
            if(Yii::$app->user->identity->id === $model->crea_usuario_id){

                Registro::Registrar('S',"Usuario ".Yii::$app->user->identity->id." oculto comentario ".$id,Yii::$app->controller->id); 

                $model->updateAttributes(['visible' => 0]); 
               return $this->redirect([$url, 'eliminado'=>true]);

            }

        }

       return $this->redirect(['index']);
    }


    /**
     * Displays a single ArticuloComentario model.
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

    public function actionCreate()
    {

        $this->layout="gestion";
        $model = new ArticuloComentario();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['ver', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }
    /**
     * Updates an existing ArticuloComentario model.
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
     * Deletes an existing ArticuloComentario model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {

        $this->layout="gestion";
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ArticuloComentario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ArticuloComentario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ArticuloComentario::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
