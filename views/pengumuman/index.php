<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PengumumanSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Pengumumen';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pengumuman-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Pengumuman', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_pengumuman',
            'judul_pengumuman',
            'isi_pengumuman:ntext',
            'kategori',
            'id_user_pembuat',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
