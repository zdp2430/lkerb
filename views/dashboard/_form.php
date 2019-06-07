<?php

use common\models\Daerah;
use common\models\Satker;
use kartik\select2\Select2;
use kartik\widgets\DepDrop;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model common\models\Lke */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lke-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_satker_FK')->widget(Select2::classname(), [
            'data' => ArrayHelper::map(Satker::find()->all(), 'id_satker', 'nama_satker'),
            'options' => ['placeholder' => 'Pilih Satuan Kerja ...'],
            'pluginOptions' => ['allowClear' => true],
        ]); ?>
    
    <?php if ($model->isNewRecord) {
        $model->tahun = date('Y');
        } ?>
    <?= $form->field($model, 'tahun')->textInput(['readonly' => 'readonly']); ?>

    <?= $form->field($model, 'pengumpulan')->dropDownList([ 'Sudah Mengumpulkan' => 'Sudah Mengumpulkan', 'Belum Mengumpulkan' => 'Belum Mengumpulkan', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'kelengkapan')->dropDownList([ 'Sudah Lengkap' => 'Sudah Lengkap', 'Belum Lengkap' => 'Belum Lengkap', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'relevansi')->dropDownList([ 'Relevan' => 'Relevan', 'Kurang Relevan' => 'Kurang Relevan', 'Tidak Relevan' => 'Tidak Relevan',], ['prompt' => '']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Buat' : 'Perbaru', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
