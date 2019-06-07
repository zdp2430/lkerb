<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Bobot */

$this->title = 'Update Bobot: ' . $model->id_bobot;
$this->params['breadcrumbs'][] = ['label' => 'Bobots', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_bobot, 'url' => ['view', 'id' => $model->id_bobot]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="bobot-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
