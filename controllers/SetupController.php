<?php

namespace app\controllers;

use Yii;
use app\models\Queue;
use app\models\QueueSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Uploads;
use yii\helpers\Url;
use yii\helpers\Html;
use yii\web\UploadedFile;
use yii\helpers\BaseFileHelper;
use yii\helpers\Json;
use yii\helpers\ArrayHelper;

/**
 * BranchfactureController implements the CRUD actions for Branchfacture model.
 */
class SetupController extends Controller {

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
     * Lists all Branchfacture models.
     * @return mixed
     */
    public function actionIndex() {
        return $this->render('index');
    }

    /**
     * Displays a single Branchfacture model.
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
     * Creates a new Branchfacture model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Branchfacture();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
                    'model' => $model,
        ]);
    }

    /**
     * Updates an existing Branchfacture model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ref) {
        $model = $this->findModel($ref);

        if ($model->load(Yii::$app->request->post())) {
            $this->Uploads(false, $model->refsetup);
            $model->approve = '2';
            $model->dupdate = date("Y-m-d H:i:s");
            $model->save();

            $culumnstimeline = array(
                "department" => '8',
                "ref" => $ref,
                "user_id" => Yii::$app->user->identity->id,
                "log" => "ติดตั้งงานลูกค้า",
                "todep" => "ช่างติดตั้ง(ส่งงานลูกค้า)",
                "d_update" => date("Y-m-d H:i:s")
            );

            \Yii::$app->db->createCommand()
                    ->insert("timeline", $culumnstimeline, "ref = '$ref'")
                    ->execute();
            //อัพเดทสถานะงาน
            \Yii::$app->db->createCommand()
                    ->update("customer", array("technician_status" => '2'), "ref = '$ref'")
                    ->execute();

            return $this->redirect(['index']);
        }

        list($initialPreview, $initialPreviewConfig) = $this->getInitialPreview($model->refsetup);
        return $this->render('update', [
                    'model' => $model,
                    'initialPreview' => $initialPreview,
                    'initialPreviewConfig' => $initialPreviewConfig
        ]);
    }

    protected function findModel($ref) {
        if (($model = Queue::findOne(['ref' => $ref])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    //ดึงงานที่นังไม่ได้ลงคิวงาน
    function getWork($type, $customer, $job) {

        if ($type == 1) {
            $order = "ORDER BY D,H";
        } else if ($type == 2) {
            $order = "order by c.date_getjob asc";
        } else {
            $order = "order by c.create_date desc";
        }

        if ($customer != "" && $job != "") {
            $searchWhere = " and c.customer like '%$customer%' or c.project_name like '%$job%'";
        } else if ($customer != "" && $job == "") {
            $searchWhere = " and c.customer like '%$customer%'";
        } else if ($customer == "" && $job != "") {
            $searchWhere = " and c.project_name like '%$job%'";
        } else {
            $searchWhere = "";
        }

        $sql = "SELECT a.*,c.customer,c.confirm,c.tel,c.time_getjob,c.date_getjob,c.project_name,c.level,
            TIMESTAMPDIFF(day,CURDATE(),c.date_getjob) AS D,
                    TIMESTAMPDIFF(HOUR,NOW(),CONCAT(c.date_getjob,' ',c.time_getjob)) AS H,
                    TIMESTAMPDIFF(HOUR,c.`create_date`,CONCAT(c.date_getjob,' ',c.time_getjob)) AS INDAY
                    FROM queue a INNER JOIN customer c ON a.ref = c.ref
                    WHERE a.approve != '2' AND c.flag = '0' $searchWhere $order";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    public function actionUpdatestatus() {
        $ref = Yii::$app->request->post('ref');

        $refsetup = substr(Yii::$app->getSecurity()->generateRandomString(), 10);
        $columns = array(
            "approve" => 1,
            "usersetup" => Yii::$app->user->identity->id,
            "refsetup" => $refsetup,
            "dupdate" => date("Y-m-d H:i:s")
        );

        \Yii::$app->db->createCommand()
                ->update("queue", $columns, "ref = '$ref'")
                ->execute();

        $culumnstimeline = array(
            "department" => '8',
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "รับงาน",
            "todep" => "ช่างติดตั้ง(รับงาน)",
            "d_update" => date("Y-m-d H:i:s")
        );

        \Yii::$app->db->createCommand()
                ->insert("timeline", $culumnstimeline, "ref = '$ref'")
                ->execute();
        //อัพเดทสถานะงาน
        \Yii::$app->db->createCommand()
                ->update("customer", array("technician_status" => '1'), "ref = '$ref'")
                ->execute();
    }

    public function actionConfirmstatus() {
        $ref = Yii::$app->request->post('ref');
        //อัพเดทสถานะงาน
        \Yii::$app->db->createCommand()
                ->update("queue", array("approve" => '2', 'dupdate' => date("Y-m-d H:i:s")), "ref = '$ref'")
                ->execute();

        $culumnstimeline = array(
            "department" => '8',
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "ติดตั้งงานลูกค้า",
            "todep" => "ช่างติดตั้ง(ส่งงานลูกค้า)",
            "d_update" => date("Y-m-d H:i:s")
        );

        \Yii::$app->db->createCommand()
                ->insert("timeline", $culumnstimeline, "ref = '$ref'")
                ->execute();

        //อัพเดทสถานะงาน
        \Yii::$app->db->createCommand()
                ->update("customer", array("technician_status" => '2'), "ref = '$ref'")
                ->execute();
    }

    public function actionJob() {
        $type = Yii::$app->request->post('type');
        $customer = Yii::$app->request->post("customer");
        $project = Yii::$app->request->post("project");
        $dataList = $this->getWork($type, $customer, $project);
        return $this->renderPartial('job', [
                    'dataList' => $dataList
        ]);
    }

    public function actionSearchjob() {
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Queue();
        $dataList = $Model->searchJob($customer, $project);
        return $this->renderPartial('searchjob', [
                    'dataList' => $dataList
        ]);
    }

    private function Uploads($isAjax = false, $refsetup = "") {
        if (Yii::$app->request->isPost) {
            $images = UploadedFile::getInstancesByName('upload_ajax');
            if ($images) {
                //$ref = Yii::$app->request->post('ref');
                $this->CreateDir($refsetup);
                foreach ($images as $file) {
                    $fileName = $file->baseName . '.' . $file->extension;
                    $realFileName = md5($file->baseName . time()) . '.' . $file->extension;
                    $savePath = Queue::UPLOAD_FOLDER . '/' . $refsetup . '/' . $realFileName;
                    if ($file->saveAs($savePath)) {

                        if ($this->isImage(Url::base(true) . '/' . $savePath)) {
                            $this->createThumbnail($refsetup, $realFileName);
                        }

                        //$type = pathinfo($realFileName, PATHINFO_EXTENSION);

                        $model = new Uploads;
                        $model->ref = $refsetup;
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

    private function getInitialPreview($refsetup) {
        $datas = Uploads::find()->where(['ref' => $refsetup])->all();
        $initialPreview = [];
        $initialPreviewConfig = [];
        foreach ($datas as $key => $value) {
            array_push($initialPreview, $this->getTemplatePreview($value));
            array_push($initialPreviewConfig, [
                'caption' => $value->file_name,
                'width' => '120px',
                'url' => Url::to(['/setup/deletefile-ajax']),
                'key' => $value->upload_id
            ]);
        }
        return [$initialPreview, $initialPreviewConfig];
    }

    private function getTemplatePreview(Uploads $model) {
        $filePath = Queue::getUploadUrl() . $model->ref . '/thumbnail/' . $model->real_filename;
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
        $uploadPath = Queue::getUploadPath() . '/' . $folderName . '/';
        $file = $uploadPath . $fileName;
        $image = Yii::$app->image->load($file);
        $image->resize($width);
        $image->save($uploadPath . 'thumbnail/' . $fileName);
        return;
    }

    public function actionDeletefileAjax() {

        $model = Uploads::findOne(Yii::$app->request->post('key'));
        if ($model !== NULL) {
            $filename = Queue::getUploadPath() . $model->ref . '/' . $model->real_filename;
            $thumbnail = Queue::getUploadPath() . $model->ref . '/thumbnail/' . $model->real_filename;
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
        BaseFileHelper::removeDirectory(Queue::getUploadPath() . $dir);
    }

    public function actionUploadAjax($refsetup = "") {
        $this->Uploads(true, $refsetup);
    }

    private function CreateDir($folderName) {
        if ($folderName != NULL) {
            $basePath = Queue::getUploadPath();
            if (BaseFileHelper::createDirectory($basePath . $folderName, 0777)) {
                BaseFileHelper::createDirectory($basePath . $folderName . '/thumbnail', 0777);
            }
        }
        return;
    }

}
