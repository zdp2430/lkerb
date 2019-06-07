<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "bab".
 *
 * @property int $id_bab
 * @property string $nama_bab
 */
class Bab extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'bab';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_bab'], 'required'],
            [['nama_bab'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_bab' => 'Id Bab',
            'nama_bab' => 'Nama Bab',
        ];
    }
}
