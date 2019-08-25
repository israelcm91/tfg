<?php

namespace app\controllers;

use Yii;

use app\models\Usuario;
use app\models\Registro;
use app\models\Articulo;
use app\models\ArticuloLike;
use app\models\Categoria;
use app\models\UploadForm;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\helpers\FileHelper;
use yii\web\UploadedFile;


class RedactoresController extends Controller
{

	public $layout="redactores";
    /**
     * @inheritdoc
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
                        'actions'=>['index','publicar','crear','articulos','categorias'],
                        'roles'=>['redactor'],
                    ],
                    [
                        'allow'=>true,
                        'actions'=>['busqueda'],
                        'roles'=>['invitado'],
                    ]
                ],
            ],
        ];
    }


    public function actionIndex()
    {
    	$model = new Usuario();
        $nArticulos = Articulo::find()->where(['crea_usuario_id'=>Yii::$app->user->id])->andWhere(['visible'=>1])->count();
        $nVisitas = Articulo::find()->where(['crea_usuario_id'=>Yii::$app->user->id])->sum('visitas');
        $nLikes = ArticuloLike::find()->
                    leftJoin('articulos','articulos.id=articulos_likes.articulo_id')->
                    where(['crea_usuario_id'=>Yii::$app->user->id])->count();
        if($nArticulos === null) $nArticulos = 0;
        if($nVisitas === null) $nVisitas = 0;
        if($nLikes === null) $nLikes = 0;

       return $this->render('index', [
            'model' => $model->findOne(Yii::$app->user->id),
            'nArticulos'=>$nArticulos,
            'nVisitas'=>$nVisitas,
            'nLikes'=>$nLikes
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

                                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." publica articulo ".$model->id,Yii::$app->controller->id); 
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
                                                            return $this->redirect(['articulos/ver', 'id' => $model->id]);
                                                         }

                                                }
                                    }
                                }
                                //si no viene imagen, lo mismo.
                                return $this->redirect(['articulos/ver', 'id' => $model->id]);
                                
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
                                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." crea categoria ".$model->id,Yii::$app->controller->id); 
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
                                                            return $this->redirect(['categorias/ver', 'id' => $model->id]);
                                                         }

                                                }
                                    }
                                }
                                //si no viene imagen, lo mismo.
                                return $this->redirect(['categorias/ver', 'id' => $model->id]);
                                
                            }
                    }


                return $this->render('crear', [
                           'model' => $model,
                           'upload'=>$upload,
                ]);

        }
  
}




	public function actionArticulos()
    {
       $query = Articulo::find()->where(['crea_usuario_id'=>Yii::$app->user->id])->andWhere(['visible'=>1]);
     
    
        //preparamos el proveedor de datos...
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 6]
        ]);

        return $this->render('articulos', [
            'dataProvider' => $dataProvider,
        ]);
    
    }

    public function actionCategorias($eliminado=null)
    {
       $query = Categoria::find()->orderBy(['id'=>SORT_DESC]);
     
    
        //preparamos el proveedor de datos...
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 8]
        ]);

        return $this->render('categorias', [
            'dataProvider' => $dataProvider,
            'eliminado'=> $eliminado
        ]);
    
    }

   
}
