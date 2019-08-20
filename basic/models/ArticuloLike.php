<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "articulos_likes".
 *
 * @property int $id
 * @property int $articulo_id
 * @property int $usuario_id
 */
class ArticuloLike extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'articulos_likes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['articulo_id', 'usuario_id'], 'required'],
            [['articulo_id', 'usuario_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'articulo_id' => Yii::t('app', 'Articulo ID'),
            'usuario_id' => Yii::t('app', 'Usuario ID'),
        ];
    }

    /**
     * {@inheritdoc}
     * @return ArticuloLikeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ArticuloLikeQuery(get_called_class());
    }
}
