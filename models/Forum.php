<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "forum".
 *
 * @property int $id_forum
 * @property string $judul_forum
 * @property string $isi_forum
 * @property int $jumlah_post
 * @property string $waktu
 * @property int $id_pembuat
 * @property int $jumlah_dilliat
 */
class Forum extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'forum';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['judul_forum', 'isi_forum', 'jumlah_post', 'id_pembuat', 'jumlah_dilliat'], 'required'],
            [['isi_forum'], 'string'],
            [['jumlah_post', 'id_pembuat', 'jumlah_dilliat'], 'integer'],
            [['waktu'], 'safe'],
            [['judul_forum'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_forum' => 'Id Forum',
            'judul_forum' => 'Judul Forum',
            'isi_forum' => 'Isi Forum',
            'jumlah_post' => 'Jumlah Post',
            'waktu' => 'Waktu',
            'id_pembuat' => 'Id Pembuat',
            'jumlah_dilliat' => 'Jumlah Dilliat',
        ];
    }
}
