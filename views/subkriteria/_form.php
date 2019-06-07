<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Subkriteria */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="subkriteria-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nama_subkriteria')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'urutan')->textInput() ?>

    <?= $form->field($model, 'poin')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'id_kriteria_FK')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
