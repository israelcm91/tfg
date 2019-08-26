<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categorias_likes".
 *
 * @property int $id
 * @property int $categoria_id
 * @property int $usuario_id
 */
class CategoriaLike extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categorias_likes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['categoria_id', 'usuario_id'], 'required'],
            [['categoria_id', 'usuario_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'categoria_id' => Yii::t('app', 'Categoria ID'),
            'usuario_id' => Yii::t('app', 'Usuario ID'),
        ];
    }

    /**
     * {@inheritdoc}
     * @return CategoriaLikeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoriaLikeQuery(get_called_class());
    }
}
