<?php

namespace app\controllers;

use Yii;
use app\models\Registro;
use app\models\Articulo;
use app\models\ArticuloSearch;
use app\models\ArticuloComentario;
use app\models\ArticuloLike;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\helpers\FileHelper;
use app\models\UploadForm;
use yii\web\UploadedFile;
use app\controllers\ArticulosComentarios;
use yii\data\ActiveDataProvider;
/**
 * ArticulosController implements the CRUD actions for Articulo model.
 */
class ArticulosController extends Controller
{


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
                        'actions'=>['create','update','delete'],
                        'roles'=>['sysadmin','admin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['publicar','borrarpropio','modificarpropio'],
                        'roles'=>['redactor','sysadmin','admin'],
                    ],

                    [
                        'allow'=>true,
                        'actions'=>['index','ver'],
                        'roles'=>['?','usuario','redactor','admin','sysadmin'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['like','dislike'],
                        'roles'=>['usuario','redactor','admin','sysadmin'],
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
     * Lists all Articulo models.
     * @return mixed
     */
    public function actionIndex()
    {

        $this->layout="gestion";
        $searchModel = new ArticuloSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    //acción que permite publicar artículos en la web. (Redactor o superior).
   
    public function actionPublicar()
	{
		//comprobar si el usuario esta logueado
		if(!Yii::$app->user->getIsGuest())
		{
			//comprobar rol (cualquier rol que tenga permiso de publicación de artículos)
			if(Yii::$app->user->can('publicar'))
			{

		   		 $model = new Articulo();
                 $upload = new UploadForm();
           
		    		if ($model->load(Yii::$app->request->post())) { 

			        		//guardamos la fecha de publicación.
		    				$model->fecha_publicacion=date("Y-m-d H:i:s");                      
		    				//articulo visible, lo estamos publicando
		    				$model->visible=1;
		    				//guardamos el id del usuario que ha creado el artículo.
		    				$model->crea_usuario_id=Yii::$app->user->identity->id;
                            
                            //guardamos para poder obtener el ID del articulo desde el modelo para construir la ruta
		    				if ($model->save())
		    				{ 

                                Registro::Registrar('S',"Usuario ".Yii::$app->user->identity->id." publica articulo ".$model->id,Yii::$app->controller->id); 
                                //si se guarda el articulo, creamos la carpeta asociada a este para guardar la imagen.
                                //el nombre sera el hash md5 de unir el id del articulo con la fecha de publicación.     
                                $ruta = "articulos/".md5($model->id.$model->fecha_publicacion);
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

		    	return $this->render('publicar', [
		      	           'model' => $model,
                           'upload'=>$upload,
		    	]);

	    	}	    

		}
		//si no estamos logueados o no tenemos rol, regresamos al index  (no deberiamos poder acceder aquí).
		//echo "error no estas logueado";
		//return $this->redirect(["site/index"]);
		
	}

    public function actionLike($id)
    {

        $model = new Articulo();        
        $model = $model->findOne($id);
       
        if($model!==null)
        {
            
                 //determinar si el usuario conectado ya le dio like o no 
                $like = ArticuloLike::find()->usuarioArticulo(Yii::$app->user->id,$id)->One();
                if ($like !== null) $like = true;
                else                $like = false;


             if(!$like)
             {

                $like = new ArticuloLike();
                $like->usuario_id = Yii::$app->user->id;
                $like->articulo_id = $id;

                echo $like->usuario_id;
                echo $like->articulo_id;

                 if($like->save())
                 {
                    Registro::Registrar('S',"Usuario ".Yii::$app->user->id." le gusta articulo ". $id,Yii::$app->controller->id); 
                 }

             }
             
        }

       return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
    }


    public function actionDislike($id)
    {

        $model = new Articulo();        
        $model = $model->findOne($id);

        if($model!==null)
        {

             //determinar si el usuario conectado ya le dio like o no 
                $like = ArticuloLike::find()->usuarioArticulo(Yii::$app->user->id,$id)->One();
                if ($like !== null) $like = true;
                else                $like = false;
             
             if($like)
             {
                //borramos el like
                $like = new ArticuloLike();
                $like->find()->where(['usuario_id'=>Yii::$app->user->id])->andwhere(['articulo_id'=>$id])->one()->delete();
                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." dejo de gustar articulo ". $id,Yii::$app->controller->id); 

             }
             
        }

       return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
    }

    /**
     * Muestra un articulo
     * @param integer $id
     * @return mixeds
     * @throws NotFoundHttpException if the model cannot be founds
     */
    public function actionVer($id,$nPages=10,$reportar=null,$comentar=null,$modificar=null)
    {

        $model = new Articulo();
        $comentarios = new ArticuloComentario();
        $model = $model->findOne($id);
        
        
        
        
        if($model!==null){

            //preparamos la consulta para cargar los comentarios
          
            $query = ArticuloComentario::find()->where(['articulo_id'=>$id])->andWhere(['bloqueado'=>0])->andWhere(['visible'=>1]);
            $nComentarios = ArticuloComentario::find()->where(['articulo_id'=>$id])->andWhere(['bloqueado'=>0])->andWhere(['visible'=>1])->count();
            //preeparamos el proveedor de datos con paginación.
            if($nPages !== 1)
            {
                    //preparamos el proveedor de datos...
                    $dataProvider = new ActiveDataProvider([
                    'query' => $query,
                    'pagination' => ['pageSize' => $nPages],
                ]);
            } 
            else 
            {
                //preparamos el proveedor de datos...
                $dataProvider = new ActiveDataProvider([
                    'query' => $query,
                    'pagination' => false,
                ]);
            }
            //incrementamos el contador de visitas para el artículo elegido.
            $model->updateAttributes(['visitas' => $model->visitas+=1]);
            Registro::Registrar('S',"Usuario ".Yii::$app->user->id." visita articulo ". $id,Yii::$app->controller->id); 

            return $this->render('ver', [
                'model' => $model,
                'comentarios' => $comentarios,
                'dataProvider' => $dataProvider,
                'nPages' => $nPages,
                'nComentarios'=>$nComentarios,
                'reportar'=>$reportar,
                'comentar'=>$comentar,
                'modificar'=>$modificar
            ]);

        
        }
        //si no existe, mandamos al inicio...
        return $this->redirect(['site/index']);

    }


    //Borrar desde la vista publica...
    //realmente no borra, simplemente oculta cambiando el campo visible en la base de datos...
    //Solo los admins pueden borrar de verdad ;)
    public function actionBorrarpropio($id)
    {
        $model = new Articulo();
        $model = $model->findOne($id);
        if($model!==null)
        {
            //si somos los creadores del articulo, lo podemos borrar
            
            if(Yii::$app->user->identity->id === $model->crea_usuario_id){

                $model->updateAttributes(['visible' => 0]); 
                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." oculta articulo ". $id,Yii::$app->controller->id); 
                return $this->redirect(['redactores/articulos']);

            }

        }

       // return $this->redirect(['index']);
    }

    public function actionModificarpropio($id)
    {
        $model = $this->findModel($id);
        $upload = new UploadForm();

        if ($model->load(Yii::$app->request->post())) {

             if(UploadedFile::getInstance($upload,'imageFile')!==null)
                {   
                 $ruta = "articulos/".md5($model->id.$model->fecha_publicacion);
                 $upload->imageFile = UploadedFile::getInstance($upload,'imageFile');
                 //generamos la ruta de la imagen para guardarla                          
                 $rutaImagen = $ruta."/".$upload->imageFile->baseName.'.'.$upload->imageFile->extension;
                                            
                  //si la imagen se subio, guardamos la ruta en la base de datos
                  if ($upload->upload($rutaImagen)) 
                  {      
                     //eliminar foto antigua del directorio
                     unlink($model->imagen);                                                       
                     //actualizamos el campo de la ruta de la imagen en la BD para la tabla articulos.
                     if($model->updateAttributes(['imagen' => $rutaImagen]))
                     {  

                    if($model->save())
                    {

                        Registro::Registrar('S',"Usuario ".Yii::$app->user->id." modifica articulo ". $id,Yii::$app->controller->id); 
                        //enviamos a la vista del articulo recien creado
                        return $this->redirect(['articulos/ver',
                                                'id'=>$model->id,
                                                'modificar'=>true]);
                       

                    }
                       
                     }

                }
        }
            if($model->save())
            {
                                //enviamos a la vista del articulo recien creado
                           return $this->redirect(['articulos/ver','id'=>$model->id,'modificar'=>true]);

            }
        }

        return $this->render('modificar', [
            'model' => $model,
            'upload'=>$upload
        ]);
    }

    public function actionView($id)
    {
        $this->layout="gestion";
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Articulo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $this->layout="gestion";
        $model = new Articulo();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['ver', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Articulo model.
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
     * Deletes an existing Articulo model.
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
     * Finds the Articulo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Articulo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Articulo::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
