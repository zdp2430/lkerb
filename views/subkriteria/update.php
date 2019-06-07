<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Subkriteria */

$this->title = 'Update Subkriteria: ' . $model->id_subkriteria;
$this->params['breadcrumbs'][] = ['label' => 'Subkriterias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_subkriteria, 'url' => ['view', 'id' => $model->id_subkriteria]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="subkriteria-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
