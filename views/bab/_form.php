<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Bab */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bab-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nama_bab')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
