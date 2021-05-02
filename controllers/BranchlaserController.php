<?php

namespace app\controllers;

use Yii;
use app\models\Branchlaser;
use app\models\BranchlaserSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * BranchlaserController implements the CRUD actions for Branchlaser model.
 */
class BranchlaserController extends Controller {

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
     * Lists all Branchlaser models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new BranchlaserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Branchlaser model.
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
     * Creates a new Branchlaser model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Branchlaser();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
                    'model' => $model,
        ]);
    }

    /**
     * Updates an existing Branchlaser model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
                    'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Branchlaser model.
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
     * Finds the Branchlaser model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Branchlaser the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Branchlaser::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionGetjob() {
        $Model = new Branchlaser();
        $dataList = $Model->getJob();
        $dataListjob = $Model->getJobForUser();
        $maseditwork = \app\models\Maseditwork::find()->all();
        return $this->renderPartial('job', [
                    'dataList' => $dataList,
                    'dataListjob' => $dataListjob,
                    'maseditwork' => $maseditwork
        ]);
    }

    public function actionUpdatestatus() {
        $ref = Yii::$app->request->post('ref');
        $status = Yii::$app->request->post('status');
        if ($status == "2") {//รับงาน
            $columns = array(
                "status" => $status,
                "user_id" => Yii::$app->user->identity->id,
                "create_date" => date("Y-m-d H:i:s")
            );

            \Yii::$app->db->createCommand()
                    ->update("branchlaser", $columns, "ref = '$ref'")
                    ->execute();

            $culumnstimeline = array(
                "department" => 6,
                "ref" => $ref,
                "user_id" => Yii::$app->user->identity->id,
                "log" => "รับงาน",
                "todep" => "CNC / Laser(รับงาน)",
                "d_update" => date("Y-m-d H:i:s")
            );
        } else if ($status == "4") {//ยืนยันการผลิต
            $columns = array(
                "status" => $status,
                "user_id" => Yii::$app->user->identity->id,
                "confirm_date" => date("Y-m-d H:i:s")
            );

            \Yii::$app->db->createCommand()
                    ->update("branchlaser", $columns, "ref = '$ref'")
                    ->execute();

            $culumnstimeline = array(
                "department" => 6,
                "ref" => $ref,
                "user_id" => Yii::$app->user->identity->id,
                "log" => "ยืนยันการผลิต",
                "todep" => "CNC / Laser(งานผลิตเสร็จแล้ว)",
                "d_update" => date("Y-m-d H:i:s")
            );

            //อัพเดทสถานะงาน
            \Yii::$app->db->createCommand()
                    ->update("customer", array("cnc_status" => 2), "ref = '$ref'")
                    ->execute();
        }
        \Yii::$app->db->createCommand()
                ->insert("timeline", $culumnstimeline)
                ->execute();
    }

    public function actionEditwork() {
        $ref = Yii::$app->request->post('ref');
        $type = Yii::$app->request->post('type');
        $typeetc = Yii::$app->request->post('typeetc');
        //Update Graphic
        Yii::$app->db->createCommand()
                ->update("graphic", array("status" => 3, "flagsend" => 1), "ref = '$ref'")
                ->execute();

        //Update GraphicLog
        $columns = array(
            "ref" => $ref,
            "type_edit" => $type,
            "edit_etc" => $typeetc,
            "department" => "cnc / laser ส่งแก้ไข",
            "flag" => 1,
            "d_update" => date("Y-m-d H:i:s")
        );
        \Yii::$app->db->createCommand()
                ->insert("graphic_log", $columns)
                ->execute();

        //สั่งลบคิวงานออกจากแผนก
        \Yii::$app->db->createCommand()
                ->delete("branchlaser", "ref='$ref'")
                ->execute();
        //timeline
        $culumnstimeline = array(
            "department" => 6,
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "ส่งแก้ไขงาน",
            "todep" => "cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)",
            "d_update" => date("Y-m-d H:i:s")
        );

        Yii::$app->db->createCommand()
                ->insert("timeline", $culumnstimeline)
                ->execute();

        return 1;
    }

    public function actionSearchjob() {
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Branchlaser();
        $dataList = $Model->searchJob($customer, $project);
        $maseditwork = \app\models\Maseditwork::find()->all();
        return $this->renderPartial('searchjob', [
                    'dataList' => $dataList,
                    'maseditwork' => $maseditwork
        ]);
    }

}
