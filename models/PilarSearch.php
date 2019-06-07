<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Pilar;

/**
 * PilarSearch represents the model behind the search form of `app\models\Pilar`.
 */
class PilarSearch extends Pilar
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_pilar'], 'integer'],
            [['nama_pilar'], 'safe'],
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
        $query = Pilar::find();

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
            'id_pilar' => $this->id_pilar,
        ]);

        $query->andFilterWhere(['like', 'nama_pilar', $this->nama_pilar]);

        return $dataProvider;
    }
}
