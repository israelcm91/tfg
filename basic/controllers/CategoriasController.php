<?php

namespace app\controllers;

use Yii;
use app\models\Registro;
use app\models\CategoriaLike;
use app\models\Categoria;
use app\models\CategoriaSearch;
use app\models\CategoriaNota;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\UploadForm;
use yii\web\UploadedFile;
use yii\helpers\FileHelper;
use yii\filters\AccessControl;

/**
 * CategoriasController implements the CRUD actions for Categoria model.
 */
class CategoriasController extends Controller
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
                        'actions'=>['crear','modificar','eliminar'],
                        'roles'=>['redactor','sysadmin','admin'],
                    ],
                     [
                        'allow'=>true,
                        'actions'=>['like','dislike'],
                        'roles'=>['usuario','redactor','sysadmin','admin'],
                    ],
                     [
                        'allow'=>true,
                        'actions'=>['ver'],
                        'roles'=>['?','usuario','redactor','sysadmin','admin'],
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
     * Lists all Categoria models.
     * @return mixed
     */
    public function actionIndex()
    {

        $this->layout="gestion";
        $searchModel = new CategoriaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionVer($id,$nPages=10,$reportar=null)
    {

        $model = new Categoria();
        $nota = new CategoriaNota();
        //$comentarios = new ArticuloComentario();
        $model = $model->findOne($id);
        
        if($model !==null){
            //solo podremos ver la vista detallada de la categoria si pertenece a la biblioteca.
            if($model->biblioteca !==0){
                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." visita juego ". $id,Yii::$app->controller->id); 
            return $this->render('ver', [
                'model' => $model, 
                'nota' =>$nota               
            ]);
        }
        
        }
        //si no existe, mandamos al inicio...
        return $this->redirect(['site/index']);

    }


    /**
     * Creates a new Categoria model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCrear()
    {
        //comprobar si el usuario esta logueado
        if(!Yii::$app->user->getIsGuest())
        {
                
                 $model = new Categoria();
                 $upload = new UploadForm();
           
                    if ($model->load(Yii::$app->request->post())) { 

                            if($model->biblioteca) $model->biblioteca = 1;
                            else $model->biblioteca = 0;

                            $timestamp= time();
                            
                            //guardamos para poder obtener el ID del articulo desde el modelo para construir la ruta
                            if ($model->save())
                            { 
                                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." crea categoria". $id,Yii::$app->controller->id); 
                                //si se guarda la categoria, creamos la carpeta asociada a esta para guardar la imagen.
                                //el nombre sera con el formato "id-timestamp".     
                                $ruta = "biblioteca/".md5($model->id);
                                FileHelper::createDirectory($ruta,0700,true);

                                //cargamos el input de la imagen del enviado por el formulario
                                if($upload->load(Yii::$app->request->post()))
                                {
                                    //si vino una imagen...
                                    if(UploadedFile::getInstance($upload,'imageFile')!==null)
                                    {          

                                        $upload->imageFile = UploadedFile::getInstance($upload,'imageFile');
                                            //generamos la ruta de la imagen para guardarla                          
                                            $rutaImagen = $ruta."/".$upload->imageFile->baseName.'.'.$upload->imageFile->extension;
                                            
                                                //si la imagen se subio, guardamos la ruta en la base de datos
                                                if ($upload->upload($rutaImagen)) 
                                                {                                                    
                                                        //actualizamos el campo de la ruta de la imagen en la BD para la tabla articulos.
                                                         if($model->updateAttributes(['imagen' => $rutaImagen]))
                                                         {  
                                                            //enviamos a la vista del articulo recien creado
                                                            return $this->redirect(['ver', 'id' => $model->id]);
                                                         }

                                                }
                                    }
                                }
                                //si no viene imagen, lo mismo.
                                return $this->redirect(['ver', 'id' => $model->id]);
                                
                            }
                    }


                return $this->render('crear', [
                           'model' => $model,
                           'upload'=>$upload,
                ]);

        }
  
}


    public function actionLike($id)
    {

        $model = new Categoria();        
        $model = $model->findOne($id);
       
        if($model!==null)
        {
            
                 //determinar si el usuario conectado ya le dio like o no 
                $like = CategoriaLike::find()->usuarioCategoria(Yii::$app->user->id,$id)->One();
                if ($like !== null) $like = true;
                else                $like = false;


             if(!$like)
             {

                $like = new CategoriaLike();
                $like->usuario_id = Yii::$app->user->id;
                $like->categoria_id = $id;

                echo $like->usuario_id;
                echo $like->categoria_id;

                 if($like->save())
                 {
                    Registro::Registrar('S',"Usuario ".Yii::$app->user->id." le gusta juego ". $id,Yii::$app->controller->id); 
                 }

             }
             
        }

       return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
    }


    public function actionDislike($id)
    {

        $model = new Categoria();        
        $model = $model->findOne($id);

        if($model!==null)
        {

             //determinar si el usuario conectado ya le dio like o no 
                $like = CategoriaLike::find()->usuarioCategoria(Yii::$app->user->id,$id)->One();
                if ($like !== null) $like = true;
                else                $like = false;
             
             if($like)
             {
                //borramos el like
                $like = new CategoriaLike();
                $like->find()->where(['usuario_id'=>Yii::$app->user->id])->andwhere(['categoria_id'=>$id])->one()->delete();
                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." ya no gusta gusta juego ". $id,Yii::$app->controller->id); 

             }
             
        }

       return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
    }


     public function actionModificar($id)
    {

        if(Yii::$app->user->can('publicar')){

            $model = $this->findModel($id);
            $upload = new UploadForm();

        if ($model->load(Yii::$app->request->post())) {

             if(UploadedFile::getInstance($upload,'imageFile')!==null)
                {   
                 $ruta = "biblioteca/".md5($model->id);
                 $upload->imageFile = UploadedFile::getInstance($upload,'imageFile');
                 //generamos la ruta de la imagen para guardarla                          
                 $rutaImagen = $ruta."/".$upload->imageFile->baseName.'.'.$upload->imageFile->extension;
                                            
                  //si la imagen se subio, guardamos la ruta en la base de datos
                  if ($upload->upload($rutaImagen)) 
                  {      
                     //eliminar foto antigua del directorio
                    if($model->imagen!=null)  unlink($model->imagen);                                                       
                     //actualizamos el campo de la ruta de la imagen en la BD para la tabla articulos.
                     if($model->updateAttributes(['imagen' => $rutaImagen]))
                     {  

                    if($model->save())
                    {
                        Registro::Registrar('S',"Usuario ".Yii::$app->user->id." modifica categoria ". $id,Yii::$app->controller->id); 
                        //enviamos a la vista del articulo recien creado
                        return $this->redirect(['categorias/ver',
                                                'id'=>$model->id,
                                                'modificar'=>true]);
                       

                    }
                       
                     }

                }
        }
            if($model->save())
            {
                                //enviamos a la vista del articulo recien creado
                            Registro::Registrar('S',"Usuario ".Yii::$app->user->id." modifica categoria ". $id,Yii::$app->controller->id); 
                           return $this->redirect(['categorias/ver','id'=>$model->id,'modificar'=>true]);

            }
        }

        return $this->render('modificar', [
            'model' => $model,
            'upload'=>$upload
        ]);


        }
        
    }


     public function actionEliminar($id){


        if(Yii::$app->user->can('publicar'))
        {    
                    $model = Categoria::findOne($id);

                    if($model != null)
                    {                          
                        if($model->delete()) {


                            Registro::Registrar('S',"Usuario ".Yii::$app->user->id." elimina categoria ". $id,Yii::$app->controller->id); 
                            return $this->redirect(['redactores/categorias','eliminado'=>true]);
                        }  
                  
                    }
         } 
    }


    /**
     * Displays a single Categoria model.
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
     * Creates a new Categoria model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $this->layout="gestion";
        $model = new Categoria();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Categoria model.
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
     * Deletes an existing Categoria model.
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
     * Finds the Categoria model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Categoria the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Categoria::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
