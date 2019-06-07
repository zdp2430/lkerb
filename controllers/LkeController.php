<?php

namespace app\controllers;

use Yii;
use app\models\Lke;
use app\models\LkeSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\AccessControl, yii\filters\VerbFilter;
use yii\helpers\FileHelper;
use kartik\mpdf\Pdf;
use yii\base\Model;
use models\LkeDetail;
use models\Pilarr;
use models\Subkriteria;
use models\LkeCompareForm;
use models\Bab;
use models\Bobot;
use models\Kriteria;

/**
 * LkeController implements the CRUD actions for Lke model.
 */
class LkeController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['*'],
                'rules' => [
                    [
                        'actions' => ['create'],
                        'allow' => true,
                        'matchCallback' => function ($rule, $action) {
                            if ( ! Yii::$app->user->isGuest && in_array(Yii::$app->user->identity->id_level_FK, ['1', '2'])) {
                                return true;
                            }
                            return false;
                        },
                    ],
                    [
                        'actions' => ['delete'],
                        'allow' => true,
                        'matchCallback' => function ($rule, $action) {
                            if ( ! Yii::$app->user->isGuest && in_array(Yii::$app->user->identity->id_level_FK, ['1'])) {
                                return true;
                            }
                            return false;
                        },
                    ],
                    [
                        'actions' => ['update'],
                        'allow' => true,
                        'matchCallback' => function ($rule, $action) {
                            $model = new Lke;
                            $updateVisible = true;
                            $updateVisible = $updateVisible && (! Yii::$app->user->isGuest);

                            if (in_array(Yii::$app->user->identity->id_level_FK, ['2']) && $model->isDeadline()) {
                                $updateVisible = false;
                            }

                            return $updateVisible;
                        },
                    ],
                    [
                        'allow' => true,
                        'actions' => ['index', 'compare', 'compare-detail', 'export-pdf', 'update', 'view'],
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Lke models.
     * @return mixed
     */
    public function actionIndex()
    {
        (new \common\components\ResponsiveFilemanager)->createDirectory();

        $searchModel = new LkeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Lke model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $babHasil = Bab::find()->where(['nama_bab' => 'HASIL'])->all();
        $babProses = Bab::find()->where(['nama_bab' => 'PROSES'])->all();
        $model = $this->findModel($id);
        $modelDetails = LkeDetail::find()->where(['id_lke_FK' => $id])->all();

        return $this->render('view', [
            'babHasil' => $babHasil,
            'babProses' => $babProses,
            'model' => $model,
            'modelDetails' => $modelDetails,
        ]);
    }

    /**
     * Creates a new Lke model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $babHasil = Bab::find()->where(['nama_bab' => 'HASIL'])->all();
        $babProses = Bab::find()->where(['nama_bab' => 'PROSES'])->all();
        $kriterias = Kriteria::find()->all();
        $lkeDetail = new LkeDetail();
        $model = new Lke();
        $modelDetails = new LkeDetail();
        $ProsesPoinArray = $HasilPoinArray = $PoinArray = [];

        if ($model->load(Yii::$app->request->post())) {
            $modelDetails = [];
            $formDetails = Yii::$app->request->post('LkeDetail', []);
            foreach ($formDetails as $i => $formDetail) {
                $modelDetail = new LkeDetail();
                $modelDetail->id_lke_FK = '0';
                $modelDetail->setAttributes($formDetail);

                $bobot = Bobot::findOne($formDetail['id_bobot_FK']);
                // sa_jawaban
                if (is_numeric($bobot->nama_bobot) === true) { // numeric
                    $HasilPoinArray[$modelDetail->id_subkriteria_FK][] = $formDetail['jawaban'] / $bobot->nama_bobot;
                    $PoinArray[$modelDetail->id_subkriteria_FK][] = $formDetail['jawaban'] / $bobot->nama_bobot;
                    $modelDetail->nilai = $formDetail['jawaban'] / $bobot->nama_bobot;
                    $modelDetail->persentase = $formDetail['jawaban'] / $bobot->nama_bobot * 100;
                } else { // non numeric
                    $namaBobotArray = explode('/', $bobot->nama_bobot);
                    $nilaiBobotArray = explode('/', $bobot->nilai_bobot);

                    $Index = array_search($formDetail['jawaban'], $namaBobotArray);
                    $ProsesPoinArray[$modelDetail->id_subkriteria_FK][] = $nilaiBobotArray[$Index];
                    $PoinArray[$modelDetail->id_subkriteria_FK][] = $nilaiBobotArray[$Index];
                    $modelDetail->nilai = $nilaiBobotArray[$Index];
                    $modelDetail->persentase = $nilaiBobotArray[$Index] * 100;
                }

                
                $modelDetails[] = $modelDetail;
            }
            $model->proses_poin = $this->sumNilai($ProsesPoinArray);
            $model->hasil_poin = $this->sumNilai($HasilPoinArray);
            $model->poin = $this->sumNilai($PoinArray);
            
            if ($model->validate() && Model::validateMultiple($modelDetails)) {
                $pilar = Pilar::findOne($model->id_pilar_FK);

                $model->save(); // save Lke
                $id_lke = $model->id_lke;

                foreach($modelDetails as $i => $modelDetail) {
                    $modelDetail->id_lke_FK = $id_lke;
                    $modelDetail->save(); // save LkeDetail
                }
                // return $this->redirect(['view', 'id' => $model->id_lke]);
                return $this->redirect(['index']);
            }
        } else {
            return $this->render('create', [
                'babHasil' => $babHasil,
                'babProses' => $babProses,
                'kriterias' => $kriterias,
                'lkeDetail' => $lkeDetail,
                'model' => $model,
            ]);
        }
    }

    public function actionCompare()
    {
        $model = new LkeCompareForm();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            return $this->redirect(['compare-detail', 'id' => $model->id_lke, 'id2' => $model->id_lke_2]);
        }

        return $this->render('compare', [
            'model' => $model,
        ]);
    }

    public function actionCompareDetail($id, $id2)
    {
        $babHasil = Bab::find()->where(['nama_bab' => 'HASIL'])->all();
        $babProses = Bab::find()->where(['nama_bab' => 'PROSES'])->all();
        $model = $this->findModel($id);
        $model2 = $this->findModel($id2);
        $modelDetails = LkeDetail::find()->where(['id_lke_FK' => $id])->all();
        $modelDetails2 = LkeDetail::find()->where(['id_lke_FK' => $id2])->all();

        return $this->render('compare_detail', [
            'babHasil' => $babHasil,
            'babProses' => $babProses,
            'model' => $model,
            'model2' => $model2,
            'modelDetails' => $modelDetails,
            'modelDetails2' => $modelDetails2,
        ]);
    }

    public function actionExportPdf($id)
    {
        $babHasil = Bab::find()->where(['nama_bab' => 'HASIL'])->all();
        $babProses = Bab::find()->where(['nama_bab' => 'PROSES'])->all();
        $model = $this->findModel($id);
        $modelDetails = LkeDetail::find()->where(['id_lke_FK' => $id])->all();

        $content = $this->renderPartial('_export_pdf', [
            'babHasil' => $babHasil,
            'babProses' => $babProses,
            'model' => $model,
            'modelDetails' => $modelDetails,
        ]);

        // setup kartik\mpdf\Pdf component
        $pdf = new Pdf([
            // set to use core fonts only
            'mode' => Pdf::MODE_CORE,
            // A4 paper format
            'format' => Pdf::FORMAT_A4,
            // portrait orientation
            'orientation' => Pdf::ORIENT_PORTRAIT,
            // stream to browser inline
            'destination' => Pdf::DEST_BROWSER,
            // your html content input
            'content' => $content,
            // format content from your own css file if needed or use the
            // enhanced bootstrap css built by Krajee for mPDF formatting
            'cssFile' => '@vendor/kartik-v/yii2-mpdf/assets/kv-mpdf-bootstrap.min.css',
            // any css to be embedded if required
            'cssInline' => '.kv-heading-1{font-size:18px}',
            // set mPDF properties on the fly
            'options' => ['title' => 'Export Pdf Lke'],
            // call mPDF methods on the fly
            'methods' => [
                'SetHeader' => ['LEMBAR KERJA EVALUASI MENUJU WBK/WBBM'],
                'SetFooter' => ['{PAGENO}'],
            ]
        ]);

        // return the pdf output as per the destination setting
        return $pdf->render();
    }

    /**
     * Updates an existing Lke model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $babHasil = Bab::find()->where(['nama_bab' => 'HASIL'])->all();
        $babProses = Bab::find()->where(['nama_bab' => 'PROSES'])->all();
        $kriterias = Kriteria::find()->all();
        $lkeDetail = new LkeDetail();
        $model = $this->findModel($id);
        $modelDetails = LkeDetail::find()->where(['id_lke_FK' => $id])->all();
        $ProsesPoinArray = $HasilPoinArray = $PoinArray = [];

        if ($model->load(Yii::$app->request->post())) {
            $modelDetails = [];
            $formDetails = Yii::$app->request->post('LkeDetail', []);
            foreach ($formDetails as $i => $formDetail) {
                $modelDetail = LkeDetail::findOne($formDetail['id_lke_detail']);
                $modelDetail->id_lke_FK = $id;
                $modelDetail->setAttributes($formDetail);

                $bobot = Bobot::findOne($formDetail['id_bobot_FK']);
                if (is_numeric($bobot->nama_bobot) === true) { // numeric
                    $HasilPoinArray[$modelDetail->id_subkriteria_FK][] = $formDetail['sa_jawaban'] / $bobot->nama_bobot;
                    $PoinArray[$modelDetail->id_subkriteria_FK][] = $formDetail['sa_jawaban'] / $bobot->nama_bobot;
                    if (in_array(Yii::$app->user->identity->id_level_FK, ['1', '2', '4'])) {
                        $modelDetail->nilai = $formDetail['jawaban'] / $bobot->nama_bobot;
                        $modelDetail->persentase = $formDetail['jawaban'] / $bobot->nama_bobot * 100;
                    }
                } else { // non numeric
                    $namaBobotArray = explode('/', $bobot->nama_bobot);
                    $nilaiBobotArray = explode('/', $bobot->nilai_bobot);

                    $Index = array_search($formDetail['jawaban'], $namaBobotArray);
                    $ProsesPoinArray[$modelDetail->id_subkriteria_FK][] = $nilaiBobotArray[$Index];
                    $PoinArray[$modelDetail->id_subkriteria_FK][] = $nilaiBobotArray[$Index];
                    if (in_array(Yii::$app->user->identity->id_level_FK, ['1', '2'])) {
                        $modelDetail->nilai = $nilaiBobotArray[$Index];
                        $modelDetail->persentase = $nilaiBobotArray[$Index] * 100;
                    }
                }

                

                $modelDetails[] = $modelDetail;
            }
            $model->proses_poin = $this->sumNilai($ProsesPoinArray);
            $model->hasil_poin = $this->sumNilai($HasilPoinArray);
            $model->poin = $this->sumNilai($PoinArray);

            
            if ($model->validate() && Model::validateMultiple($modelDetails)) {
                $pilar = Pilar::findOne($model->id_pilar_FK);

                $model->save(); // save Lke
                $id_lke = $model->id_lke;

                foreach($modelDetails as $i => $modelDetail) {
                    $modelDetail->id_lke_FK = $id_lke;
                    $modelDetail->save(); // save LkeDetail
                }
                // return $this->redirect(['view', 'id' => $model->id_lke]);
       	 		return $this->redirect(['index']);
       	 	}
        } else {
            return $this->render('update', [
                'babHasil' => $babHasil,
                'babProses' => $babProses,
                'kriterias' => $kriterias,
                'lkeDetail' => $lkeDetail,
                'model' => $model,
                'modelDetails' => $modelDetails,
            ]);
        }
    }

    /**
     * Deletes an existing Lke model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        LkeDetail::deleteAll(['id_lke_FK' => $id]);
        FileHelper::removeDirectory((new LkeDetail)->path.'/'.$id);
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Lke model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Lke the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Lke::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function sumNilai($nilaiArray = [])
    {
        $nilai = 0;

        if (count($nilaiArray) > 0) {
            foreach ($nilaiArray as $id_subkriteria => $subkriteria) {
                $subkriteriaModel = Subkriteria::findOne($id_subkriteria);

                foreach ($subkriteria as $item => $nilaiItem) {
                    if (isset($nilaiArray[$id_subkriteria]['count']) == false) {
                        $nilaiArray[$id_subkriteria]['count'] = 1;
                        $nilaiArray[$id_subkriteria]['poin'] = $subkriteriaModel->poin;
                        $nilaiArray[$id_subkriteria]['total'] = $nilaiItem;
                    } else {
                        $nilaiArray[$id_subkriteria]['count'] ++;
                        $nilaiArray[$id_subkriteria]['poin'] = $subkriteriaModel->poin;
                        $nilaiArray[$id_subkriteria]['total'] += $nilaiItem;
                    }
                }

                if (isset($nilaiArray['total']) == false) {
                    $total = round($nilaiArray[$id_subkriteria]['total'] / $nilaiArray[$id_subkriteria]['count'], Yii::$app->params['roundPrecision']);
                    $total = round($total * $subkriteriaModel->poin, Yii::$app->params['roundPrecision']);
                    $nilaiArray['total'] = $total;
                } else {
                    $total = round($nilaiArray[$id_subkriteria]['total'] / $nilaiArray[$id_subkriteria]['count'], Yii::$app->params['roundPrecision']);
                    $total = round($total * $subkriteriaModel->poin, Yii::$app->params['roundPrecision']);
                    $nilaiArray['total'] += $total;
                }
            }
            $nilai = $nilaiArray['total'];
        }

        return $nilai;
    }
}
