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

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
