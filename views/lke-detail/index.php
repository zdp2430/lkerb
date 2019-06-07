<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\LkeDetailSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Lke Details';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lke-detail-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Lke Detail', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_lke_detail',
            'id_lke_FK',
            'id_bab_FK',
            'id_kriteria_FK',
            'id_subkriteria_FK',
            //'id_item_FK',
            //'id_bobot_FK',
            //'jawaban',
            //'nilai',
            //'persentase',
            //'dokumen_pendukung:ntext',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
