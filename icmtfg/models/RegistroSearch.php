<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Registro;

/**
 * RegistroSearch represents the model behind the search form of `app\models\Registro`.
 */
class RegistroSearch extends Registro
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['fecha_registro', 'clase_log_id', 'modulo', 'texto', 'ip', 'browser'], 'safe'],
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
        $query = Registro::find();

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
            'fecha_registro' => $this->fecha_registro,
        ]);

        $query->andFilterWhere(['like', 'clase_log_id', $this->clase_log_id])
            ->andFilterWhere(['like', 'modulo', $this->modulo])
            ->andFilterWhere(['like', 'texto', $this->texto])
            ->andFilterWhere(['like', 'ip', $this->ip])
            ->andFilterWhere(['like', 'browser', $this->browser]);

        return $dataProvider;
    }
}
