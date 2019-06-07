<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\KriteriaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="kriteria-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_kriteria') ?>

    <?= $form->field($model, 'nama_kriteria') ?>

    <?= $form->field($model, 'jumlah_subkriteria') ?>

    <?= $form->field($model, 'urutan') ?>

    <?= $form->field($model, 'id_bab_FK') ?>

    <?php // echo $form->field($model, 'poin') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
