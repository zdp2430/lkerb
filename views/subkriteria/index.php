<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SubkriteriaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Subkriteria';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="subkriteria-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Buat Subkriteria', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_subkriteria',
            'nama_subkriteria',
            'urutan',
            'poin',
            'idKriteriaFK.nama_kriteria',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
