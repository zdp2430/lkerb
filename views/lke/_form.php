<?php

use models\Bab;
use models\Bobot;
use models\Item;
use models\Kriteria;
use models\Pilarr;
use models\Subkriteria;
use kartik\widgets\Select2, kartik\widgets\TouchSpin;
use xvs32x\tinymce\Tinymce;
use yii\bootstrap\Modal;
use yii\helpers\ArrayHelper, yii\helpers\Html, yii\helpers\Url;
use yii\web\View;

use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Lke */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lke-form">

<div class="box box-default">
        <div class="box-header with-border">
            <div class="row">
                <div class="col-md-12" style="text-align:center">
                    <label><h2><b>LEMBAR KERJA EVALUASI REFORMASI BIROKRASI/b></h2></label>
                </div>
            </div>
        </div>

        <?php $i = 0; ?>
        <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

        <div class="box-body with-border">
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'id_pilar_FK')->widget(Select2::classname(), [
                        'data' => ArrayHelper::map(Pilar::find()->orderBy(['nama_pilar' => SORT_ASC])->all(), 'id_pilar', 'nama_pilar'),
                        'options' => ['placeholder' => 'Pilih Pilar ...'],
                        'pluginOptions' => ['allowClear' => true],
                    ]); ?>
                </div>
                <div class="col-md-6">
                	<?php if ($model->isNewRecord) {
                		$model->tahun = date('Y');
                	} ?>
                	<?= $form->field($model, 'tahun')->textInput(['readonly' => 'readonly']); ?>
                </div>
            </div>
        </div>

        <div class="box-body with-border">
            <?php foreach((array) $babProses as $bab) : ?>
                <div class="row">
                    <div class="col-md-12">
                        <h3>
                            <b><?= $bab->nama_bab; ?></b>
                        </h3>

                        <ol type="I">
                            <?php $kriterias = $bab->kriterias; ?>
                            <?php foreach((array) $kriterias as $kriteria) : ?>
                                <li>
                                    <h4><?= $kriteria->nama_kriteria; ?></h4>
                                    <?php $subKriterias = $kriteria->subkriterias; ?>
                                    <ol>

                                        <?php foreach((array) $subKriterias as $subKriteria) : ?>
                                            <li>
                                                <h5><?= $subKriteria->nama_sub; ?></h5>
                                                <?php $items = $subKriteria->items; ?>
                                                <ol type="a">

                                                    <?php foreach((array) $items as $item) : ?>
                                                        <li>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_bab_FK')->hiddenInput(['value' => $bab->id_bab])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_kriteria_FK')->hiddenInput(['value' => $kriteria->id_kriteria])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_subkriteria_FK')->hiddenInput(['value' => $subKriteria->id_subkriteria])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_item_FK')->hiddenInput(['value' => $item->id_item])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_bobot_FK')->hiddenInput(['value' => $item->idBobotFK->id_bobot])->label(false); ?>

                                                            <h6><?= $item->penilaian; ?></h6>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <?php Modal::begin([
                                                                        'header' => 'Keterangan',
                                                                        'size' => 'modal-md',
                                                                        'toggleButton' => ['class' => 'btn btn-success btn-xs', 'label' => 'Keterangan'],
                                                                    ]);
                                                                    echo nl2br($item->penjelasan);
                                                                    Modal::end(); ?>
                                                                </div>
                                                            </div>

                                                            <?php $bobot = $item->idBobotFK;
                                                            $namaBobotArray = explode('/', $bobot->nama_bobot);
                                                            $nilaiBobotArray = explode('/', $bobot->nilai_bobot);
                                                            $jawabanArray = array_combine(array_values($namaBobotArray), array_values($namaBobotArray)); ?>

                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <?= $form->field($lkeDetail, '['.$i.']jawaban')->radioList(
                                                                            $jawabanArray,
                                                                            [
                                                                                'itemOptions' => ['disabled' => in_array(Yii::$app->user->identity->id_level_FK, ['1'])],
                                                                                'separator' => '<br/>',
                                                                            ]
                                                                        ); ?>
                                                                        <?php if (in_array(Yii::$app->user->identity->id_level_FK, ['1'])) {
                                                                            echo $form->field($lkeDetail, '['.$i.']jawaban')->hiddenInput(['value' => $modelDetails[$i]->jawaban])->label(false);
                                                                        } ?>
                                                                    </div>
                                                                    <div align="right" class="col-md-4">
                                                                        <label>Nilai</label><br />
                                                                        <?php foreach ($nilaiBobotArray as $nilaiBobot) {
                                                                            echo '<label>'.$nilaiBobot.'</label>'.'<br />';
                                                                        } ?>
                                                                    </div>
                                                                    <div align="right" class="col-md-4">
                                                                        <label>Persentase</label><br />
                                                                        <?php foreach ($nilaiBobotArray as $nilaiBobot) {
                                                                            echo '<label>'.($nilaiBobot * 100).'</label>'.'<br />';
                                                                        } ?>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <?php Modal::begin([
                                                                        'header' => 'Keterangan Dokumen',
                                                                        'size' => 'modal-md',
                                                                        'toggleButton' => ['class' => 'btn btn-success btn-xs', 'label' => 'Keterangan Dokumen'],
                                                                    ]);
                                                                    echo nl2br($item->keterangan_dokumen);
                                                                    Modal::end(); ?>
                                                                </div>
                                                                <div class="col-md-11">
                                                                    <?= $form->field($lkeDetail, '['.$i.']keterangan')->widget(Tinymce::className(), [
                                                                        'pluginOptions' => [
                                                                            'image_advtab' => true, 'menubar' => false,
                                                                            'plugins' => 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern responsivefilemanager',
                                                                            'toolbar' => 'formatselect bold italic underline bullist numlist -quote alignleft aligncenter alignright alignjustify link unlink -more | strikethrough hr forecolor -pasteastext removeformat charmap outdent indent undo redo responsivefilemanager image media fullscreen',
                                                                        ],
                                                                        'fileManagerOptions' => [
                                                                            'configPath' => [
                                                                                'base_url' => Url::base(),
                                                                                'current_path' => '../../../uploads/filemanager/source/user/'.Yii::$app->user->id.'/',
                                                                                'thumbs_base_path' => '../../../uploads/filemanager/thumbs/user/'.Yii::$app->user->id.'/',
                                                                                'upload_dir' => '/uploads/filemanager/source/user/'.Yii::$app->user->id.'/',
                                                                            ],
                                                                        ],
                                                                    ]) ?>
                                                                </div>
                                                            </div>

                                                            <?php endif; ?>

                                                            <?php $i++; ?>
                                                        </li>
                                                    <?php endforeach; ?>

                                                </ol>
                                            </li>
                                        <?php endforeach;?>

                                    </ol>
                                </li>
                            <?php endforeach; ?>

                        </ol>
                    </div>
                </div>
            <?php endforeach; ?>

            <?php foreach((array) $babHasil as $bab) : ?>
                <div class="row">
                    <div class="col-md-12">
                        <h3>
                            <b><?= $bab->nama_bab; ?></b>
                        </h3>

                        <ol type="I">
                            <?php $kriterias = $bab->kriterias; ?>
                            <?php foreach((array) $kriterias as $kriteria) : ?>
                                <li>
                                    <h4><?= $kriteria->nama_kriteria; ?></h4>
                                    <?php $subKriterias = $kriteria->subkriterias; ?>
                                    <!-- <ol> -->

                                        <?php foreach((array) $subKriterias as $subKriteria) : ?>
                                            <!-- <li>
                                                <h5><?php // echo $subKriteria->nama_sub; ?></h5> -->
                                                <?php $items = $subKriteria->items; ?>
                                                <ol>

                                                    <?php foreach((array) $items as $item) : ?>
                                                        <li>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_bab_FK')->hiddenInput(['value' => $bab->id_bab])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_kriteria_FK')->hiddenInput(['value' => $kriteria->id_kriteria])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_subkriteria_FK')->hiddenInput(['value' => $subKriteria->id_subkriteria])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_item_FK')->hiddenInput(['value' => $item->id_item])->label(false); ?>
                                                            <?= $form->field($lkeDetail, '['.$i.']id_bobot_FK')->hiddenInput(['value' => $item->idBobotFK->id_bobot])->label(false); ?>

                                                            <h6><?= $item->penilaian; ?></h6>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <?php Modal::begin([
                                                                        'header' => 'Keterangan',
                                                                        'size' => 'modal-md',
                                                                        'toggleButton' => ['class' => 'btn btn-success btn-xs', 'label' => 'Keterangan'],
                                                                    ]);
                                                                    echo nl2br($item->penjelasan);
                                                                    Modal::end(); ?>
                                                                </div>
                                                            </div>

                                                            <?php $bobot = $item->idBobotFK; ?>

                                                            <div class="row">
                                                                <div class="col-md-11">
                                                                    <div class="col-md-4">
                                                                        <?= $form->field($lkeDetail, '['.$i.']jawaban')->widget(TouchSpin::classname(), [
                                                                            'pluginOptions' => [
                                                                                'decimals' => 2,
                                                                                'initval' => 0,
                                                                                'max' => $bobot->nama_bobot,
                                                                                'min' => 0,
                                                                                'step' => 0.1,
                                                                                'verticalbuttons' => true,
                                                                            ]
                                                                        ]); ?>
                                                                        <?php if (in_array(Yii::$app->user->identity->id_level_FK, ['1'])) {
                                                                            echo $form->field($lkeDetail, '['.$i.']jawaban')->hiddenInput(['value' => $modelDetails[$i]->jawaban])->label(false);
                                                                        } ?>
                                                                    </div>
                                                                    <div align="right" class="col-md-4">
                                                                        <label>Nilai</label><br />
                                                                        <label>0</label><br />
                                                                        <label><?= ($bobot->nama_bobot); ?></label><br />
                                                                    </div>
                                                                    <div align="right" class="col-md-4">
                                                                        <label>Persentase</label><br />
                                                                        <label>0</label><br />
                                                                        <label><?= ($bobot->nilai_bobot * 100); ?></label><br />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <?php Modal::begin([
                                                                        'header' => 'Keterangan Dokumen',
                                                                        'size' => 'modal-md',
                                                                        'toggleButton' => ['class' => 'btn btn-success btn-xs', 'label' => 'Keterangan Dokumen'],
                                                                    ]);
                                                                    echo nl2br($item->keterangan_dokumen);
                                                                    Modal::end(); ?>
                                                                </div>
                                                                <div class="col-md-11">
                                                                    <?= $form->field($lkeDetail, '['.$i.']keterangan')->widget(\xvs32x\tinymce\Tinymce::className(), [
                                                                        'pluginOptions' => [
                                                                            'image_advtab' => true, 'menubar' => false,
                                                                            'plugins' => 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern responsivefilemanager',
                                                                            'toolbar' => 'formatselect bold italic underline bullist numlist -quote alignleft aligncenter alignright alignjustify link unlink -more | strikethrough hr forecolor -pasteastext removeformat charmap outdent indent undo redo responsivefilemanager image media fullscreen',
                                                                        ],
                                                                        'fileManagerOptions' => [
                                                                            'configPath' => [
                                                                                'base_url' => Url::base(),
                                                                                'current_path' => '../../../uploads/filemanager/source/user/'.Yii::$app->user->id.'/',
                                                                                'thumbs_base_path' => '../../../uploads/filemanager/thumbs/user/'.Yii::$app->user->id.'/',
                                                                                'upload_dir' => '/uploads/filemanager/source/user/'.Yii::$app->user->id.'/',
                                                                            ],
                                                                        ],
                                                                    ]) ?>
                                                                </div>
                                                            </div>

                                                           
                                                                
                                                               
                                                                </div>
                                                            <?php endif; ?>

                                                            <?php $i++; ?>
                                                        </li>
                                                    <?php endforeach; ?>

                                                </ol>
                                            </li>
                                        <?php endforeach;?>

                                    <!-- </ol> -->
                                </li>
                            <?php endforeach; ?>

                        </ol>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <?php if ($model->isNewRecord) {
            $model->created_by = Yii::$app->user->identity->id_user;
        } ?>
        <?= $form->field($model, 'created_by')->hiddenInput()->label(false); ?>

        <?php if (in_array(Yii::$app->user->identity->id_level_FK, ['1'])) : ?>
            <div class="box-body with-border">
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($model, 'kelengkapan')->widget(Select2::classname(), [
                            'data' => [
                                'Belum Lengkap' => 'Belum Lengkap',
                                'Sudah Lengkap' => 'Sudah Lengkap',
                            ],
                        ]); ?>
                    </div>
                </div>
            </div>
        <?php endif; ?>

        <div align="center" class="box-body with-border">
            <div class="form-group">
                <?= Html::submitButton($model->isNewRecord ? 'Buat' : 'Perbaru', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
            </div>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>
