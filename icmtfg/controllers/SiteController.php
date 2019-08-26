<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Articulo;
use app\models\Categoria;
use app\models\Registro;
use app\models\Usuario;
use app\models\ArticuloSearch;
use app\models\ArticuloLike;
use yii\data\ActiveDataProvider;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
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
    public function actionIndex($categoria_id=null,$nPages=5,$baja=null,$vistos=null,$gustados=null)
    {

        
       
        //si nos viene la categoria, filtramos en la consulta a la base de datos....
        //si no, obtenemos todos los articulos(Ordenados por fecha desc)
        if($categoria_id !== null) 
        {
            $query = Articulo::find()->categorias($categoria_id);
        }
        else if($vistos !== null)
        {
            $query = Articulo::find()->vistos();
        }
         else if($gustados !== null)
        {

            //consulta para obtener los articulos ordenados de forma descendente según el numero de likes
            $query = Articulo::find()->
            select(['articulos.*', 'COUNT(articulos_likes.articulo_id) AS numerolikes'])->Where('articulos.visible = 1')->
            join('LEFT JOIN', ArticuloLike::tableName(), 'articulos.id=articulos_likes.articulo_id')->
            groupBy('articulos.id')->
            orderBy(['numerolikes' => SORT_DESC]);
         

        }else{

            $query = Articulo::find()->nuevos();
        }

        

            
        if(Yii::$app->request->get('general')){

            $query = Articulo::find()->general();
        }
        
        
        $busqueda = Yii::$app->request->get('busqueda');
        if($busqueda != null){
            $query = Articulo::find()->busqueda($busqueda);
        }



        //paginador
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

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'nPages' => $nPages,
            'baja'=> $baja
            
        ]);
    } 


    public function actionBiblioteca($nPages=24)
    {
      
        $query = Categoria::find()->biblioteca();
        $busqueda = Yii::$app->request->get('busqueda');
        if($busqueda != null){
            $query = Categoria::find()->busqueda($busqueda);
        }

        //paginador
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

        return $this->render('biblioteca', [
            'dataProvider' => $dataProvider,
            'nPages' => $nPages,
            
        ]);
    }    

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}
