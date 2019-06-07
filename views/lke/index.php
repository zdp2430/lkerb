<?php

use models\Lke;
use models\Pilar;
use models\Users;
use kartik\daterange\DateRangePicker;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\LkeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Lkes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lke-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="table-responsive">
        <?php $created_by_distinct = Lke::find()->select('created_by')->distinct()->asArray()->column(); ?>
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],

                // 'id_lke',
                // 'created_by',
                [
                    'attribute' => 'user_nama',
                    'filter' => Select2::widget([
                        'model' => $searchModel,
                        'attribute' => 'user_nama',
                        'data' => ArrayHelper::map(
                            Users::find()->where(['IN', 'id_user', $created_by_distinct])->asArray()->all(), 'id_user', 'nama'
                        ),
                        'options' => ['class' => 'form-control', 'placeholder' => '- '.$searchModel->getAttributeLabel('Nama Pembuat').' -'],
                        'pluginOptions' => ['allowClear' => true],
                    ]),
                    'value' => 'createdBy.nama',
                ],
                // 'created_date',
                [
                    'attribute' => 'created_date',
                    'filter' => DateRangePicker::widget([
                        'attribute' => 'created_date_range',
                        'convertFormat' => true,
                        'model' => $searchModel,
                        'pluginOptions' => [
                            'alwaysShowCalendars' => true,
                            'locale' => ['format' => 'd-m-Y'],
                        ],
                        'presetDropdown' => true,
                    ]),
                    'format' => ['datetime'],
                ],
                [
                    'attribute'=>'id_pilar_FK',
                    'filter' => Select2::widget([
                        'model' => $searchModel,
                        'attribute' => 'id_pilar_FK',
                        'data' => ArrayHelper::map(
                            Satker::find()->all(), 'id_pilar', 'nama_pilar'
                        ),
                        'options' => ['class' => 'form-control', 'placeholder' => '- Pilih Pilar -'],
                        'pluginOptions' => ['allowClear' => true],
                    ]),
                    'value' => 'idSatkerFK.nama_pilar'
                ],
                // 'sa_proses_poin',
                // 'sa_hasil_poin',
                //'sa_poin',
                // 'fr_proses_poin',
                // 'fr_hasil_poin',
                //'fr_poin',
                // 'tahun',
                // 'created_date',
                'poin',
                [
                    'attribute' => 'pengumpulan',
                    'filter' => Html::activeDropDownList(
                        $searchModel,
                        'pengumpulan',
                        [
                            'Belum Mengumpulkan' => 'Belum Mengumpulkan',
                            'Sudah Mengumpulkan' => 'Sudah Mengumpulkan',
                        ],
                        ['class' => 'form-control', 'prompt' => '- Pilih Pengumpulan -']
                    ),
                    'visible' => (in_array(Yii::$app->user->identity->id_level_FK, ['1'])),
                ],
                [
                    'attribute' => 'kelengkapan',
                    'filter' => Html::activeDropDownList(
                        $searchModel,
                        'kelengkapan',
                        [
                            'Belum Lengkap' => 'Belum Lengkap',
                            'Sudah Lengkap' => 'Sudah Lengkap',
                        ],
                        ['class' => 'form-control', 'prompt' => '- Pilih Kelengkapan -']
                    ),
                    'visible' => (in_array(Yii::$app->user->identity->id_level_FK, ['1'])),
                ],
                [
                    'class' => 'yii\grid\ActionColumn',
                    'buttons' => [
                        // 'custom_button' => function ($url, $model, $key) {
                        //     return $model->status === 'editable' ? Html::a('Update', $url) : '';
                        // },
                    ],
                    'visibleButtons' => [
                        'delete' => (in_array(Yii::$app->user->identity->id_level_FK, ['1'])),
                        'update' => function ($model, $key, $index) {
                            $visible = true;

                            if (in_array(Yii::$app->user->identity->id_level_FK, ['2']) && $model->isDeadline()) {
                                $visible = false;
                            }

                            return $visible;
                        },
                    ],
                    'template' => '{view}{update}{delete}'
                ],
            ],
        ]); ?>
    </div>
</div>
