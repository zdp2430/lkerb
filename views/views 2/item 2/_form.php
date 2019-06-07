<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Item */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'penilaian')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'penjelasan')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'id_subkriteria_FK')->textInput() ?>

    <?= $form->field($model, 'id_kriteria_FK')->textInput() ?>

    <?= $form->field($model, 'id_bobot_FK')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
