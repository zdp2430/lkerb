<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Lke */

$this->title .= 'Beranda ' .$model->id_lke;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lke-view">

    <p>
    <?php if (in_array(Yii::$app->user->identity->id_level_FK, ['4'])) : ?>
        <?= Html::a('Perbaru', ['update', 'id' => $model->id_lke], ['class' => 'btn btn-primary']) ?>
    <?php endif; ?>    
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_lke',
            'idSatkerFK.nama_satker',
            [
                'attribute'=>'id_provinsi_FK',
                'value' => function ($model) {
                    $provinsi = '';

                    if ($model->idProvinsiFK) {
                    $provinsi .= $model->idProvinsiFK->nama_daerah;
                    }
                    if ($model->idDaerahFK) {
                    $provinsi .= ' - '.$model->idDaerahFK->nama_daerah;
                    }

                    return $provinsi;
                },
            ],
            'tahun',
            'pengumpulan',
            'kelengkapan',
            'relevansi',
        ],
    ]) ?>

</div>

