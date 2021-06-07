<?php

namespace app\controllers;

use Yii;
use app\models\Graphic;
use app\models\GraphicSearch;
use app\models\Uploads;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Url;
use yii\helpers\Html;
use yii\web\UploadedFile;
use yii\helpers\BaseFileHelper;
use yii\helpers\Json;
use yii\helpers\ArrayHelper;

/**
 * GraphicController implements the CRUD actions for Graphic model.
 */
class GraphicController extends Controller {

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
     * Lists all Graphic models.
     * @return mixed
     */
    public function actionIndex() {
        $ModelGraphic = new Graphic();
        $searchModel = new GraphicSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        //$dataList = $ModelGraphic->getJob();
        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                        //'dataList' => $dataList
        ]);
    }

    /**
     * Displays a single Graphic model.
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
     * Creates a new Graphic model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Graphic();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
                    'model' => $model,
        ]);
    }

    /**
     * Updates an existing Graphic model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ref) {
        $model = $this->findModel($ref);
        //$model->todep = explode(',', $model->todep);
        if ($model->load(Yii::$app->request->post())) {
            $this->Uploads(false, $model->ref_graphic);
            $model->user_id = Yii::$app->user->identity->id;
            //$model->cur_dep = implode(", ", $model->cur_dep);
            $model->create_date = date("Y-m-d H:i:s");
            $model->status = 1; //รับงาน
            //Time Line
            if ($model->flagsend == "1") {
                $this->addTimeline('3', $ref, "กราฟิก / ออกแบบ", "กราฟิก(รับงาน)");
            } else if ($model->flagsend == "2") {//ส่งต่อ
                if (isset($_POST['todep'])) {
                    $todep = implode(", ", $_POST['todep']);
                } else {
                    $todep = "";
                }
                $model->todep = $todep;
                $depStr = "'" . str_replace(",", "','", $todep) . "'";

                $sql = "select id,department from department where id in ($depStr)";
                $result = \Yii::$app->db->createCommand($sql)->queryAll();
                $depArr = [];
                $depVal = [];
                foreach ($result as $r):
                    $depArr[] = $r['department'];
                    $depVal[] = $r['id'];
                endforeach;
                $curdep = implode(",", $depArr);
                //Time Line
                $this->addTimeline('3', $model->ref, "สั่งผลิต", $curdep);
                //ส่งไปแผนก
                $this->sendDepartment($depVal, $model->ref);
            } else if ($model->flagsend == "3") { //จบงานที่นี้
                //Time Line
                $this->addTimeline('3', $model->ref, "การตลาด / บัญชี(ตามงาน)", "กราฟิก / ออกปบบ");
                //ส่งการตลาดแจ้งลูกค้า
                $res = \app\models\Branchmarketing::findOne(['ref' => $ref]);
                if ($res['ref'] == "") {
                    $columns = array(
                        "ref" => $ref
                    );
                    \Yii::$app->db->createCommand()
                            ->insert("branchmarketing", $columns)
                            ->execute();
                }
            } else { //ส่งผลิตนอกร้าน
                $this->addTimeline('3', $model->ref, "ส่งผลิตนอกร้าน / บัญชี(ตามงาน)", "กราฟิก / ออกปบบ");
                $columns = array("outside" => '1');
                Yii::$app->db->createCommand()
                        ->update("customer", $columns, "ref = '$ref'")
                        ->execute();
            }

            //สั่งอัพเดทถ้ามีการแก้ไข
            \Yii::$app->db->createCommand()
                    ->update("graphic_log", array("flag" => '0'), "ref = '$ref'")
                    ->execute();


            //ดึงข้อมูลลูกค้า
            $customer = \app\models\Customer::findOne(['ref' => $ref]);
            //ส่งจัดคิวติดตั้ง
            if ($customer['setup'] == 1) {
                \Yii::$app->db->createCommand()
                        ->delete("queue", "ref = '$ref'")
                        ->execute();

                \Yii::$app->db->createCommand()
                        ->insert("queue", array("ref" => $ref))
                        ->execute();
            }

            //ส่งต่อแผนกจัดส่ง
            if ($customer['transport'] == 1) {
                \Yii::$app->db->createCommand()
                        ->delete("transport", "ref = '$ref'")
                        ->execute();

                \Yii::$app->db->createCommand()
                        ->insert("transport", array("ref" => $ref))
                        ->execute();
            }
            $model->save();
            //return $this->redirect(['view', 'ref' => $model->ref]);
            return $this->redirect(['index']);
        } else {
            if ($model->ref_graphic == "") {
                $model->ref_graphic = substr(Yii::$app->getSecurity()->generateRandomString(), 10);
            } else {
                $model->ref_graphic = $model->ref_graphic;
            }
        }
        list($initialPreview, $initialPreviewConfig) = $this->getInitialPreview($model->ref_graphic);
        return $this->render('update', [
                    'model' => $model,
                    'initialPreview' => $initialPreview,
                    'initialPreviewConfig' => $initialPreviewConfig
        ]);
    }

    /**
     * Deletes an existing Graphic model.
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
     * Finds the Graphic model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Graphic the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ref) {
        if (($model = Graphic::findOne(['ref' => $ref])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionGetjob() {
        $type = Yii::$app->request->post("type");
        $ModelGraphic = new Graphic();
        $dataList = $ModelGraphic->getJob($type);
        return $this->renderPartial('job', [
                    'dataList' => $dataList
        ]);
    }

    private function Uploads($isAjax = false, $ref_graphic = "") {
        if (Yii::$app->request->isPost) {
            $images = UploadedFile::getInstancesByName('upload_ajax');
            if ($images) {
                //$ref = Yii::$app->request->post('ref');
                $this->CreateDir($ref_graphic);
                foreach ($images as $file) {
                    $fileName = $file->baseName . '.' . $file->extension;
                    $realFileName = md5($file->baseName . time()) . '.' . $file->extension;
                    $savePath = Graphic::UPLOAD_FOLDER . '/' . $ref_graphic . '/' . $realFileName;
                    if ($file->saveAs($savePath)) {

                        if ($this->isImage(Url::base(true) . '/' . $savePath)) {
                            $this->createThumbnail($ref_graphic, $realFileName);
                        }

                        //$type = pathinfo($realFileName, PATHINFO_EXTENSION);

                        $model = new Uploads;
                        $model->ref = $ref_graphic;
                        $model->file_name = $fileName;
                        $model->real_filename = $realFileName;

                        $imgAray = ['jpg', 'JPG', 'jpeg', 'JPEG', 'png', 'PNG', 'gif', 'GIF'];
                        if (in_array($file->extension, $imgAray)) {
                            $model->typefile = "1";
                        } else {
                            $model->typefile = "2";
                        }
                        //$model->typefile = $file->extension;
                        $model->save();

                        if ($isAjax === true) {
                            echo json_encode(['success' => 'true']);
                        }
                    } else {
                        if ($isAjax === true) {
                            echo json_encode(['success' => 'false', 'eror' => $file->error]);
                        }
                    }
                }
            }
        }
    }

    private function getInitialPreview($ref_graphic) {
        $datas = Uploads::find()->where(['ref' => $ref_graphic])->all();
        $initialPreview = [];
        $initialPreviewConfig = [];
        foreach ($datas as $key => $value) {
            array_push($initialPreview, $this->getTemplatePreview($value));
            array_push($initialPreviewConfig, [
                'caption' => $value->file_name,
                'width' => '120px',
                'url' => Url::to(['/graphic/deletefile-ajax']),
                'key' => $value->upload_id
            ]);
        }
        return [$initialPreview, $initialPreviewConfig];
    }

    private function getTemplatePreview(Uploads $model) {
        $filePath = Graphic::getUploadUrl() . $model->ref . '/' . $model->real_filename;
        $isImage = $this->isImage($filePath);
        if ($isImage) {
            $file = Html::img($filePath, ['class' => 'file-preview-image', 'alt' => $model->file_name, 'title' => $model->file_name]);
        } else {
            $file = "<div class='file-preview-other'> " .
                    "<h2><i class='far fa-file-alt fa-3x'></i></h2>" .
                    "</div>";
        }
        return $file;
    }

    public function isImage($filePath) {
        return @is_array(getimagesize($filePath)) ? true : false;
    }

    private function createThumbnail($folderName, $fileName, $width = 250) {
        $uploadPath = Graphic::getUploadPath() . '/' . $folderName . '/';
        $file = $uploadPath . $fileName;
        $image = Yii::$app->image->load($file);
        $image->resize($width);
        $image->save($uploadPath . 'thumbnail/' . $fileName);
        return;
    }

    public function actionDeletefileAjax() {

        $model = Uploads::findOne(Yii::$app->request->post('key'));
        if ($model !== NULL) {
            $filename = Graphic::getUploadPath() . $model->ref . '/' . $model->real_filename;
            $thumbnail = Graphic::getUploadPath() . $model->ref . '/thumbnail/' . $model->real_filename;
            if ($model->delete()) {
                @unlink($filename);
                @unlink($thumbnail);
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false]);
            }
        } else {
            echo json_encode(['success' => false]);
        }
    }

    private function removeUploadDir($dir) {
        BaseFileHelper::removeDirectory(Graphic::getUploadPath() . $dir);
    }

    public function actionUploadAjax($ref_graphic = "") {
        $this->Uploads(true, $ref_graphic);
    }

    private function CreateDir($folderName) {
        if ($folderName != NULL) {
            $basePath = Graphic::getUploadPath();
            if (BaseFileHelper::createDirectory($basePath . $folderName, 0777)) {
                BaseFileHelper::createDirectory($basePath . $folderName . '/thumbnail', 0777);
            }
        }
        return;
    }

    function addTimeline($department, $ref, $log, $todep) {
        $rs = \app\models\Timeline::findOne(['ref' => $ref, 'department' => $department]);
        if ($rs['ref']) {
            $culumns = array(
                "department" => $department,
                "ref" => $ref,
                "user_id" => Yii::$app->user->identity->id,
                "log" => $log,
                "todep" => $todep,
                "d_update" => date("Y-m-d H:i:s")
            );
            \Yii::$app->db->createCommand()
                    ->update("timeline", $culumns, "ref = '$ref' AND department = '$department'")
                    ->execute();
        } else {
            $culumns = array(
                "department" => $department,
                "ref" => $ref,
                "user_id" => Yii::$app->user->identity->id,
                "log" => $log,
                "todep" => $todep,
                "d_update" => date("Y-m-d H:i:s")
            );
            \Yii::$app->db->createCommand()
                    ->insert("timeline", $culumns)
                    ->execute();
        }
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
                        ->update("customer", array("print_status" => '1'), "ref = '$ref'")
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
                        ->update("customer", array("cnc_status" => '1'), "ref = '$ref'")
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
                        ->update("customer", array("manufacture_status" => '1'), "ref = '$ref'")
                        ->execute();
            }
        }

        if (in_array("8", $dep)) {//ช่าง
            Yii::$app->db->createCommand()
                    ->delete("queue", "ref = '$ref' ")
                    ->execute();

            //อัพเดทสถานะงาน
            \Yii::$app->db->createCommand()
                    ->update("customer", array("setup" => '0'), "ref = '$ref'")
                    ->execute();

            $res = \app\models\Queue::findOne(['ref' => $ref]);
            if (!isset($res['ref'])) {
                $columns = array(
                    "confirm" => 1,
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("queue", $columns)
                        ->execute();

                //อัพเดทสถานะงาน
                \Yii::$app->db->createCommand()
                        ->update("customer", array("setup" => '1'), "ref = '$ref'")
                        ->execute();
            }
        }

        if (in_array("9", $dep)) {//จัดส่ง
            $columns = array(
                "ref" => $ref
            );
        }
    }

    public function actionSearchjob() {
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Graphic();
        $dataList = $Model->searchJob($customer, $project);
        return $this->renderPartial('searchjob', [
                    'dataList' => $dataList
        ]);
    }

    public function actionFormupdate($ref) {
        $this->layout = "graphic";
        //$ref = Yii::$app->request->post('ref');
        $model = $this->findModel($ref);

        $model->todep = explode(',', $model->todep);

        if ($model->ref_graphic == "") {
            $model->ref_graphic = substr(Yii::$app->getSecurity()->generateRandomString(), 10);
        } else {
            $model->ref_graphic = $model->ref_graphic;
        }

        list($initialPreview, $initialPreviewConfig) = $this->getInitialPreview($model->ref_graphic);
        return $this->render('updatepopup', [
                    'model' => $model,
                    'initialPreview' => $initialPreview,
                    'initialPreviewConfig' => $initialPreviewConfig
        ]);
    }

    public function actionSendwork() {
        //สั่ง อัพเดทตาราง graphic
        $ref = Yii::$app->request->post('ref');
        \Yii::$app->db->createCommand()
                ->update("graphic", array("approve" => '1'), "ref = '$ref'")
                ->execute();
    }

}
