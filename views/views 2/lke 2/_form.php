<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Lke */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lke-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_pilar_FK')->textInput() ?>

    <?= $form->field($model, 'proses_poin')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'hasil_poin')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tahun')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'created_date')->textInput() ?>

    <?= $form->field($model, 'pengumpulan')->dropDownList([ 'Belum Mengumpulkan' => 'Belum Mengumpulkan', 'Sudah Mengumpulkan' => 'Sudah Mengumpulkan', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'kelengkapan')->dropDownList([ 'Belum Lengkap' => 'Belum Lengkap', 'Sudah Lengkap' => 'Sudah Lengkap', ], ['prompt' => '']) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
