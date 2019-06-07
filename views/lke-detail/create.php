<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\LkeDetail */

$this->title = 'Create Lke Detail';
$this->params['breadcrumbs'][] = ['label' => 'Lke Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lke-detail-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
