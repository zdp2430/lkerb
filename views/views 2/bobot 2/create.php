<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Bobot */

$this->title = 'Create Bobot';
$this->params['breadcrumbs'][] = ['label' => 'Bobots', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bobot-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
