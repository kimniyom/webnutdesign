<?php

namespace app\controllers;

use Yii;
use app\models\Transport;
use app\models\TransportSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * TransportController implements the CRUD actions for Transport model.
 */
class TransportController extends Controller {

    /**
     * {@inheritdoc}
     */
    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Transport models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new TransportSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $transportTag = $this->getTeansportTagnumber();
        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                    'transportTag' => $transportTag
        ]);
    }

    /**
     * Displays a single Transport model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id) {
        return $this->render('view', [
                    'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Transport model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Transport();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
                    'model' => $model,
        ]);
    }

    /**
     * Updates an existing Transport model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ref) {
        $model = $this->findModel($ref);
        /* รายละเอียดงาน */
        $modelCustomer = \app\models\Customer::findOne(['ref' => $ref]);
        $file = $this->getFile($ref);

        if ($model->load(Yii::$app->request->post())) {

            //อัพเดทที่อยู่ใหม่
            $columns = array("address" => $model->address);
            Yii::$app->db->createCommand()
                    ->update("customer", $columns, "ref = '$ref'")
                    ->execute();

            $model->status = '2';
            $model->user_id = Yii::$app->user->identity->id;
            $model->create_date = date("Y-m-d H:i:s");
            $model->save();


            $culumnstimeline = array(
                "department" => 9,
                "ref" => $model->ref,
                "user_id" => Yii::$app->user->identity->id,
                "log" => "ลงบันทึกเลขจัดส่ง",
                "todep" => "จัดส่ง(รับเข้าระบบ)",
                "d_update" => date("Y-m-d H:i:s")
            );
            \Yii::$app->db->createCommand()
                    ->insert("timeline", $culumnstimeline)
                    ->execute();

            return $this->redirect(['index']);
        }

        return $this->render('update', [
                    'model' => $model,
                    'modelCustomer' => $modelCustomer,
                    'file' => $file
        ]);
    }

    /**
     * Deletes an existing Transport model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Transport model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Transport the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ref) {
        if (($model = Transport::findOne(['ref' => $ref])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    //ดึงงานที่ยังไม่ได้จัดส่ง
    function getWork() {
        $sql = "SELECT a.*,c.customer,c.confirm,c.tel,c.time_getjob,c.date_getjob,c.project_name
                    FROM transport a INNER JOIN customer c ON a.ref = c.ref
                    WHERE a.status = '1' AND c.flag = '0'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    public function actionJob() {
        $dataList = $this->getWork();
        return $this->renderPartial('job', [
                    'dataList' => $dataList
        ]);
    }

    public function actionSearchjob() {
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Transport();
        $dataList = $Model->searchJob($customer, $project);
        return $this->renderPartial('searchjob', [
                    'dataList' => $dataList
        ]);
    }

    function getFile($ref) {
        $sql = "select * from uploads where ref = '$ref' and typefile = '2'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getTeansportTagnumber() {
        $sql = "SELECT a.*,c.customer,c.confirm,c.tel,c.time_getjob,c.date_getjob,c.project_name
                    FROM transport a INNER JOIN customer c ON a.ref = c.ref
                    WHERE a.status = '2' AND c.flag = '0'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    public function actionUpdatestatus() {
        $ref = Yii::$app->request->post('ref');

        $columns = array(
            "status" => 3,
            "confirm_date" => date("Y-m-d H:i:s")
        );
        \Yii::$app->db->createCommand()
                ->update("transport", $columns, "ref = '$ref'")
                ->execute();

        $culumnstimeline = array(
            "department" => '9',
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "ลูกค้าได้รับสินค้าแล้ว",
            "todep" => "จัดส่ง(ยืนยันการจัดส่ง)",
            "d_update" => date("Y-m-d H:i:s")
        );
        \Yii::$app->db->createCommand()
                ->insert("timeline", $culumnstimeline)
                ->execute();
    }

}
