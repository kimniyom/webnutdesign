<?php

namespace app\controllers;

use Yii;
use app\models\Queue;
use app\models\QueueSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * QueueController implements the CRUD actions for Queue model.
 */
class QueueController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
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
     * Lists all Queue models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QueueSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $listData = $this->getWork();
        $listQueue = $this->getQueue();
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'listData' => $listData,
            'listQueue' => $listQueue
        ]);
    }

    /**
     * Displays a single Queue model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    //ดึงงานที่นังไม่ได้ลงคิวงาน
    function getWork() {
        $sql = "SELECT a.*,c.customer,c.confirm,c.tel,c.time_getjob,c.date_getjob,c.project_name
                    FROM queue a INNER JOIN customer c ON a.ref = c.ref
                    WHERE a.`confirm` = '0'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    //ดึงรายการที่ลงคิวติดตั้งไปแล้ว
    function getQueue() {
        $sql = "SELECT a.*,c.customer,c.confirm,c.tel,c.time_getjob,c.date_getjob,c.project_name
                    FROM queue a INNER JOIN customer c ON a.ref = c.ref
                    WHERE a.`confirm` = '1' AND a.approve != '2'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    /**
     * Creates a new Queue model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Queue();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Queue model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ref)
    {
        $model = $this->findModel($ref);
        /* รายละเอียดงาน */
        $modelCustomer = \app\models\Customer::findOne(['ref' => $ref]);
        $file = $this->getFile($ref);
        if ($model->load(Yii::$app->request->post())) {
            $model->confirm = 1;
            $model->dupdate = date("Y-m-d H:i:s");
            $model->user_id = Yii::$app->user->identity->id;

            //Insert Timeline
            $culumns = array(
                    "department" => 2,
                    "ref" => $ref,
                    "user_id" => Yii::$app->user->identity->id,
                    "log" => "ลงคิวงานติดตั้ง",
                    "todep" => 8,
                    "d_update" => date("Y-m-d H:i:s")
                );
            \Yii::$app->db->createCommand()
                        ->insert("timeline", $culumns)
                        ->execute();
        

            $model->save();
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
            'modelCustomer' => $modelCustomer,
            'file' => $file
        ]);
    }

    function getFile($ref) {
        $sql = "select * from uploads where ref = '$ref' and typefile = '2'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    /**
     * Deletes an existing Queue model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Queue model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Queue the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ref)
    {
        if (($model = Queue::findOne(['ref' => $ref])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    private function sendDepartment($dep, $ref) {
        if (in_array("4", $dep)) {//แผนกบัญชี
            $res = \app\models\Account::findOne(['ref' => $ref]);
            if ($res['ref'] == "") {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("account", $columns)
                        ->execute();
            }
        }

        if (in_array("3", $dep)) {//แผนกกราฟิก
            $res = \app\models\Graphic::findOne(['ref' => $ref]);
            if ($res['ref'] == "") {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("graphic", $columns)
                        ->execute();
            }
        }

        if (in_array("5", $dep)) { //งานพิมพ์
            $res = \app\models\Branchprint::findOne(['ref' => $ref]);
            if ($res['ref'] == "") {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("branchprint", $columns)
                        ->execute();

                //Update customer
                \Yii::$app->db->createCommand()
                        ->update("customer", array("print_status" => 1), "ref = '$ref'")
                        ->execute();
            }
        }

        if (in_array("6", $dep)) {//cnc
            $res = \app\models\Branchlaser::findOne(['ref' => $ref]);
            if ($res['ref'] == "") {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("branchlaser", $columns)
                        ->execute();

                //Update customer
                \Yii::$app->db->createCommand()
                        ->update("customer", array("cnc_status" => 1), "ref = '$ref'")
                        ->execute();
            }
        }

        if (in_array("7", $dep)) {//ผลิตทั่วไป
            $res = \app\models\Branchfacture::findOne(['ref' => $ref]);
            if ($res['ref'] == "") {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("branchfacture", $columns)
                        ->execute();

                //Update customer
                \Yii::$app->db->createCommand()
                        ->update("customer", array("manufacture_status" => 1), "ref = '$ref'")
                        ->execute();
            }
        }

        if (in_array("8", $dep)) {//ช่าง / ติดตั้ง
            $columns = array(
                "ref" => $ref
            );
        }

        if (in_array("9", $dep)) {//จัดส่ง
            $columns = array(
                "ref" => $ref
            );
        }
    }
}
