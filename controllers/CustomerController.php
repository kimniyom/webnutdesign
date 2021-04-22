<?php

namespace app\controllers;

use Yii;
use app\models\Customer;
use app\models\Mascancel;
use app\models\CustomerSearch;
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
 * CustomerController implements the CRUD actions for Customer model.
 */
class CustomerController extends Controller {

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
    

    public function actions()
    {
        if (Yii::$app->user->isGuest) {
            Yii::$app->response->redirect(\Yii::$app->urlManager->createUrl(['site']), 301);
            Yii::$app->end();
            exit();
        }
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            
        ];
    }


    /**
     * Lists all Customer models.
     * @return mixed
     */
    public function actionIndex() {
        $ModelCustomer = new Customer();
        $searchModel = new CustomerSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataList = $ModelCustomer->getJob();
        $mascancel = Mascancel::find()->all();
        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                    'dataList' => $dataList,
                    'mascancel' => $mascancel
        ]);
    }

    /**
     * Displays a single Customer model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id) {
        $model = $this->findModel($id);
        $file = $this->getFile($model->ref);
        $timeline = $this->getTimeline($model->ref);
        return $this->render('view', [
                    'model' => $model,
                    'filelist' => $file,
                    'timeline' => $timeline
        ]);
    }

    public function actionGetjob() {
        $ModelCustomer = new Customer();
        $dataList = $ModelCustomer->getJob();
        return $this->renderPartial('job', [
                    'dataList' => $dataList
        ]);
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

    /**
     * Creates a new Customer model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Customer();
        if ($model->load(Yii::$app->request->post())) {
            $this->Uploads(false, $model->ref);
            $model->user_id = Yii::$app->user->identity->id;
            $model->cur_dep = implode(", ", $model->cur_dep);
            $model->create_date = date("Y-m-d H:i:s");
            $model->confirm = $model->confirm;
            if ($model->confirm = 1) {
                $depStr = "'" . str_replace(",", "','", $model->cur_dep) . "'";
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
                $culumns = array(
                    "department" => 1,
                    "ref" => $model->ref,
                    "user_id" => Yii::$app->user->identity->id,
                    "log" => "บันทึกข้อมูลการรับงาน",
                    "todep" => $curdep,
                    "d_update" => date("Y-m-d H:i:s")
                );
                \Yii::$app->db->createCommand()
                        ->insert("timeline", $culumns)
                        ->execute();

                //ส่งไปแผนก
                $this->sendDepartment($depVal, $model->ref);
            }

            if ($model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            }
        } else {
            $model->ref = substr(Yii::$app->getSecurity()->generateRandomString(), 10);
        }

        return $this->render('create', [
                    'model' => $model,
        ]);
    }

    /**
     * Updates an existing Customer model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);
        //echo $model->cur_dep;
        $model->cur_dep = explode(",", $model->cur_dep);
        list($initialPreview, $initialPreviewConfig) = $this->getInitialPreview($model->ref);
        if ($model->load(Yii::$app->request->post())) {
            $this->Uploads(false, $model->ref);
            //$model->cur_dep = implode(",", $model->cur_dep);
            $model->cur_dep = implode(",", $_POST['Customer']['cur_dep']);
            $ref = $model->ref;
            $model->confirm = $model->confirm;
            if ($model->confirm = 1) {
                \Yii::$app->db->createCommand()
                        ->delete("timeline", "ref = '$ref'")
                        ->execute();
                $depStr = "'" . str_replace(",", "','", $model->cur_dep) . "'";
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
                $culumns = array(
                    "department" => 1,
                    "ref" => $model->ref,
                    "user_id" => Yii::$app->user->identity->id,
                    "log" => "บันทึกข้อมูลการรับงาน",
                    "todep" => $curdep,
                    "d_update" => date("Y-m-d H:i:s")
                );
                \Yii::$app->db->createCommand()
                        ->insert("timeline", $culumns)
                        ->execute();

                //ส่งไปแผนก
                $this->sendDepartment($depVal, $model->ref);
            }

            if ($model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        return $this->render('update', [
                    'model' => $model,
                    'initialPreview' => $initialPreview,
                    'initialPreviewConfig' => $initialPreviewConfig
        ]);
    }

    /**
     * Deletes an existing Customer model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id) {
        //$this->findModel($id)->delete();
        $model = $this->findModel($id);
        //remove upload file & data
        $this->removeUploadDir($model->ref);
        Uploads::deleteAll(['ref' => $model->ref]);
        $model->delete();
        return $this->redirect(['index']);
    }

    /**
     * Finds the Customer model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Customer the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Customer::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    private function Uploads($isAjax = false, $ref = "") {
        if (Yii::$app->request->isPost) {
            $images = UploadedFile::getInstancesByName('upload_ajax');
            if ($images) {
                //$ref = Yii::$app->request->post('ref');
                $this->CreateDir($ref);
                foreach ($images as $file) {
                    $fileName = $file->baseName . '.' . $file->extension;
                    $realFileName = md5($file->baseName . time()) . '.' . $file->extension;
                    $savePath = Customer::UPLOAD_FOLDER . '/' . $ref . '/' . $realFileName;
                    if ($file->saveAs($savePath)) {

                        if ($this->isImage(Url::base(true) . '/' . $savePath)) {
                            $this->createThumbnail($ref, $realFileName);
                        }

                        //$type = pathinfo($realFileName, PATHINFO_EXTENSION);
                        $model = new Uploads;
                        $model->ref = $ref;
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

    private function getInitialPreview($ref) {
        $datas = Uploads::find()->where(['ref' => $ref])->all();
        $initialPreview = [];
        $initialPreviewConfig = [];
        foreach ($datas as $key => $value) {
            array_push($initialPreview, $this->getTemplatePreview($value));
            array_push($initialPreviewConfig, [
                'caption' => $value->file_name,
                'width' => '120px',
                'url' => Url::to(['/customer/deletefile-ajax']),
                'key' => $value->upload_id
            ]);
        }
        return [$initialPreview, $initialPreviewConfig];
    }

    private function getTemplatePreview(Uploads $model) {
        $filePath = Customer::getUploadUrl() . $model->ref . '/thumbnail/' . $model->real_filename;
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
        $uploadPath = Customer::getUploadPath() . '/' . $folderName . '/';
        $file = $uploadPath . $fileName;
        $image = Yii::$app->image->load($file);
        $image->resize($width);
        $image->save($uploadPath . 'thumbnail/' . $fileName);
        return;
    }

    public function actionDeletefileAjax() {
        $model = Uploads::findOne(Yii::$app->request->post('key'));
        if ($model !== NULL) {
            $filename = Customer::getUploadPath() . $model->ref . '/' . $model->real_filename;
            $thumbnail = Customer::getUploadPath() . $model->ref . '/thumbnail/' . $model->real_filename;
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
        BaseFileHelper::removeDirectory(Customer::getUploadPath() . $dir);
    }

    public function actionUploadAjax($ref = "") {
        $this->Uploads(true, $ref);
    }

    private function CreateDir($folderName) {
        if ($folderName != NULL) {
            $basePath = Customer::getUploadPath();
            if (BaseFileHelper::createDirectory($basePath . $folderName, 0777)) {
                BaseFileHelper::createDirectory($basePath . $folderName . '/thumbnail', 0777);
            }
        }
        return;
    }

    private function sendDepartment($dep, $ref) {
        if (in_array("4", $dep)) {//แผนกบัญชี
            $res = \app\models\Account::findOne(['ref' => $ref]);
            if (!$res['ref']) {
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
            if (!$res['ref']) {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("graphic", $columns)
                        ->execute();
            }
        }
    }

    public function actionViewpage($ref) {
        $model = \app\models\Customer::findOne(['ref' => $ref]);
        $file = $this->getFile($ref);
        $timeline = $this->getTimeline($ref);
        return $this->render('viewpage', [
                    'model' => $model,
                    'filelist' => $file,
                    'timeline' => $timeline
        ]);
    }

    public function actionCancelwork() {
        $ref = Yii::$app->request->post('ref');
        $typecancel = Yii::$app->request->post('typecancel');
        $typeetc = Yii::$app->request->post('typeetc');
        //Update Customer
        Yii::$app->db->createCommand()
                ->update("customer", array(
                    "flag" => 2,
                    "mascancel" => $typecancel,
                    "canceletc" => $typeetc
                ), "ref = '$ref'")
                ->execute();

        //Update Account
        Yii::$app->db->createCommand()
                ->update("account", array("status" => 2), "ref = '$ref'")
                ->execute();

        //Update Graphic
        Yii::$app->db->createCommand()
                ->update("graphic", array("status" => 2), "ref = '$ref'")
                ->execute();


        //Time Line
        $culumns = array(
            "department" => 1,
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "ยกเลิกงาน",
            "flag" => 2,
            "todep" => "ยกเลิกงาน",
            "d_update" => date("Y-m-d H:i:s")
        );
        $rs = \Yii::$app->db->createCommand()
                ->insert("timeline", $culumns)
                ->execute();
        if ($rs) {
            echo 1;
        }
    }

    public function actionSearchjob(){
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Customer();
        $dataList = $Model->searchJob($customer, $project);
        return $this->renderPartial('searchjob', [
                    'dataList' => $dataList
        ]);
    }

}
