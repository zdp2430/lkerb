<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "subkriteria".
 *
 * @property int $id_subkriteria
 * @property string $nama_subkriteria
 * @property int $urutan
 * @property string $poin
 * @property int $id_kriteria_FK
 */
class Subkriteria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'subkriteria';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_subkriteria', 'urutan', 'poin', 'id_kriteria_FK'], 'required'],
            [['urutan', 'id_kriteria_FK'], 'integer'],
            [['poin'], 'number'],
            [['nama_subkriteria'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_subkriteria' => 'Id Subkriteria',
            'nama_subkriteria' => 'Nama Subkriteria',
            'urutan' => 'Urutan',
            'poin' => 'Poin',
            'id_kriteria_FK' => 'Nama Kriteria',
        ];
    }

        public function getIdKriteriaFK(){
        return $this->hasOne(Kriteria::className(), ['id_kriteria' => 'id_kriteria_FK']);
    }

    
}
