<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ForumSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="forum-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_forum') ?>

    <?= $form->field($model, 'judul_forum') ?>

    <?= $form->field($model, 'isi_forum') ?>

    <?= $form->field($model, 'jumlah_post') ?>

    <?= $form->field($model, 'waktu') ?>

    <?php // echo $form->field($model, 'id_pembuat') ?>

    <?php // echo $form->field($model, 'jumlah_dilliat') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
