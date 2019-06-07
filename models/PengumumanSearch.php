<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Pengumuman;

/**
 * PengumumanSearch represents the model behind the search form of `app\models\Pengumuman`.
 */
class PengumumanSearch extends Pengumuman
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_pengumuman', 'id_user_pembuat'], 'integer'],
            [['judul_pengumuman', 'isi_pengumuman', 'kategori'], 'safe'],
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
        $query = Pengumuman::find();

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
            'id_pengumuman' => $this->id_pengumuman,
            'id_user_pembuat' => $this->id_user_pembuat,
        ]);

        $query->andFilterWhere(['like', 'judul_pengumuman', $this->judul_pengumuman])
            ->andFilterWhere(['like', 'isi_pengumuman', $this->isi_pengumuman])
            ->andFilterWhere(['like', 'kategori', $this->kategori]);

        return $dataProvider;
    }
}
