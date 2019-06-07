<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "item".
 *
 * @property int $id_item
 * @property string $penilaian
 * @property string $penjelasan
 * @property int $id_subkriteria_FK
 * @property int $id_kriteria_FK
 * @property int $id_bobot_FK
 */
class Item extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['penilaian', 'penjelasan', 'id_subkriteria_FK', 'id_kriteria_FK', 'id_bobot_FK'], 'required'],
            [['penjelasan'], 'string'],
            [['id_subkriteria_FK', 'id_kriteria_FK', 'id_bobot_FK'], 'integer'],
            [['penilaian'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_item' => 'Id Item',
            'penilaian' => 'Penilaian',
            'penjelasan' => 'Penjelasan',
            'id_subkriteria_FK' => 'Nama Subkriteria',
            'id_kriteria_FK' => 'Nama Kriteria',
            //'id_bobot_FK' => 'Nama Bobot',
        ];
    }

    public function getIdKriteriaFK(){
        return $this->hasOne(Kriteria::className(), ['id_kriteria' => 'id_kriteria_FK']);
    }

    public function getIdSubkriteriaFK(){
        return $this->hasOne(Subkriteria::className(), ['id_subkriteria' => 'id_subkriteria_FK']);
    }
}
