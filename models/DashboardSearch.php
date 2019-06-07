<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Lke;

/**
 * DashboardSearch represents the model behind the search form about `common\models\Lke`.
 */
class DashboardSearch extends Lke
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_lke', 'id_satker_FK', 'id_provinsi_FK', 'id_daerah_FK'], 'integer'],
            [['tahun', 'pengumpulan', 'kelengkapan', 'relevansi'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
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

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id_lke' => $this->id_lke,
            'id_satker_FK' => $this->id_satker_FK,
            'id_provinsi_FK' => $this->id_provinsi_FK,
            'id_daerah_FK' => $this->id_daerah_FK,
        ]);

        $query->andFilterWhere(['like', 'tahun', $this->tahun])
            ->andFilterWhere(['like', 'pengumpulan', $this->pengumpulan])
            ->andFilterWhere(['like', 'kelengkapan', $this->kelengkapan])
            ->andFilterWhere(['like', 'relevansi', $this->relevansi]);

        return $dataProvider;
    }
}
