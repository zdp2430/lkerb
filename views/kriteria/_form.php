<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Kriteria */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="kriteria-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nama_kriteria')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'jumlah_subkriteria')->textInput() ?>

    <?= $form->field($model, 'urutan')->textInput() ?>

    <?= $form->field($model, 'id_bab_FK')->textInput() ?>

    <?= $form->field($model, 'poin')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
