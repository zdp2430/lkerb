<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\DashboardSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lke-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_lke') ?>

    <?= $form->field($model, 'id_satker_FK') ?>

    <?= $form->field($model, 'id_provinsi_FK') ?>

    <?= $form->field($model, 'id_daerah_FK') ?>

    <?= $form->field($model, 'tahun') ?>

    <?php // echo $form->field($model, 'pengumpulan') ?>

    <?php // echo $form->field($model, 'kelengkapan') ?>

    <?php // echo $form->field($model, 'relevansi') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
