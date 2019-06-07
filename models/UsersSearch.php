<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Users;

/**
 * UsersSearch represents the model behind the search form of `app\models\Users`.
 */
class UsersSearch extends Users
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'update_at', 'id_level_FK', 'NIP'], 'integer'],
            [['nama', 'username', 'password', 'authKey', 'accessToken', 'foto', 'email', 'tempat_lahir', 'tanggal_lahir', 'jenis_kelamin', 'agama', 'unit_kerja', 'posisi', 'no_telp'], 'safe'],
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
        $query = Users::find();

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
            'id' => $this->id,
            'update_at' => $this->update_at,
            'id_level_FK' => $this->id_level_FK,
            'tanggal_lahir' => $this->tanggal_lahir,
            'NIP' => $this->NIP,
        ]);

        $query->andFilterWhere(['like', 'nama', $this->nama])
            ->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'password', $this->password])
            ->andFilterWhere(['like', 'authKey', $this->authKey])
            ->andFilterWhere(['like', 'accessToken', $this->accessToken])
            ->andFilterWhere(['like', 'foto', $this->foto])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'tempat_lahir', $this->tempat_lahir])
            ->andFilterWhere(['like', 'jenis_kelamin', $this->jenis_kelamin])
            ->andFilterWhere(['like', 'agama', $this->agama])
            ->andFilterWhere(['like', 'unit_kerja', $this->unit_kerja])
            ->andFilterWhere(['like', 'posisi', $this->posisi])
            ->andFilterWhere(['like', 'no_telp', $this->no_telp]);

        return $dataProvider;
    }
}
