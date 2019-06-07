<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\PengumumanSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pengumuman-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_pengumuman') ?>

    <?= $form->field($model, 'judul_pengumuman') ?>

    <?= $form->field($model, 'isi_pengumuman') ?>

    <?= $form->field($model, 'kategori') ?>

    <?= $form->field($model, 'id_user_pembuat') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
