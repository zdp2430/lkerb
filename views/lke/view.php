<?php

use yii\helpers\Html;
use models\LkeDetail;
use yii\helpers\Url;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Lke */

$this->title = $model->id_lke;
$this->params['breadcrumbs'][] = ['label' => 'Lkes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="lke-view">

<p>
        <?php $updateVisible = true;
        if (in_array(Yii::$app->user->identity->id_level_FK, ['2']) && $model->isDeadline()) {
            $updateVisible = false;
        }

        if ($updateVisible === true) {
            echo Html::a('Update', ['update', 'id' => $model->id_lke], ['class' => 'btn btn-primary', 'visible' => $updateVisible]);
        } ?>

        <?php if (in_array(Yii::$app->user->identity->id_level_FK, ['1'])) : ?>
            <?= Html::a('Delete', ['delete', 'id' => $model->id_lke], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => 'Are you sure you want to delete this item?',
                    'method' => 'post',
                ],
            ]) ?>
        <?php endif; ?>

        <?= Html::a('Export PDF', ['export-pdf', 'id' => $model->id_lke], ['class' => 'btn btn-success', 'target' => '_blank']); ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_lke',
            'id_pilar_FK',
            'proses_poin',
            'hasil_poin',
            'tahun',
            'created_by',
            'created_date',
            'pengumpulan',
            'kelengkapan',
        ],
    ]) ?>

<div class="box box-default">
        <div class="box-header with-border">
            <div class="row">
                <div class="col-md-12" style="text-align:center">
                    <label><h2><b>LEMBAR KERJA EVALUASI REFORMASI BIROKRASI</b></h2></label>
                </div>
            </div>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr class="bg-light-blue">
                    <th>Nilai</th>
                </tr>
            </thead>
            <tbody>
                <?php $alphas = range('A', 'Z'); ?>
                <?php $a = $i = $jumlahNilai = $jumlahNilai = 0; ?>
                <?php $totalSubkriteriaNilai = $totalSubkriteriaNilai = 0; ?>

                <?php foreach($babProses as $bab) : ?>
                    <?php $totalBabNilai = $totalBabNilai = 0;
                    foreach ($bab->kriterias as $kriteria) :
                        foreach($kriteria->subkriterias as $subKriteria) :
                            $totalSubkriteriaNilai = LkeDetail::find()->where(['id_lke_FK' => $model->id_lke, 'id_bab_FK' => $bab->id_bab, 'id_kriteria_FK' => $kriteria->id_kriteria, 'id_subkriteria_FK' => $subKriteria->id_subkriteria])->average('nilai');
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai, Yii::$app->params['roundPrecision']);
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai * $subKriteria->poin, Yii::$app->params['roundPrecision']);
                            $totalBabNilai += $totalSubkriteriaNilai;
                            $jumlahNilai += $totalSubkriteriaNilai;

                        endforeach;
                    endforeach; ?>
                    <tr class="danger">
                        <td colspan="4">
                            <?= $alphas[$a]; ?>.
                            <?= $bab->nama_bab; ?>
                        </td>
                        <td align="right"><?= Yii::$app->formatter->asDecimal($totalBabNilai); ?></td>
                    </tr>

                    <?php $b = 1; ?>
                    <?php $kriterias = $bab->kriterias; ?>
                    <?php foreach($kriterias as $kriteria) : ?>
                        <?php $totalKriteriaNilai = $totalKriteriaNilai = 0;
                        foreach($kriteria->subkriterias as $subKriteria) :
                            $totalSubkriteriaNilai = LkeDetail::find()->where(['id_lke_FK' => $model->id_lke, 'id_bab_FK' => $bab->id_bab, 'id_kriteria_FK' => $kriteria->id_kriteria, 'id_subkriteria_FK' => $subKriteria->id_subkriteria])->average('nilai');
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai, Yii::$app->params['roundPrecision']);
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai * $subKriteria->poin, Yii::$app->params['roundPrecision']);
                            $totalKriteriaNilai += $totalSubkriteriaNilai;

                            
                        endforeach; ?>
                        <tr class="info">
                            <td></td>
                            <td colspan="3">
                                <?= $b; ?>.
                                <?= $kriteria->nama_kriteria; ?>
                            </td>
                            <td align="right"><?= Yii::$app->formatter->asDecimal($totalKriteriaNilai); ?></td>

                        </tr>

                        <?php $c = 1; ?>
                        <?php $subKriterias = $kriteria->subkriterias; ?>
                        <?php foreach($subKriterias as $subKriteria) : ?>
                            <?php $totalSubkriteriaNilai = LkeDetail::find()->where(['id_lke_FK' => $model->id_lke, 'id_bab_FK' => $bab->id_bab, 'id_kriteria_FK' => $kriteria->id_kriteria, 'id_subkriteria_FK' => $subKriteria->id_subkriteria])->average('nilai');
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai, Yii::$app->params['roundPrecision']);
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai * $subKriteria->poin, Yii::$app->params['roundPrecision']);

                           
                            <tr class="warning">
                                <td></td>
                                <td></td>
                                <td colspan="2">
                                    <?= $c; ?>.
                                    <?= $subKriteria->nama_sub.' ('.$subKriteria->poin.')'; ?>
                                </td>
                                <td align="right"><?= Yii::$app->formatter->asDecimal($totalSubkriteriaNilai); ?></td>
                            </tr>

                            <?php $d = 0; ?>
                            <?php $items = $subKriteria->items; ?>

                            <?php foreach($items as $item) : ?>
                                <tr class="success">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <?= strtolower($alphas[$d]); ?>.
                                        <?= $item->penilaian; ?>
                                    </td>
                                    <td align="right"><?= $modelDetails[$i]->nilai; ?></td>
                                </tr>
                                <?php $d++; ?>
                                <?php $i++; ?>
                            <?php endforeach; ?>

                            <?php $c++; ?>
                        <?php endforeach; ?>

                        <?php $b++; ?>
                    <?php endforeach; ?>

                    <?php $a++; ?>
                <?php endforeach; ?>

                <?php foreach($babHasil as $bab) : ?>
                    <?php $totalBabNilai = $totalBabNilai = 0;
                    foreach ($bab->kriterias as $kriteria) :
                        foreach($kriteria->subkriterias as $subKriteria) :
                            $totalSubkriteriaNilai = LkeDetail::find()->where(['id_lke_FK' => $model->id_lke, 'id_bab_FK' => $bab->id_bab, 'id_kriteria_FK' => $kriteria->id_kriteria, 'id_subkriteria_FK' => $subKriteria->id_subkriteria])->sum('nilai');
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai, Yii::$app->params['roundPrecision']);
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai * $subKriteria->poin, Yii::$app->params['roundPrecision']);
                            $totalBabNilai += $totalSubkriteriaNilai;
                            $jumlahNilai += $totalSubkriteriaNilai;

                            
                        endforeach;
                    endforeach; ?>
                    <tr class="danger">
                        <td colspan="4">
                            <?= $alphas[$a]; ?>.
                            <?= $bab->nama_bab; ?>
                        </td>
                        <td align="right"><?= Yii::$app->formatter->asDecimal($totalBabNilai); ?></td>
                    </tr>

                    <?php $b = 1; ?>
                    <?php $kriterias = $bab->kriterias; ?>
                    <?php foreach($kriterias as $kriteria) : ?>
                        <?php $totalKriteriaNilai = $totalKriteriaNilai = 0;
                        foreach($kriteria->subkriterias as $subKriteria) :
                            $totalSubkriteriaNilai = LkeDetail::find()->where(['id_lke_FK' => $model->id_lke, 'id_bab_FK' => $bab->id_bab, 'id_kriteria_FK' => $kriteria->id_kriteria, 'id_subkriteria_FK' => $subKriteria->id_subkriteria])->average('nilai');
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai, Yii::$app->params['roundPrecision']);
                            $totalSubkriteriaNilai = round($totalSubkriteriaNilai * $subKriteria->poin, Yii::$app->params['roundPrecision']);
                            $totalKriteriaNilai += $totalSubkriteriaNilai;

                            
                        endforeach;?>
                        <tr class="info">
                            <td></td>
                            <td colspan="3">
                                <?= $b; ?>.
                                <?= $kriteria->nama_kriteria; ?>
                            </td>
                            <td align="right"><?= Yii::$app->formatter->asDecimal($totalKriteriaNilai); ?></td>
                            
                        </tr>

                        <?php $c = 1; ?>
                        <?php $subKriterias = $kriteria->subkriterias; ?>
                        <?php foreach($subKriterias as $subKriteria) : ?>

                            <?php $d = 0; ?>
                            <?php $items = $subKriteria->items; ?>
                            <?php foreach($items as $item) : ?>
                                <tr class="success">
                                    <td></td>
                                    <td></td>
                                    <td colspan="2">
                                        <?= $c; ?>.
                                        <?= $item->penilaian.' ('.$subKriteria->poin.')'; ?>
                                    </td>
                                    <td align="right"><?= ($modelDetails[$i]->sa_nilai * $subKriteria->poin); ?></td>
                                    <td align="right"><?= ($modelDetails[$i]->fr_nilai * $subKriteria->poin); ?></td>
                                </tr>
                                <?php $d++; ?>
                                <?php $i++; ?>
                            <?php endforeach; ?>

                            <?php $c++; ?>
                        <?php endforeach; ?>

                        <?php $b++; ?>
                    <?php endforeach; ?>

                    <?php $a++; ?>
                <?php endforeach; ?>

                <tr class="danger">
                    <td colspan="4">Total Hasil</td>
                    <td align="right"><?= $jumlahNilai; ?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
