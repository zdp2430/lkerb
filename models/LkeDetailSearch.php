<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\LkeDetail;

/**
 * LkeDetailSearch represents the model behind the search form of `app\models\LkeDetail`.
 */
class LkeDetailSearch extends LkeDetail
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_lke_detail', 'id_lke_FK', 'id_bab_FK', 'id_kriteria_FK', 'id_subkriteria_FK', 'id_item_FK', 'id_bobot_FK'], 'integer'],
            [['jawaban', 'dokumen_pendukung'], 'safe'],
            [['nilai', 'persentase'], 'number'],
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
        $query = LkeDetail::find();

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
            'id_lke_detail' => $this->id_lke_detail,
            'id_lke_FK' => $this->id_lke_FK,
            'id_bab_FK' => $this->id_bab_FK,
            'id_kriteria_FK' => $this->id_kriteria_FK,
            'id_subkriteria_FK' => $this->id_subkriteria_FK,
            'id_item_FK' => $this->id_item_FK,
            'id_bobot_FK' => $this->id_bobot_FK,
            'nilai' => $this->nilai,
            'persentase' => $this->persentase,
        ]);

        $query->andFilterWhere(['like', 'jawaban', $this->jawaban])
            ->andFilterWhere(['like', 'dokumen_pendukung', $this->dokumen_pendukung]);

        return $dataProvider;
    }
}
