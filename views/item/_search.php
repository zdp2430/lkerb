<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ItemSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_item') ?>

    <?= $form->field($model, 'penilaian') ?>

    <?= $form->field($model, 'penjelasan') ?>

    <?= $form->field($model, 'id_subkriteria_FK') ?>

    <?= $form->field($model, 'id_kriteria_FK') ?>

    <?php // echo $form->field($model, 'id_bobot_FK') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
