<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Articulo]].
 *
 * @see Articulo
 */
class ArticuloQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    public function nuevos($db = null)
    {
        return $this
            ->andWhere(['visible' => 1])
            ->orderBy(['fecha_publicacion'=>SORT_DESC]);
    }

    public function categorias($categoria_id)
    {
        return $this
            ->andWhere([
               
                'categoria_id' => $categoria_id
            ])->andWhere(['visible' => 1])
            ->orderBy(['id'=>SORT_DESC]);
    }

    public function vistos()
    {
        return $this->andWhere(['visible' => 1])->orderBy(['visitas'=>SORT_DESC]);
    }

    public function busqueda($texto)
    {
        return $this->
        andWhere(['visible' => 1])->
        andFilterWhere(['or',
            ['like','titular',$texto],
            ['like','subtitulo',$texto],
            ['like','cuerpo',$texto],])->
        orderBy(['fecha_publicacion'=>SORT_DESC]);
    }


    /**
     * {@inheritdoc}
     * @return Articulo[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Articulo|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
