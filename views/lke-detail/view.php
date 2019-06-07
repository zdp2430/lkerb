<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\LkeDetail */

$this->title = $model->id_lke_detail;
$this->params['breadcrumbs'][] = ['label' => 'Lke Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="lke-detail-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_lke_detail], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_lke_detail], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_lke_detail',
            'id_lke_FK',
            'id_bab_FK',
            'id_kriteria_FK',
            'id_subkriteria_FK',
            'id_item_FK',
            'id_bobot_FK',
            'jawaban',
            'nilai',
            'persentase',
            'dokumen_pendukung:ntext',
        ],
    ]) ?>

</div>
