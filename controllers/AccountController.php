<?php

namespace app\controllers;

use Yii;
use yii\helpers\Url;
use app\models\Account;
use app\models\AccountSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AccountController implements the CRUD actions for Account model.
 */
class AccountController extends Controller {

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
     * Lists all Account models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new AccountSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $quoTation = $this->getQuotation();
        //$jobApprove = $this->getWorkNonApprove();
        $jobOutside = $this->getWorkOutside();
        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                    'dataList' => $quoTation,
                    //'job' => $jobApprove,
                    'outside' => $jobOutside
        ]);
    }

    function getQuotation() {
        $sql = "SELECT c.*
                    FROM account a INNER JOIN customer c ON a.ref = c.ref
                    WHERE a.`status` = '0' AND c.flag = '0' AND c.flag = '0'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getWorkNonApprove() {
        $sql = "SELECT c.*
                FROM customer c
                WHERE c.flag = '0' AND c.outside = '0' AND c.flag = '0'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getWorkOutside() {
        $sql = "SELECT c.*
                FROM customer c
                WHERE c.flag = '0' AND c.outside = '1' AND c.flag = '0'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    /**
     * Displays a single Account model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ref) {
        return $this->render('view', [
                    'model' => $this->findModel($ref),
        ]);
    }

    /**
     * Creates a new Account model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Account();
        $error = "กรุณาแนบลิงค์หรืออัพโหลดใบเสนอราคา";
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->file == null && $model->link == "") {
                return $this->render('create', [
                            'model' => $model,
                            'error' => $error
                ]);
            } else {
                $model->file = $model->upload($model, 'file');
                $model->save();
                return $this->redirect(['view', 'ref' => $model->ref]);
            }
        }

        return $this->render('create', [
                    'model' => $model,
                    'error' => ''
        ]);
    }

    /**
     * Updates an existing Account model.
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

        $error = "กรุณาแนบลิงค์หรืออัพโหลดใบเสนอราคา";
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            //if(empty($model->upload($model,'file')) && empty($model->link)){
            // return $this->render('update', [
            // 'model' => $model,
            //'error' => $error,
            //'modelCustomer' => $modelCustomer,
            //'file' => $file
            //]);
            //} else {
            $model->file = $model->upload($model, 'file');
            $model->user_id = Yii::$app->user->identity->id;
            $model->status = 1;
            $model->create_date = date("Y-m-d H:i:s");
            $model->save();

            //ส่งไปกราฟิก
            $refgraphic = \app\models\Graphic::findOne(['ref' => $ref]);
            if (!$refgraphic['ref']) {
                Yii::$app->db->createCommand()
                        ->insert("graphic", array("ref" => $ref))
                        ->execute();
            }
            //Time Line
            $rs = \app\models\Timeline::find()
                    ->where(['ref' => $ref])
                    ->andWhere(['department' => 4])
                    ->One();
            if (!$rs['ref']) {
                $culumns = array(
                    "department" => 4,
                    "ref" => $model->ref,
                    "user_id" => Yii::$app->user->identity->id,
                    "log" => "รับงาน",
                    "todep" => "กราฟิก / ออกแบบ",
                    "d_update" => date("Y-m-d H:i:s")
                );
                \Yii::$app->db->createCommand()
                        ->insert("timeline", $culumns)
                        ->execute();
            } else {
                $culumns = array(
                    "department" => 4,
                    "user_id" => Yii::$app->user->identity->id,
                    "log" => "รับงาน",
                    "todep" => "กราฟิก / ออกแบบ",
                    "d_update" => date("Y-m-d H:i:s")
                );
                \Yii::$app->db->createCommand()
                        ->update("timeline", $culumns, "ref = '$ref'")
                        ->execute();
            }
            //ส่งไปแผนก
            //$depVal = array('3');
            //$this->sendDepartment($depVal, $model->ref);

            return $this->redirect(['index']);
            //return $this->redirect(['view', 'ref' => $model->ref]);
            //}
        }

        return $this->render('update', [
                    'model' => $model,
                    'error' => '',
                    'modelCustomer' => $modelCustomer,
                    'file' => $file
        ]);
    }

    /**
     * Deletes an existing Account model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ref) {
        $model = $this->findModel($ref);
        $file = $model->file;
        //echo $file;
        $path = Url::to('./uploads/account/' . $model->file);
        if ($file) {
            if (file_exists($path)) {
                unlink($path);
            }
        }
        $this->findModel($ref)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Account model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Account the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ref) {
        if (($model = Account::findOne(['ref' => $ref])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    function getTimeline($ref) {
        $sql = "SELECT t.*,d.department AS curdep,p.`name`
        FROM timeline t INNER JOIN department d ON t.department = d.id
        INNER JOIN `profile` p ON t.user_id = p.user_id
        WHERE t.ref = '$ref'
        ORDER BY t.d_update DESC";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getFile($ref) {
        $sql = "select * from uploads where ref = '$ref' and typefile = '2'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
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
        } else if (in_array("3", $dep)) {//แผนกกราฟิก
            $res = \app\models\Graphic::findOne(['ref' => $ref]);
            if ($res['ref'] == "") {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("graphic", $columns)
                        ->execute();
            }
        } else { //แผนกการตลาดลูกค้าสัมพันธ์
            $columns = array(
                "ref" => $ref
            );
        }
    }

    public function actionSearchjob() {
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Account();
        $dataList = $Model->searchJob($customer, $project);
        return $this->renderPartial('searchjob', [
                    'dataList' => $dataList
        ]);
    }

    public function actionConfirmwork() {
        $ref = Yii::$app->request->post('ref');
        $comment = Yii::$app->request->post('comment');

        $columns = array(
            "flag" => '1',
            "comment" => $comment,
            "approve" => '1',
            "confirmdate" => date("Y-m-d H:i:s")
        );
        //update customer
        $rs = Yii::$app->db->createCommand()
                ->update("customer", $columns, "ref = '$ref'")
                ->execute();

        $culumnsTimeline = array(
            "department" => 4,
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "งาน Approve",
            "todep" => "งาน Approve",
            "d_update" => date("Y-m-d H:i:s")
        );
        \Yii::$app->db->createCommand()
                ->insert("timeline", $culumnsTimeline)
                ->execute();
        if ($rs) {
            return 0;
        } else {
            return 1;
        }
    }

    public function actionJob() {
        $data['dataList'] = $this->getQuotation();
        return $this->renderPartial('job', $data);
    }

    public function actionLoadjob() {
        $data['job'] = $this->getWorkNonApprove();
        return $this->renderPartial('jobconfirm', $data);
    }

}
