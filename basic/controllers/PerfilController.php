<?php

namespace app\controllers;

use Yii;

use app\models\Usuario;

use app\models\Articulo;

use app\models\ArticuloComentario;
use app\models\Categoria;
use app\models\Registro;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;

/**
 * PerfilController implements the CRUD actions for Perfil model.
 */
class PerfilController extends Controller
{

	public $layout="perfil";
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
                        'actions'=>['index','view','create','update','delete', 'baja', 'pass', 'articulos', 'avisos', 'juegos', 'modificar','comentarios'],
                        'roles'=>['usuario'],
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


    public function actionIndex($modificar=null,$pass=null)
    {
    	$model = new Usuario();
       return $this->render('index', [
            'model' => $model->findOne(Yii::$app->user->id),
            'modificar'=>$modificar,
            'pass'=> $pass
        ]);
    }


       public function actionBaja($id){

         if($id == Yii::$app->user->id)
         {       
                    $model = new Usuario;
                    if (Yii::$app->request->post('id') == Yii::$app->user->id)
                    {
                        $model = $model->findOne(Yii::$app->user->id);
                        $model->delete();
                        Registro::Registrar('I',"Usuario ".Yii::$app->user->id." se dio de baja",Yii::$app->controller->id); 
                        return $this->redirect(['site/index','baja'=>true]);
                  
                    }else{
                          
                            $model = $model->findOne(Yii::$app->user->id);
                            return $this->render('baja', [
                                'model' => $model,
                            ]);
                    }
        }
    }

    public function actionPass($id){

        if($id == Yii::$app->user->id){


        $model = Usuario::findOne(Yii::$app->user->id);

        if ($model->load(Yii::$app->request->post())) {
            $password=$model->password;
            if($password==md5($model->oldpass)){
            $model->password=md5($model->newpass);
            if ( $model->save()) {
                Registro::Registrar('S',"Usuario ".Yii::$app->user->id." cambio su contraseña",Yii::$app->controller->id); 
                return $this->redirect(['index','pass'=>true]);
            }
            }else{

                return $this->render('pass', [
            'model' => $model,
            'error' => true
        ]);

            }
        }

        return $this->render('pass', [
            'model' => $model,
        ]);


        }

    }

	public function actionArticulos()
    {
       $query = Articulo::find();   
       $query
            ->leftJoin('articulos_likes','articulos.id=articulos_likes.articulo_id')
            ->where([
                'usuario_id'=>Yii::$app->user->id ]);
     
    
        //preparamos el proveedor de datos...
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 6]
        ]);
        Registro::Registrar('S',"Usuario ".Yii::$app->user->id." ve sus articulos favoritos",Yii::$app->controller->id); 
        return $this->render('articulos', [
            'dataProvider' => $dataProvider,
        ]);
    
    }

    public function actionJuegos()
    {
       $query = Categoria::find();   
       $query
            ->leftJoin('categorias_likes','categorias.id=categorias_likes.categoria_id')
            ->where([
                'usuario_id'=>Yii::$app->user->id ]);
     
    
        //preparamos el proveedor de datos...
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 6]
        ]);
        Registro::Registrar('S',"Usuario ".Yii::$app->user->id." ve sus juegos favoritos",Yii::$app->controller->id); 
        return $this->render('juegos', [
            'dataProvider' => $dataProvider,
        ]);
    
    }

    
    

	public function actionComentarios($eliminado=null)
	{
         $query = ArticuloComentario::find()->where(['bloqueado'=>0])->andWhere(['visible'=>1])->andWhere(['crea_usuario_id'=>Yii::$app->user->id]);
            //preeparamos el proveedor de datos con paginación.
           
                    //preparamos el proveedor de datos...
                    $dataProvider = new ActiveDataProvider([
                    'query' => $query,
                    'pagination' => ['pageSize' => 5],
                ]);
            
            
        return $this->render('comentarios', ['dataProvider' => $dataProvider,'eliminado'=> $eliminado]);
	}

    public function actionModificar($id)
    {
        //solo podemos modificar nuestro propio perfil
        if($id == Yii::$app->user->id){

             $model = Usuario::findOne($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['/perfil/index', 'id' => $model->id,'modificar'=>true]);
        }

        return $this->render('modificar', [
            'model' => $model,
        ]);

        }else{
            return $this->redirect(['/site/index']);

        }
       


}

}
