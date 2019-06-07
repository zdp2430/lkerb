<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "kriteria".
 *
 * @property int $id_kriteria
 * @property string $nama_kriteria
 * @property int $jumlah_subkriteria
 * @property int $urutan
 * @property int $id_bab_FK
 * @property int $poin
 */
class Kriteria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'kriteria';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_kriteria', 'jumlah_subkriteria', 'urutan', 'id_bab_FK', 'poin'], 'required'],
            [['jumlah_subkriteria', 'urutan', 'id_bab_FK', 'poin'], 'integer'],
            [['nama_kriteria'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_kriteria' => 'Id Kriteria',
            'nama_kriteria' => 'Nama Kriteria',
            'jumlah_subkriteria' => 'Jumlah Subkriteria',
            'urutan' => 'Urutan',
            'id_bab_FK' => 'Nama Bab', 
            'poin' => 'Poin',
        ];
    }

    public function getIdBabFK()
    {
        return $this->hasOne(Bab::className(), ['id_bab' => 'id_bab_FK']);
    }

}
