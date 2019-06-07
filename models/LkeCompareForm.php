<?php

namespace app\models;

use Yii;
use yii\base\Model;

class LkeCompareForm extends Model
{
    public $id_lke;
    public $id_lke_2;

    public function rules()
    {
        return [
            [['id_lke', 'id_lke_2'], 'required'],
        ];
    }
}
