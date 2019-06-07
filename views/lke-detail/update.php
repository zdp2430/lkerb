<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\LkeDetail */

$this->title = 'Update Lke Detail: ' . $model->id_lke_detail;
$this->params['breadcrumbs'][] = ['label' => 'Lke Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_lke_detail, 'url' => ['view', 'id' => $model->id_lke_detail]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="lke-detail-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
