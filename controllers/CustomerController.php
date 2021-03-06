<?php

namespace app\controllers;

use Yii;
use app\models\Customer;
use app\models\Mascancel;
use app\models\CustomerSearch;
use app\models\Uploads;
use yii\web\Controller;
use yii\filters\AccessControl;
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
    /*
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
     */

    public function behaviors() {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['login', 'logout', 'signup'],
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['login', 'signup'],
                        'roles' => ['?'],
                    ],
                    [
                        'allow' => true,
                        'actions' => ['Index', 'View', 'Getjob', 'Create', 'Update', 'Viewpage'],
                        'roles' => ['@'],
                    ],
                ],
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
        //$dataList = $ModelCustomer->getJob();
        $mascancel = Mascancel::find()->all();
        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                    //'dataList' => $dataList,
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
        $type = Yii::$app->request->post("type");
        $dataList = $ModelCustomer->getJob($type);
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
        //$model->setup = 0;
        $model->transport = 1;
        $model->quotation = 1;
        $model->fast = 0;
        $model->level = 3;
        $model->confirm = 1;
        $model->typecustomer = 4;
        $model->channel = 1;
        $model->payment = 1;
        $model->date_getjob = date("Y-m-d");
        if ($model->load(Yii::$app->request->post())) {
            //print_r($_POST['cur_dep']);

            $checkBeforCreate = "select * from customer where ref = '".$model->ref."' ";
            $res = Yii::$app->db->createCommand($checkBeforCreate)->queryOne();
            if(empty($res['ref'])){

            $this->Uploads(false, $model->ref);
            $model->user_id = Yii::$app->user->identity->id;

            $model->create_date = date("Y-m-d H:i:s");
            $model->confirm = 1;
            if ($model->confirm == "1") {
                if (isset($_POST['cur_dep'])) {
                    $cur_dep = implode(", ", $_POST['cur_dep']);
                } else {
                    $cur_dep = "4";
                }
                $model->cur_dep = $cur_dep;
                $depStr = "'" . str_replace(",", "','", $cur_dep) . "'";
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
            }

            if ($model->save()) {
                $culumns = array(
                    "department" => '1',
                    "ref" => $model->ref,
                    "user_id" => Yii::$app->user->identity->id,
                    "log" => "???????????????????????????????????????????????????????????????",
                    "todep" => $curdep,
                    "d_update" => date("Y-m-d H:i:s")
                );
                \Yii::$app->db->createCommand()
                        ->insert("timeline", $culumns)
                        ->execute();

                //???????????????????????????
                $this->sendDepartment($depVal, $model->ref);
                if ($model->quotation == "1") {
                    $this->SendAccount($model->ref);
                }

                if ($model->transport == "1") {
                    $this->SendTransport($model->ref);
                }

                /*
                  if ($model->setup == "1") {
                  $this->SendSetup($model->ref);
                  }
                 *
                 */

                return $this->redirect(['view', 'id' => $model->id]);
            }
            } else {
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
        //$cur_dep = implode(", ", $_POST['cur_dep']);
        list($initialPreview, $initialPreviewConfig) = $this->getInitialPreview($model->ref);
        if ($model->load(Yii::$app->request->post())) {
            $this->Uploads(false, $model->ref);
            $model->create_date = $model->create_date;
            //$model->cur_dep = implode(",", $model->cur_dep);
            //$model->cur_dep = $cur_dep;
            //$ref = $model->ref;
            //$model->confirm = $model->confirm;
            //if ($model->confirm = 1) {
            //\Yii::$app->db->createCommand()
            //->delete("timeline", "ref = '$ref'")
            //->execute();
            //$depStr = "'" . str_replace(",", "','", $cur_dep) . "'";
            //$sql = "select id,department from department where id in ($depStr)";
            //$result = \Yii::$app->db->createCommand($sql)->queryAll();
            //$depArr = [];
            //$depVal = [];
            //foreach ($result as $r):
            //$depArr[] = $r['department'];
            //$depVal[] = $r['id'];
            // endforeach;
            //$curdep = implode(",", $depArr);
            //Time Line
            /*
              $culumns = array(
              "department" => 1,
              "ref" => $model->ref,
              "user_id" => Yii::$app->user->identity->id,
              "log" => "???????????????????????????????????????????????????????????????",
              "todep" => $curdep,
              "d_update" => date("Y-m-d H:i:s")
              );
              \Yii::$app->db->createCommand()
              ->insert("timeline", $culumns)
              ->execute();
             *
             */

            //???????????????????????????
            //$this->sendDepartment($depVal, $model->ref);
            //}
            $ref = $model->ref;
            if ($model->quotation == "1") {
                $this->SendAccount($model->ref);
            } else {
                Yii::$app->db->createCommand()
                        ->delete("account", "ref = '$ref'")
                        ->execute();

                Yii::$app->db->createCommand()
                        ->update("customer", array("quotation" => 0), "ref = '$ref'")
                        ->execute();
            }

            if ($model->transport == "1") {
                $this->SendTransport($model->ref);
            } else {
                Yii::$app->db->createCommand()
                        ->delete("transport", "ref = '$ref'")
                        ->execute();

                Yii::$app->db->createCommand()
                        ->update("customer", array("transport" => 0), "ref = '$ref'")
                        ->execute();
            }

            /*
              if ($model->setup == "1") {
              $this->SendSetup($model->ref);
              } else {
              Yii::$app->db->createCommand()
              ->delete("queue", "ref = '$ref'")
              ->execute();

              Yii::$app->db->createCommand()
              ->update("customer", array("setup" => 0), "ref = '$ref'")
              ->execute();
              }
             */

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
        $filePath = Customer::getUploadUrl() . $model->ref . '/' . $model->real_filename;
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

    private function SendAccount($ref) {
        $res = \app\models\Account::findOne(['ref' => $ref]);
        if (!isset($res['ref'])) {
            $columns = array(
                "ref" => $ref
            );
            \Yii::$app->db->createCommand()
                    ->insert("account", $columns)
                    ->execute();
        }
    }

    private function SendTransport($ref) {
        //???????????????????????????????????????
        Yii::$app->db->createCommand()
                ->delete("transport", "ref = '$ref' ")
                ->execute();

        $res = \app\models\Transport::findOne(['ref' => $ref]);
        if (!isset($res['ref'])) {
            $columns = array(
                "ref" => $ref
            );
            \Yii::$app->db->createCommand()
                    ->insert("transport", $columns)
                    ->execute();
        }
    }

    private function SendSetup($ref) {
        Yii::$app->db->createCommand()
                ->delete("queue", "ref = '$ref' ")
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
        }
    }

    private function sendDepartment($dep, $ref) {

        if (in_array("3", $dep)) {//??????????????????????????????
            $res = \app\models\Graphic::findOne(['ref' => $ref]);
            if (!isset($res['ref'])) {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("graphic", $columns)
                        ->execute();
            }
        }

        if (in_array("5", $dep)) { //????????????????????????
            //Update customer
            \Yii::$app->db->createCommand()
                    ->update("customer", array("print_status" => '1'), "ref = '$ref'")
                    ->execute();

            $res = \app\models\Branchprint::findOne(['ref' => $ref]);
            if (!isset($res['ref'])) {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("branchprint", $columns)
                        ->execute();
            }
        }

        if (in_array("6", $dep)) {//cnc
            //Update customer
            \Yii::$app->db->createCommand()
                    ->update("customer", array("cnc_status" => '1'), "ref = '$ref'")
                    ->execute();
            $res = \app\models\Branchlaser::findOne(['ref' => $ref]);
            if (!isset($res['ref'])) {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("branchlaser", $columns)
                        ->execute();
            }
        }

        if (in_array("7", $dep)) {//??????????????????????????????
            //Update customer
            \Yii::$app->db->createCommand()
                    ->update("customer", array("manufacture_status" => '1'), "ref = '$ref'")
                    ->execute();
            $res = \app\models\Branchfacture::findOne(['ref' => $ref]);
            if (!isset($res['ref'])) {
                $columns = array(
                    "ref" => $ref
                );
                \Yii::$app->db->createCommand()
                        ->insert("branchfacture", $columns)
                        ->execute();
            }
        }

        if (in_array("8", $dep)) {//????????????
            //??????????????????????????????????????????
            \Yii::$app->db->createCommand()
                    ->update("customer", array("setup" => '1'), "ref = '$ref'")
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
                    "flag" => '2',
                    "mascancel" => $typecancel,
                    "canceletc" => $typeetc
                        ), "ref = '$ref'")
                ->execute();

        //Update Account
        Yii::$app->db->createCommand()
                ->update("account", array("status" => '2'), "ref = '$ref'")
                ->execute();

        //Update Graphic
        Yii::$app->db->createCommand()
                ->update("graphic", array("status" => '2'), "ref = '$ref'")
                ->execute();

        //Update BranchPrint
        Yii::$app->db->createCommand()
                ->update("branchprint", array("status" => '2'), "ref = '$ref'")
                ->execute();

        //Update branchlaser
        Yii::$app->db->createCommand()
                ->update("branchlaser", array("status" => '2'), "ref = '$ref'")
                ->execute();

        //Update branchfacture
        Yii::$app->db->createCommand()
                ->update("branchfacture", array("status" => '2'), "ref = '$ref'")
                ->execute();

        //Update branchtechnician
        Yii::$app->db->createCommand()
                ->update("branchtechnician", array("status" => '2'), "ref = '$ref'")
                ->execute();

        //????????????????????????????????????????????????
        Yii::$app->db->createCommand()
                ->delete("queue", "ref = '$ref'")
                ->execute();
        //Time Line
        $culumns = array(
            "department" => '1',
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "???????????????????????????",
            "flag" => '2',
            "todep" => "???????????????????????????",
            "d_update" => date("Y-m-d H:i:s")
        );
        $rs = \Yii::$app->db->createCommand()
                ->insert("timeline", $culumns)
                ->execute();
        if ($rs) {
            echo 1;
        }
    }

    public function actionSearchjob() {
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Customer();
        $dataList = $Model->searchJob($customer, $project);
        return $this->renderPartial('searchjob', [
                    'dataList' => $dataList
        ]);
    }

    public function actionAll($type = "1") {
        if ($type == "1") {
            $txt = "??????????????????????????????????????????";
        } else if ($type == "2") {
            $txt = "??????????????????";
        } else if ($type == "3") {
            $txt = "??????????????????";
        } else {
            $txt = "????????????????????????";
        }
        $ModelCustomer = new Customer();
        $dataList = $ModelCustomer->getJobAll($type);

        return $this->render('viewall', [
                    'dataList' => $dataList,
                    'statushead' => $txt,
        ]);
    }

    public function actionExport() {
        $ModelCustomer = new Customer();
        $dataList = $ModelCustomer->getJobAll();
        return $this->renderPartial('export', [
                    'dataList' => $dataList
        ]);
    }

    //Approve Function ####################
    public function actionApprove() {
        return $this->render('approve');
    }

    public function actionApproveload() {
        $type = Yii::$app->request->post('type');
        if ($type == 1) {
            $order = "order by level desc";
        } else if ($type == 2) {
            $order = "order by date_getjob asc";
        } else {
            $order = "order by create_date desc";
        }

        $sql = "select * from customer where approve = '0' and flag = '0' and transport = '0' $order";
        $data['dataList'] = \Yii::$app->db->createCommand($sql)->queryAll();
        //$data['dataList'] = Customer::find()->where(['approve' => '0'])->andWhere(['flag' => '0'])->andWhere(['transport' => '0'])->all();
        return $this->renderPartial('approveload', $data);
    }

    public function actionApproveconfirm() {
        $ref = Yii::$app->request->post('ref');
        $user = Yii::$app->user->identity->id;

        $columns = array(
            "userapprove" => $user,
            "approve" => '1'
        );

        $rs = \Yii::$app->db->createCommand()
                ->update("customer", $columns, "ref = '$ref'")
                ->execute();

        $culumnsTimeline = array(
            "department" => '12',
            "ref" => $ref,
            "user_id" => Yii::$app->user->identity->id,
            "log" => "?????????????????????????????????????????????",
            "todep" => "?????????????????????????????????????????????",
            "d_update" => date("Y-m-d H:i:s")
        );
        \Yii::$app->db->createCommand()
                ->insert("timeline", $culumnsTimeline)
                ->execute();
        if ($rs) {
            return 1;
        } else {
            return 0;
        }
    }

    public function actionGetqueue() {
        $model = new Customer();
        $datesend = Yii::$app->request->post('datesend');
        $data['jobToday'] = $model->getJobToDay($datesend);
        $data['jobTomorow'] = $model->getJobTomorow($datesend);
        $data['datetomorow'] = $model->getTomorow($datesend);
        $data['dateselect'] = $datesend;
        return $this->renderPartial('queue', $data);
    }

    public function actionSearchapprove() {
        $customer = Yii::$app->request->post('customer');
        $project = Yii::$app->request->post('project');
        $Model = new Customer();
        $dataList = $Model->searchApprove($customer, $project);
        return $this->renderPartial('searchapprove', [
                    'dataList' => $dataList
        ]);
    }

}
