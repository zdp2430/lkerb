<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\BobotSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bobots';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bobot-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Bobot', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_bobot',
            'nama_bobot',
            'nilai_bobot',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
