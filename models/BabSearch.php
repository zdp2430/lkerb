<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Bab;

/**
 * BabSearch represents the model behind the search form of `app\models\Bab`.
 */
class BabSearch extends Bab
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_bab'], 'integer'],
            [['nama_bab'], 'safe'],
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
        $query = Bab::find();

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
            'id_bab' => $this->id_bab,
        ]);

        $query->andFilterWhere(['like', 'nama_bab', $this->nama_bab]);

        return $dataProvider;
    }
}
