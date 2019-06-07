<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Subkriteria */

$this->title = 'Buat Subkriteria';
$this->params['breadcrumbs'][] = ['label' => 'Subkriterias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="subkriteria-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
