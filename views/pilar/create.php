<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Pilar */

$this->title = 'Create Pilar';
$this->params['breadcrumbs'][] = ['label' => 'Pilars', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pilar-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
