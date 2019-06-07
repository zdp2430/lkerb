<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "users".
 *
 * @property int $id
 * @property string $nama
 * @property string $username
 * @property string $password
 * @property string $authKey
 * @property string $accessToken
 * @property int $update_at
 * @property int $id_level_FK
 * @property resource $foto
 * @property string $email
 * @property string $tempat_lahir
 * @property string $tanggal_lahir
 * @property string $jenis_kelamin
 * @property string $agama
 * @property string $unit_kerja
 * @property string $posisi
 * @property string $no_telp
 * @property int $NIP
 *
 * @property Notifikasi[] $notifikasis
 * @property UsersDetail[] $usersDetails
 */
class Users extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'users';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama', 'username', 'password', 'authKey', 'accessToken', 'update_at', 'id_level_FK', 'foto', 'email', 'tempat_lahir', 'tanggal_lahir', 'jenis_kelamin', 'agama', 'unit_kerja', 'posisi', 'no_telp', 'NIP'], 'required'],
            [['update_at', 'id_level_FK', 'NIP'], 'integer'],
            [['foto', 'jenis_kelamin', 'agama'], 'string'],
            [['tanggal_lahir'], 'safe'],
            [['nama', 'password', 'authKey', 'accessToken', 'tempat_lahir', 'no_telp'], 'string', 'max' => 100],
            [['username'], 'string', 'max' => 50],
            [['email', 'unit_kerja', 'posisi'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nama' => 'Nama',
            'username' => 'Username',
            'password' => 'Password',
            'authKey' => 'Auth Key',
            'accessToken' => 'Access Token',
            'update_at' => 'Update At',
            'id_level_FK' => 'Id Level F K',
            'foto' => 'Foto',
            'email' => 'Email',
            'tempat_lahir' => 'Tempat Lahir',
            'tanggal_lahir' => 'Tanggal Lahir',
            'jenis_kelamin' => 'Jenis Kelamin',
            'agama' => 'Agama',
            'unit_kerja' => 'Unit Kerja',
            'posisi' => 'Posisi',
            'no_telp' => 'No Telp',
            'NIP' => 'N I P',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNotifikasis()
    {
        return $this->hasMany(Notifikasi::className(), ['id_user_FK' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsersDetails()
    {
        return $this->hasMany(UsersDetail::className(), ['id_user_FK' => 'id']);
    }
}
