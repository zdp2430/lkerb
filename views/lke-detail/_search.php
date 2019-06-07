<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\LkeDetailSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lke-detail-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_lke_detail') ?>

    <?= $form->field($model, 'id_lke_FK') ?>

    <?= $form->field($model, 'id_bab_FK') ?>

    <?= $form->field($model, 'id_kriteria_FK') ?>

    <?= $form->field($model, 'id_subkriteria_FK') ?>

    <?php // echo $form->field($model, 'id_item_FK') ?>

    <?php // echo $form->field($model, 'id_bobot_FK') ?>

    <?php // echo $form->field($model, 'jawaban') ?>

    <?php // echo $form->field($model, 'nilai') ?>

    <?php // echo $form->field($model, 'persentase') ?>

    <?php // echo $form->field($model, 'dokumen_pendukung') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
