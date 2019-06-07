<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lke_detail".
 *
 * @property int $id_lke_detail
 * @property int $id_lke_FK
 * @property int $id_bab_FK
 * @property int $id_kriteria_FK
 * @property int $id_subkriteria_FK
 * @property int $id_item_FK
 * @property int $id_bobot_FK
 * @property string $jawaban
 * @property string $nilai
 * @property string $persentase
 * @property string $dokumen_pendukung
 *
 * @property Lke $lkeFK
 * @property Bab $babFK
 * @property Kriteria $kriteriaFK
 * @property Subkriteria $subkriteriaFK
 * @property Item $itemFK
 * @property Bobot $bobotFK
 */
class LkeDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lke_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_lke_FK', 'id_bab_FK', 'id_kriteria_FK', 'id_subkriteria_FK', 'id_item_FK', 'id_bobot_FK', 'jawaban', 'nilai', 'persentase', 'dokumen_pendukung'], 'required'],
            [['id_lke_FK', 'id_bab_FK', 'id_kriteria_FK', 'id_subkriteria_FK', 'id_item_FK', 'id_bobot_FK'], 'integer'],
            [['nilai', 'persentase'], 'number'],
            [['dokumen_pendukung'], 'string'],
            [['jawaban'], 'string', 'max' => 255],
            [['id_bab_FK'], 'unique'],
            [['id_lke_FK'], 'exist', 'skipOnError' => true, 'targetClass' => Lke::className(), 'targetAttribute' => ['id_lke_FK' => 'id_lke']],
            [['id_bab_FK'], 'exist', 'skipOnError' => true, 'targetClass' => Bab::className(), 'targetAttribute' => ['id_bab_FK' => 'id_bab']],
            [['id_kriteria_FK'], 'exist', 'skipOnError' => true, 'targetClass' => Kriteria::className(), 'targetAttribute' => ['id_kriteria_FK' => 'id_kriteria']],
            [['id_subkriteria_FK'], 'exist', 'skipOnError' => true, 'targetClass' => Subkriteria::className(), 'targetAttribute' => ['id_subkriteria_FK' => 'id_subkriteria']],
            [['id_item_FK'], 'exist', 'skipOnError' => true, 'targetClass' => Item::className(), 'targetAttribute' => ['id_item_FK' => 'id_item']],
            [['id_bobot_FK'], 'exist', 'skipOnError' => true, 'targetClass' => Bobot::className(), 'targetAttribute' => ['id_bobot_FK' => 'id_bobot']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_lke_detail' => 'Id Lke Detail',
            'id_lke_FK' => 'Id Lke F K',
            'id_bab_FK' => 'Id Bab F K',
            'id_kriteria_FK' => 'Id Kriteria F K',
            'id_subkriteria_FK' => 'Id Subkriteria F K',
            'id_item_FK' => 'Id Item F K',
            'id_bobot_FK' => 'Id Bobot F K',
            'jawaban' => 'Jawaban',
            'nilai' => 'Nilai',
            'persentase' => 'Persentase',
            'dokumen_pendukung' => 'Dokumen Pendukung',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLkeFK()
    {
        return $this->hasOne(Lke::className(), ['id_lke' => 'id_lke_FK']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBabFK()
    {
        return $this->hasOne(Bab::className(), ['id_bab' => 'id_bab_FK']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKriteriaFK()
    {
        return $this->hasOne(Kriteria::className(), ['id_kriteria' => 'id_kriteria_FK']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubkriteriaFK()
    {
        return $this->hasOne(Subkriteria::className(), ['id_subkriteria' => 'id_subkriteria_FK']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemFK()
    {
        return $this->hasOne(Item::className(), ['id_item' => 'id_item_FK']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBobotFK()
    {
        return $this->hasOne(Bobot::className(), ['id_bobot' => 'id_bobot_FK']);
    }
}
