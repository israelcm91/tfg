<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ArticuloComentario;

/**
 * ArticuloComentarioSearch represents the model behind the search form of `app\models\ArticuloComentario`.
 */
class ArticuloComentarioSearch extends ArticuloComentario
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'articulo_id', 'num_denuncias', 'bloqueado', 'crea_usuario_id', 'visible'], 'integer'],
            [['texto', 'fecha_denuncia1', 'fecha_bloqueo', 'notas_bloqueo', 'crea_fecha'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ArticuloComentario::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'articulo_id' => $this->articulo_id,
            'num_denuncias' => $this->num_denuncias,
            'fecha_denuncia1' => $this->fecha_denuncia1,
            'bloqueado' => $this->bloqueado,
            'fecha_bloqueo' => $this->fecha_bloqueo,
            'crea_usuario_id' => $this->crea_usuario_id,
            'crea_fecha' => $this->crea_fecha,
            'visible' => $this->visible,
        ]);

        $query->andFilterWhere(['like', 'texto', $this->texto])
            ->andFilterWhere(['like', 'notas_bloqueo', $this->notas_bloqueo]);

        return $dataProvider;
    }
}
