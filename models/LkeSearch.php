<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Lke;

/**
 * LkeSearch represents the model behind the search form of `app\models\Lke`.
 */
class LkeSearch extends Lke
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_lke', 'id_pilar_FK', 'created_by'], 'integer'],
            [['proses_poin', 'hasil_poin'], 'number'],
            [['tahun', 'created_date', 'pengumpulan', 'kelengkapan'], 'safe'],
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
        $query = Lke::find();

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
            'id_lke' => $this->id_lke,
            'id_pilar_FK' => $this->id_pilar_FK,
            'proses_poin' => $this->proses_poin,
            'hasil_poin' => $this->hasil_poin,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
        ]);

        $query->andFilterWhere(['like', 'tahun', $this->tahun])
            ->andFilterWhere(['like', 'pengumpulan', $this->pengumpulan])
            ->andFilterWhere(['like', 'kelengkapan', $this->kelengkapan]);

        return $dataProvider;
    }
}
