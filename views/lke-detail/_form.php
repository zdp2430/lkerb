<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\LkeDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lke-detail-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_lke_FK')->textInput() ?>

    <?= $form->field($model, 'id_bab_FK')->textInput() ?>

    <?= $form->field($model, 'id_kriteria_FK')->textInput() ?>

    <?= $form->field($model, 'id_subkriteria_FK')->textInput() ?>

    <?= $form->field($model, 'id_item_FK')->textInput() ?>

    <?= $form->field($model, 'id_bobot_FK')->textInput() ?>

    <?= $form->field($model, 'jawaban')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nilai')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'persentase')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'dokumen_pendukung')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
