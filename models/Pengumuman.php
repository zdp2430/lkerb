<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pengumuman".
 *
 * @property int $id_pengumuman
 * @property string $judul_pengumuman
 * @property string $isi_pengumuman
 * @property string $kategori
 * @property int $id_user_pembuat
 */
class Pengumuman extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pengumuman';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['judul_pengumuman', 'isi_pengumuman', 'kategori', 'id_user_pembuat'], 'required'],
            [['isi_pengumuman', 'kategori'], 'string'],
            [['id_user_pembuat'], 'integer'],
            [['judul_pengumuman'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_pengumuman' => 'Id Pengumuman',
            'judul_pengumuman' => 'Judul Pengumuman',
            'isi_pengumuman' => 'Isi Pengumuman',
            'kategori' => 'Kategori',
            'id_user_pembuat' => 'Id User Pembuat',
        ];
    }
}
