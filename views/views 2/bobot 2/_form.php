<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Bobot */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bobot-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nama_bobot')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nilai_bobot')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
