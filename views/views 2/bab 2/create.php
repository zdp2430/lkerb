<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Bab */

$this->title = 'Buat Bab';
$this->params['breadcrumbs'][] = ['label' => 'Babs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bab-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
