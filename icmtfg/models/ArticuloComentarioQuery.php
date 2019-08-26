<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[ArticuloComentario]].
 *
 * @see ArticuloComentario
 */
class ArticuloComentarioQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    public function articulo_id($articulo_id)
    {
        return $this
            ->andWhere(['articulo_id' => $articulo_id])
            ->andWhere(['visible' => 1])
            ->orderBy(['id'=>SORT_DESC]);
    }

    /**
     * {@inheritdoc}
     * @return ArticuloComentario[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return ArticuloComentario|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
