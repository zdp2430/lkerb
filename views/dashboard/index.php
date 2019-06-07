<?php
use common\models\Daerah;
use common\models\Lke;
use common\models\Satker;
use common\models\Settings;
use dosamigos\highcharts\HighCharts;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\DashboardSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Beranda';
?>

<div class="lke-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6" style="text-align:center">
            <div class="small-box bg-red"> 
                <h3>
                <?= 'Deadline : '.\russ666\widgets\Countdown::widget([
                    'datetime' => date('Y-m-d H:i:s O', strtotime((new Settings)->tanggalDeadline()) + 1000),
                    'format' => '%D hari %H:%M:%S',
                    'events' => [
                        // 'finish' => 'function(){location.reload()}',
                    ],
                ]); ?>
                </h3>
            </div>
        </div>        
    </div>   
    <div class="row col-12">
        <div class="col-md-4">
            <!-- small box -->
                <div class="inner">
                    <h4>Pengumpulan</h4>
                    <div class="chart responsive">
                        <?= HighCharts::widget([
                            'clientOptions' => [
                                'chart' => [
                                    'plotBackgroundColor' => null,
                                    'plotBorderWidth' => null,
                                    'plotShadow' => false,
                                    'type' => 'pie',
                                ],
                                'title' => [
                                    'text' => ''
                                ],
                                'tooltip' => [
                                    'pointFormat' => '<b>{point.percentage:.1f}%</b>'
                                ],
                                'plotOptions' => [
                                    'pie' => [
                                        'allowPointSelect' => true,
                                        'cursor' => 'pointer',
                                        'dataLabels' => [
                                            'enabled' => false
                                        ],
                                        'showInLegend' => true
                                    ]
                                ],
                                'series' => [
                                    [
                                        'name' => 'Pengumpulan',
                                        'colorByPoint' => true,
                                        'data' => [
                                            [
                                                'name' => 'Belum Mengumpulkan',
                                                'y' => 547,
                                            ],
                                            [
                                                'name' => 'Sudah Mengumpulkan',
                                                'y' => (int) Lke::find()->where(['pengumpulan' => 'Sudah Mengumpulkan'])->count(),
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]); ?>
                    </div>
                </div>
        </div>
        <!-- ./col -->
        <div class="col-md-4">
            <!-- small box -->
                <div class="inner">
                    <h4>Kelengkapan</h4>
                    <div class="chart responsive">
                        <?= HighCharts::widget([
                            'clientOptions' => [
                                'chart' => [
                                    'plotBackgroundColor' => null,
                                    'plotBorderWidth' => null,
                                    'plotShadow' => false,
                                    'type' => 'pie'
                                ],
                                'title' => [
                                    'text' => ''
                                ],
                                'tooltip' => [
                                    'pointFormat' => '<b>{point.percentage:.1f}%</b>'
                                ],
                                'plotOptions' => [
                                    'pie' => [
                                        'allowPointSelect' => true,
                                        'cursor' => 'pointer',
                                        'dataLabels' => [
                                            'enabled' => false
                                        ],
                                        'showInLegend' => true
                                    ]
                                ],
                                'series' => [
                                    [
                                        'name' => 'Kelengkapan',
                                        'colorByPoint' => true,
                                        'data' => [
                                            [
                                                'name' => 'Belum Lengkap',
                                                'y' => (int) Lke::find()->where(['kelengkapan' => 'Belum Lengkap'])->count(),
                                            ],
                                            [
                                                'name' => 'Sudah Lengkap',
                                                'y' => (int) Lke::find()->where(['kelengkapan' => 'Sudah Lengkap'])->count(),
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]); ?>
                    </div>
                </div>
        </div>
        <!-- ./col -->
        <div class="col-md-4">
            <!-- small box -->
                <div class="inner">
                    <h4>Relevansi</h4>
                    <div class="chart responsive">
                        <?= HighCharts::widget([
                            'clientOptions' => [
                                'chart' => [
                                    'plotBackgroundColor' => null,
                                    'plotBorderWidth' => null,
                                    'plotShadow' => false,
                                    'type' => 'pie'
                                ],
                                'title' => [
                                    'text' => ''
                                ],
                                'tooltip' => [
                                    'pointFormat' => '<b>{point.percentage:.1f}%</b>'
                                ],
                                'plotOptions' => [
                                    'pie' => [
                                        'allowPointSelect' => true,
                                        'cursor' => 'pointer',
                                        'dataLabels' => [
                                            'enabled' => false
                                        ],
                                        'showInLegend' => true
                                    ]
                                ],
                                'series' => [
                                    [
                                        'name' => 'Relevansi',
                                        'colorByPoint' => true,
                                        'data' => [
                                            [
                                                'name' => 'Kurang Relevan',
                                                'y' => (int) Lke::find()->where(['relevansi' => 'Kurang Relevan'])->count(),
                                            ],
                                            [
                                                'name' => 'Tidak Relevan',
                                                'y' => (int) Lke::find()->where(['relevansi' => 'Tidak Relevan'])->count(),
                                            ],
                                            [
                                                'name' => 'Relevan',
                                                'y' => (int) Lke::find()->where(['relevansi' => 'Relevan'])->count(),
                                            ],
                                        ]
                                    ]
                                ]
                            ]
                        ]); ?>
                    </div>
                </div>
        </div>
        <!-- ./col -->
    </div>

    <br>

    <p>
        <?php if (in_array(Yii::$app->user->identity->id_level_FK, ['4'])) : ?>
            <?= Html::a('Buat Beranda', ['create'], ['class' => 'btn btn-success']) ?>
        <?php endif; ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id_lke',
            [
                'attribute'=>'id_satker_FK',
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'id_satker_FK',
                    ArrayHelper::map(
                        Satker::find()->asArray()->all(), 'id_satker', 'nama_satker'
                    ),
                    ['class' => 'form-control', 'prompt' => '- Pilih Satker -']
                ),
                'value'=>'idSatkerFK.nama_satker'
            ],
            [
                'attribute'=>'id_provinsi_FK',
                'filter' => Select2::widget([
                    'model' => $searchModel,
                    'attribute' => 'id_provinsi_FK',
                    'data' => ArrayHelper::map(
                        Daerah::find()->asArray()->all(), 'id_daerah', 'nama_daerah'
                    ),
                    'options' => ['class' => 'form-control', 'placeholder' => '- Pilih Daerah -'],
                    'pluginOptions' => ['allowClear' => true],
                ]),
                'value' => function ($model) {
                    $provinsi = '';

                    if ($model->idProvinsiFK) {
                        $provinsi .= $model->idProvinsiFK->nama_daerah;
                    }
                    if ($model->idDaerahFK) {
                        $provinsi .= ' - '.$model->idDaerahFK->nama_daerah;
                    }

                    return $provinsi;
                },
            ],
            // 'id_daerah_FK',
            // 'tahun',
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
            ],
            [
                'attribute' => 'relevansi',
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'relevansi',
                    [
                        'Tidak Relevan' => 'Tidak Relevan',
                        'Kurang Relevan' => 'Kurang Relevan',
                        'Relevan' => 'Relevan',
                    ],
                    ['class' => 'form-control', 'prompt' => '- Pilih Relevansi -']
                ),
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'buttons' => [
                    // 'custom_button' => function ($url, $model, $key) {
                    //     return $model->status === 'editable' ? Html::a('Update', $url) : '';
                    // },
                ],
                'visibleButtons' => [
                    'update' => (in_array(Yii::$app->user->identity->id_level_FK, ['4','3'])),
                ],
                'template' => '{view}{update}'
            ],
        ],
    ]); ?>

</div>
