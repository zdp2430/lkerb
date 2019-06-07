<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Pilar */

$this->title = 'Update Pilar: ' . $model->id_pilar;
$this->params['breadcrumbs'][] = ['label' => 'Pilars', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_pilar, 'url' => ['view', 'id' => $model->id_pilar]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="pilar-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
