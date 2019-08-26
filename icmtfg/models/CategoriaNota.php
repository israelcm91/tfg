<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categorias_notas".
 *
 * @property int $id
 * @property int $categoria_id
 * @property int $usuario_id
 * @property int $nota
 *
 * @property Categorias $categoria
 * @property Usuarios $usuario
 */
class CategoriaNota extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categorias_notas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['categoria_id', 'usuario_id', 'nota'], 'required'],
            [['categoria_id', 'usuario_id', 'nota'], 'integer'],
            [['categoria_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categoria::className(), 'targetAttribute' => ['categoria_id' => 'id']],
            [['usuario_id'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['usuario_id' => 'id']],
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
            'nota' => Yii::t('app', ''),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategoria()
    {
        return $this->hasOne(Categorias::className(), ['id' => 'categoria_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuarios::className(), ['id' => 'usuario_id']);
    }

    /**
     * {@inheritdoc}
     * @return CategoriaNotaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoriaNotaQuery(get_called_class());
    }
}
