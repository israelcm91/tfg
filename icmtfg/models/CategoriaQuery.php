<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Categoria]].
 *
 * @see Categoria
 */
class CategoriaQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    public function biblioteca($db = null)
    {
        return $this
            ->andWhere(['biblioteca' => 1])
            ->orderBy(['id'=>SORT_DESC]);
    }

    public function busqueda($texto)
    {
        return $this->
        andWhere(['biblioteca' => 1])->
        andFilterWhere(['or',
            ['like','nombre',$texto],
            ['like','descripcion',$texto]
        ])->
        orderBy(['id'=>SORT_DESC]);
    }

    /**
     * {@inheritdoc}
     * @return Categoria[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Categoria|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
