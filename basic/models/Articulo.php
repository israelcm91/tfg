<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "articulos".
 *
 * @property int $id
 * @property string $titular Titular del artículo.
 * @property string $subtitulo Subtitulo del artículo
 * @property string $cuerpo Desarrollo del artículo.
 * @property int $categoria_id Categoria de clasificación del articulo CERO si no existe o aún no está indicada (como si fuera NULL).
 * @property string $fecha_publicacion Fecha en la cual se publica el artículo.
 * @property string $imagen Imagen del artículo
 * @property int $visible Indicador de artículo visible a los usuarios o invisible 0 = invisible 1 = visible
 * @property int $crea_usuario_id Usuario que ha creado el artículo o 0 (NULL) si no existe o lo creo un administrador del sistema. 
 * @property int $visitas Campo para controlar el numero de visitas que recibe el artículo.
 *
 * @property ArticulosComentarios[] $articulosComentarios
 */
class Articulo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'articulos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['titular', 'fecha_publicacion'], 'required'],
            [['titular', 'subtitulo', 'cuerpo'], 'string'],
            [['categoria_id', 'visible', 'crea_usuario_id', 'visitas'], 'integer'],
            [['fecha_publicacion'], 'safe'],
            [['imagen'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'titular' => Yii::t('app', 'Titular del artículo.'),
            'subtitulo' => Yii::t('app', 'Subtitulo del artículo'),
            'cuerpo' => Yii::t('app', 'Desarrollo del artículo.'),
            'categoria_id' => Yii::t('app', 'Categoría'),
            'fecha_publicacion' => Yii::t('app', 'Fecha en la cual se publica el artículo.'),
            'imagen' => Yii::t('app', 'Imagen del artículo'),
            'visible' => Yii::t('app', 'Indicador de artículo visible a los usuarios o invisible 0 = invisible 1 = visible'),
            'crea_usuario_id' => Yii::t('app', 'Usuario que ha creado el artículo o 0 (NULL) si no existe o lo creo un administrador del sistema.
'),
            'visitas' => Yii::t('app', 'Campo para controlar el numero de visitas que recibe el artículo.'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticulosComentarios()
    {
        return $this->hasMany(ArticulosComentarios::className(), ['articulo_id' => 'id']);
    }

    /**
     * {@inheritdoc}
     * @return ArticuloQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ArticuloQuery(get_called_class());
    }
}
