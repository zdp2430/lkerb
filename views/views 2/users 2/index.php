<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="users-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Users', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nama',
            'username',
            'password',
            'authKey',
            //'accessToken',
            //'update_at',
            //'id_level_FK',
            //'foto',
            //'email:email',
            //'tempat_lahir',
            //'tanggal_lahir',
            //'jenis_kelamin',
            //'agama',
            //'unit_kerja',
            //'posisi',
            //'no_telp',
            //'NIP',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
