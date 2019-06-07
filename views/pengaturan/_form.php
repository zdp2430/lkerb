<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Pengaturan */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pengaturan-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'kode_pengaturan')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nilai_pengaturan')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'deskripsi')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
