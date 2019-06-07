<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Forum;

/**
 * ForumSearch represents the model behind the search form of `app\models\Forum`.
 */
class ForumSearch extends Forum
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_forum', 'jumlah_post', 'id_pembuat', 'jumlah_dilliat'], 'integer'],
            [['judul_forum', 'isi_forum', 'waktu'], 'safe'],
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
        $query = Forum::find();

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
            'id_forum' => $this->id_forum,
            'jumlah_post' => $this->jumlah_post,
            'waktu' => $this->waktu,
            'id_pembuat' => $this->id_pembuat,
            'jumlah_dilliat' => $this->jumlah_dilliat,
        ]);

        $query->andFilterWhere(['like', 'judul_forum', $this->judul_forum])
            ->andFilterWhere(['like', 'isi_forum', $this->isi_forum]);

        return $dataProvider;
    }
}
