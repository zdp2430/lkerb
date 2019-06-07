<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Lke */

$this->title = 'Create Lke';
$this->params['breadcrumbs'][] = ['label' => 'Lkes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lke-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
