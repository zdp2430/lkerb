<?php

namespace backend\controllers;

use Yii;
use common\models\Lke;
//use backend\models\LkeSearch;
// use backend\models\DashboardSearch;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DashboardController implements the CRUD actions for Lke model.
 */
class DashboardController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['*'],
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['create', 'delete', 'index', 'update', 'view'],
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
        // $searchModel = new DashboardSearch();
        $lke = new Lke();
        $searchModel = new LkeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        $lkeTotalPengumpulan = Lke::find()->count();
        $lkeTotalSudahMengumpulkan = Lke::find()->where(['pengumpulan' => 'Sudah Mengumpulkan'])->count();
        $lkeTotalBelumMengumpulkan = Lke::find()->where(['pengumpulan' => 'Belum Mengumpulkan'])->count();

        $lkeTotalKelengkapan = Lke::find()->count();
        $lkeTotalSudahLengkap = Lke::find()->where(['kelengkapan' => 'Sudah Lengkap'])->count();
        $lkeTotalBelumLengkap = Lke::find()->where(['kelengkapan' => 'Belum Lengkap'])->count();

        return $this->render('index', [
            'lke' => $lke,
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
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Lke model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Lke();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_lke]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Lke model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_lke]);
        } else {
            return $this->render('update', [
                'model' => $model,
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
}
