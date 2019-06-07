<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Kriteria;

/**
 * KriteriaSearch represents the model behind the search form of `app\models\Kriteria`.
 */
class KriteriaSearch extends Kriteria
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_kriteria', 'jumlah_subkriteria', 'urutan', 'id_bab_FK', 'poin'], 'integer'],
            [['nama_kriteria'], 'safe'],
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
        $query = Kriteria::find();

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
            'id_kriteria' => $this->id_kriteria,
            'jumlah_subkriteria' => $this->jumlah_subkriteria,
            'urutan' => $this->urutan,
            'id_bab_FK' => $this->id_bab_FK,
            'poin' => $this->poin,
        ]);

        $query->andFilterWhere(['like', 'nama_kriteria', $this->nama_kriteria]);

        return $dataProvider;
    }
}
