<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[ArticuloLike]].
 *
 * @see ArticuloLike
 */
class ArticuloLikeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/


    public function usuarioArticulo($usuario_id,$articulo_id)
    {
        return $this
            ->andWhere([               
                'usuario_id' => $usuario_id
            ])
            ->andWhere(['articulo_id' => $articulo_id])
            ->orderBy(['id'=>SORT_DESC]);
    }


    public function articulo($articulo_id)
    {
        return $this
            ->andWhere(['articulo_id' => $articulo_id])
            ->orderBy(['id'=>SORT_DESC]);
    }

    /**
     * {@inheritdoc}
     * @return ArticuloLike[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return ArticuloLike|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
