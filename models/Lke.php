<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lke".
 *
 * @property int $id_lke
 * @property int $id_pilar_FK
 * @property string $proses_poin
 * @property string $hasil_poin
 * @property string $tahun
 * @property int $created_by
 * @property string $created_date
 * @property string $pengumpulan
 * @property string $kelengkapan
 *
 * @property Pilar $pilarFK
 * @property LkeDetail[] $lkeDetails
 */
class Lke extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lke';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_pilar_FK', 'proses_poin', 'hasil_poin', 'tahun', 'created_by', 'pengumpulan', 'kelengkapan'], 'required'],
            [['id_pilar_FK', 'created_by'], 'integer'],
            [['proses_poin', 'hasil_poin'], 'number'],
            [['created_date'], 'safe'],
            [['pengumpulan', 'kelengkapan'], 'string'],
            [['tahun'], 'string', 'max' => 10],
            [['id_pilar_FK'], 'exist', 'skipOnError' => true, 'targetClass' => Pilar::className(), 'targetAttribute' => ['id_pilar_FK' => 'id_pilar']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_lke' => 'Id Lke',
            'id_pilar_FK' => 'Id Pilar F K',
            'proses_poin' => 'Proses Poin',
            'hasil_poin' => 'Hasil Poin',
            'tahun' => 'Tahun',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'pengumpulan' => 'Pengumpulan',
            'kelengkapan' => 'Kelengkapan',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPilarFK()
    {
        return $this->hasOne(Pilar::className(), ['id_pilar' => 'id_pilar_FK']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLkeDetails()
    {
        return $this->hasMany(LkeDetail::className(), ['id_lke_FK' => 'id_lke']);
    }
}
