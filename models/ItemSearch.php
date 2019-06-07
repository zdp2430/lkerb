<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Item;

/**
 * ItemSearch represents the model behind the search form of `app\models\Item`.
 */
class ItemSearch extends Item
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_item', 'id_subkriteria_FK', 'id_kriteria_FK', 'id_bobot_FK'], 'integer'],
            [['penilaian', 'penjelasan'], 'safe'],
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
        $query = Item::find();

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
            'id_item' => $this->id_item,
            'id_subkriteria_FK' => $this->id_subkriteria_FK,
            'id_kriteria_FK' => $this->id_kriteria_FK,
            'id_bobot_FK' => $this->id_bobot_FK,
        ]);

        $query->andFilterWhere(['like', 'penilaian', $this->penilaian])
            ->andFilterWhere(['like', 'penjelasan', $this->penjelasan]);

        return $dataProvider;
    }
}
