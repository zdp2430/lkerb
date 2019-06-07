<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "bobot".
 *
 * @property int $id_bobot
 * @property string $nama_bobot
 * @property string $nilai_bobot
 */
class Bobot extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'bobot';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_bobot', 'nilai_bobot'], 'required'],
            [['nama_bobot', 'nilai_bobot'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_bobot' => 'Id Bobot',
            'nama_bobot' => 'Nama Bobot',
            'nilai_bobot' => 'Nilai Bobot',
        ];
    }
}
