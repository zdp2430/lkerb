<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Bobot;

/**
 * BobotSearch represents the model behind the search form of `app\models\Bobot`.
 */
class BobotSearch extends Bobot
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_bobot'], 'integer'],
            [['nama_bobot', 'nilai_bobot'], 'safe'],
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
        $query = Bobot::find();

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
            'id_bobot' => $this->id_bobot,
        ]);

        $query->andFilterWhere(['like', 'nama_bobot', $this->nama_bobot])
            ->andFilterWhere(['like', 'nilai_bobot', $this->nilai_bobot]);

        return $dataProvider;
    }
}
