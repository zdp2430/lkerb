<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pilar".
 *
 * @property int $id_pilar
 * @property string $nama_pilar
 *
 * @property Lke[] $lkes
 */
class Pilar extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pilar';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_pilar'], 'required'],
            [['nama_pilar'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_pilar' => 'Id Pilar',
            'nama_pilar' => 'Nama Pilar',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLkes()
    {
        return $this->hasMany(Lke::className(), ['id_pilar_FK' => 'id_pilar']);
    }
}
