<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\LkeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Lkes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lke-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Lke', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_lke',
            'id_pilar_FK',
            'proses_poin',
            'hasil_poin',
            'tahun',
            //'created_by',
            //'created_date',
            //'pengumpulan',
            //'kelengkapan',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
