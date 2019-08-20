<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[CategoriaLike]].
 *
 * @see CategoriaLike
 */
class CategoriaLikeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    public function usuarioCategoria($usuario_id,$categoria_id)
    {
        return $this
            ->andWhere([               
                'usuario_id' => $usuario_id
            ])
            ->andWhere(['categoria_id' => $categoria_id])
            ->orderBy(['id'=>SORT_DESC]);
    }


    public function categoria($categoria_id)
    {
        return $this
            ->andWhere(['categoria_id' => $categoria_id])
            ->orderBy(['id'=>SORT_DESC]);
    }

    /**
     * {@inheritdoc}
     * @return CategoriaLike[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return CategoriaLike|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
