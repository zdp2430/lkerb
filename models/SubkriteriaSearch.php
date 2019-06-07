<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Subkriteria;

/**
 * SubkriteriaSearch represents the model behind the search form of `app\models\Subkriteria`.
 */
class SubkriteriaSearch extends Subkriteria
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_subkriteria', 'urutan', 'id_kriteria_FK'], 'integer'],
            [['nama_subkriteria'], 'safe'],
            [['poin'], 'number'],
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
        $query = Subkriteria::find();

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
            'id_subkriteria' => $this->id_subkriteria,
            'urutan' => $this->urutan,
            'poin' => $this->poin,
            'id_kriteria_FK' => $this->id_kriteria_FK,
        ]);

        $query->andFilterWhere(['like', 'nama_subkriteria', $this->nama_subkriteria]);

        return $dataProvider;
    }
}
