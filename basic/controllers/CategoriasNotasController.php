<?php

namespace app\controllers;

use Yii;
use app\models\Categoria;
use app\models\CategoriaNota;
use app\models\CategoriaNotaSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * CategoriasNotasController implements the CRUD actions for CategoriaNota model.
 */
class CategoriasNotasController extends Controller
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
                        'actions'=>['votar'],
                        'roles'=>['usuario','redactor','sysadmin','admin'],
                    ],
                ],
            ],
        ];
    }

    public function actionVotar($id)
    {
        $model = Categoria::findOne($id);
        $nota = new CategoriaNota();
        //buscamos si el usuario puntuó la categoría....
        $notaUpdate = CategoriaNota::find()->
                        where(['usuario_id'=>Yii::$app->user->id])->
                        andwhere(['categoria_id'=>$id])->one();

        //si existe la categoria a votar....
        if($model!==null){

            //si llegan datos del formulario...
            if($nota->load(Yii::$app->request->post()))
            {

                //preparamos  los datos para guardarlos en la base de datos....
                $nota->usuario_id = Yii::$app->user->id;
                $nota->categoria_id = $id;

                //si ya existe en la base de datos, actualizamos la nota y redirigimos....
                if($notaUpdate !==null)
                {

                    $notaUpdate->updateAttributes(['categoria_id' => $nota->categoria_id,
                                                   'usuario_id'=> $nota->usuario_id,
                                                   'nota'=> $nota->nota 
                                ]);
                   // Registro::Registrar('S',"Usuario ".Yii::$app->user->id." cambia nota juego ". $id." a nota ".$nota->nota,Yii::$app->controller->id); 
                    return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
                //si no existe en la base de datos, guardamos el nuevo registro....
                }else if($nota->save())
                {
                    //Registro::Registrar('S',"Usuario ".Yii::$app->user->id." vota juego ". $id." con nota ".$nota->nota,Yii::$app->controller->id); 
                    return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
                }
            }
            
        }

        //si no existe, mandamos al inicio...
        return $this->redirect(['site/index']);
    }

    /**
     * Lists all CategoriaNota models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CategoriaNotaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CategoriaNota model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new CategoriaNota model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CategoriaNota();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing CategoriaNota model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing CategoriaNota model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the CategoriaNota model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CategoriaNota the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CategoriaNota::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
