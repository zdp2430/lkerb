<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Forum */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="forum-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'judul_forum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'isi_forum')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'jumlah_post')->textInput() ?>

    <?= $form->field($model, 'waktu')->textInput() ?>

    <?= $form->field($model, 'id_pembuat')->textInput() ?>

    <?= $form->field($model, 'jumlah_dilliat')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
