<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Lke */

$this->title = 'Perbaru Beranda: ' . ' ' . $model->id_lke;
$this->params['breadcrumbs'][] = ['label' => $model->id_lke, 'url' => ['view', 'id' => $model->id_lke]];
$this->params['breadcrumbs'][] = 'Perbaru';
?>
<div class="lke-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
