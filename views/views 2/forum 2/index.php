<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ForumSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Forums';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="forum-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Forum', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_forum',
            'judul_forum',
            'isi_forum:ntext',
            'jumlah_post',
            'waktu',
            //'id_pembuat',
            //'jumlah_dilliat',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
