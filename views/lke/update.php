<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Lke */

$this->title = 'Update Lke: ' . $model->id_lke;
$this->params['breadcrumbs'][] = ['label' => 'Lkes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_lke, 'url' => ['view', 'id' => $model->id_lke]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="lke-update">

<?= $this->render('_form', [
        'babHasil' => $babHasil,
        'babProses' => $babProses,
        'kriterias' => $kriterias,
        'lkeDetail' => $lkeDetail,
        'model' => $model,
        'modelDetails' => $modelDetails,
    ]) ?>

</div>
