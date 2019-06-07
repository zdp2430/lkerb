<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pengaturan".
 *
 * @property int $id_pengaturan
 * @property string $kode_pengaturan
 * @property string $nilai_pengaturan
 * @property string $deskripsi
 */
class Pengaturan extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pengaturan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['kode_pengaturan', 'nilai_pengaturan', 'deskripsi'], 'required'],
            [['nilai_pengaturan', 'deskripsi'], 'string'],
            [['kode_pengaturan'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_pengaturan' => 'Id Pengaturan',
            'kode_pengaturan' => 'Kode Pengaturan',
            'nilai_pengaturan' => 'Nilai Pengaturan',
            'deskripsi' => 'Deskripsi',
        ];
    }
}
