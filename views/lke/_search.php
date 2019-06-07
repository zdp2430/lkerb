<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\LkeSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lke-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_lke') ?>

    <?= $form->field($model, 'id_pilar_FK') ?>

    <?= $form->field($model, 'proses_poin') ?>

    <?= $form->field($model, 'hasil_poin') ?>

    <?= $form->field($model, 'tahun') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'created_date') ?>

    <?php // echo $form->field($model, 'pengumpulan') ?>

    <?php // echo $form->field($model, 'kelengkapan') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
