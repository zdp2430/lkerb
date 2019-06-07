<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Pengumuman */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pengumuman-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'judul_pengumuman')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'isi_pengumuman')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'kategori')->dropDownList([ 'Tidak Penting' => 'Tidak Penting', 'Penting' => 'Penting', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'id_user_pembuat')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
