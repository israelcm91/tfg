<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categorias".
 *
 * @property int $id
 * @property string $nombre Nombre de la categoría/videojuego
 * @property string $descripcion Texto adicional que describe la categoría o videojuego.
 * @property string $imagen Logotipo de la categoría
 * @property string $stream Enlace para ver el juego en streaming
 * @property int $biblioteca Establece si la categoría puede ser visible en la biblioteca de juegos ( 0 = no visible, 1 = visible) 
 *
 * @property CategoriasLikes[] $categoriasLikes
 * @property CategoriasNotas[] $categoriasNotas
 */
class Categoria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categorias';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['descripcion', 'imagen', 'stream'], 'string'],
            [['biblioteca'], 'integer'],
            [['nombre'], 'string', 'max' => 25],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'nombre' => Yii::t('app', 'Nombre de la categoría/videojuego'),
            'descripcion' => Yii::t('app', 'Texto adicional que describe la categoría o videojuego.'),
            'imagen' => Yii::t('app', 'Logotipo de la categoría'),
            'stream' => Yii::t('app', 'Enlace para ver el juego en streaming'),
            'biblioteca' => Yii::t('app', '¿Pertenece a la biblioteca?
'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategoriasLikes()
    {
        return $this->hasMany(CategoriasLikes::className(), ['categoria_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategoriasNotas()
    {
        return $this->hasMany(CategoriasNotas::className(), ['categoria_id' => 'id']);
    }

    /**
     * {@inheritdoc}
     * @return CategoriaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoriaQuery(get_called_class());
    }
}
