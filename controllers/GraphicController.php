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
class GraphicController extends Controller
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
     * Lists all Graphic models.
     * @return mixed
     */
    public function actionIndex()
    {
        $ModelGraphic = new Graphic();
        $searchModel = new GraphicSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataList = $ModelGraphic->getJob();
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'dataList' => $dataList
        ]);
    }

    /**
     * Displays a single Graphic model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ref)
    {
        return $this->render('view', [
            'model' => $this->findModel($ref),
        ]);
    }

    /**
     * Creates a new Graphic model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
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
    public function actionUpdate($ref)
    {
        $model = $this->findModel($ref);
        
        if ($model->load(Yii::$app->request->post())) {
            $this->Uploads(false, $model->ref_graphic);
            $model->user_id = Yii::$app->user->identity->id;
            //$model->cur_dep = implode(", ", $model->cur_dep);
            $model->create_date = date("Y-m-d H:i:s");
            $model->status = 1;//รับงาน
            $model->save();

            //Time Line
            $culumns = array(
                    "department" => 3,
                    "ref" => $model->ref,
                    "user_id" => Yii::$app->user->identity->id,
                    "log" => "กราฟิกรับงาน",
                    "todep" => "กราฟิก(รับงาน)",
                    "d_update" => date("Y-m-d H:i:s")
                );
                \Yii::$app->db->createCommand()
                        ->insert("timeline", $culumns)
                        ->execute();

            return $this->redirect(['view', 'ref' => $model->ref]);
        } else {
            if($model->ref_graphic == ""){
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
    public function actionDelete($id)
    {
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
    protected function findModel($ref)
    {
        if (($model = Graphic::findOne(['ref' => $ref])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionGetjob(){
        $ModelGraphic = new Graphic();
        $dataList = $ModelGraphic->getJob();
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
        $filePath = Graphic::getUploadUrl() . $model->ref . '/thumbnail/' . $model->real_filename;
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

}
