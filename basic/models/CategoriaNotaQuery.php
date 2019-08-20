<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[CategoriaNota]].
 *
 * @see CategoriaNota
 */
class CategoriaNotaQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return CategoriaNota[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return CategoriaNota|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
