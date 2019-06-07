<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PilarSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Pilars';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pilar-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Pilar', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_pilar',
            'nama_pilar',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
