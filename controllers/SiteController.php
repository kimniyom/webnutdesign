<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Url;
use yii\helpers\Html;
use yii\helpers\BaseFileHelper;
use yii\helpers\Json;
use yii\helpers\ArrayHelper;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Customer;
use app\models\CustomerSearch;
use app\models\Uploads;
use yii\web\UploadedFile;
use app\models\Account;
use app\models\Graphic;

class SiteController extends Controller {
    /**
     * {@inheritdoc}
     */
    //public function behaviors()
    //{
    /*
      return [
      'access' => [
      'class' => AccessControl::className(),
      'only' => ['logout'],
      'rules' => [
      [
      'actions' => ['logout'],
      'allow' => true,
      'roles' => ['@'],
      ],
      ],
      ],
      'verbs' => [
      'class' => VerbFilter::className(),
      'actions' => [
      'logout' => ['post'],
      ],
      ],
      ];
     */
    //}

    /**
     * {@inheritdoc}
     */
    public function actions() {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex() {
        if (!Yii::$app->user->isGuest) {
            $userId = Yii::$app->user->identity->id;
            $sql = "select * from pagesetting where user_id = '$userId' ";
            $rs = Yii::$app->db->createCommand($sql)->queryOne();
            if ($rs) {
                $page = $rs['controller'];
                //return $this->render($page);
                $this->redirect([$page], 302);
            } else {
                //return $this->render('site/setting');
                $this->redirect(['/site/setting'], 302);
                //exit(0);
            }
        } else {
            return $this->render('index');
        }
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin() {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
                    'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout() {
        //Yii::$app->user->logout();
        if (!Yii::$app->user->isGuest)
        //Yii::app()->session->destroy();
            Yii::$app->user->logout(true);
        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact() {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
                    'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout() {
        return $this->render('about');
    }

    public function actionView() {
        $ref = \Yii::$app->request->post('ref');

        $model = Customer::findOne(['ref' => $ref]);
        $file = $this->getFile($model['ref']);
        $timeline = $this->getTimeline($model['ref']);
        //Account
        $account = Account::findOne(['ref' => $ref]);
        //กราฟฟิก
        $graphic = Graphic::findOne(['ref' => $ref]);
        if (isset($graphic['ref_graphic'])) {
            $fileGraphic = $this->getImgGraphic($graphic['ref_graphic']);
        } else {
            $fileGraphic = $this->getImgGraphic("");
        }

        return $this->renderPartial('view', [
                    'model' => $model,
                    'filelist' => $file,
                    'timeline' => $timeline,
                    'account' => $account,
                    'graphic' => $graphic,
                    'filegraphic' => $fileGraphic
        ]);
        //return $this->renderPartial("views");
    }

    public function actionViewmini() {
        $ref = \Yii::$app->request->post('ref');

        $model = Customer::findOne(['ref' => $ref]);
        $file = $this->getFile($model['ref']);
        //กราฟฟิก
        $graphic = Graphic::findOne(['ref' => $ref]);
        $fileGraphic = $this->getImgGraphic($graphic['ref_graphic']);
        return $this->renderPartial('viewmini', [
                    'model' => $model,
                    'filelist' => $file,
                    'graphic' => $graphic,
                    'filegraphic' => $fileGraphic
        ]);
        //return $this->renderPartial("views");
    }

    public function actionViewmobile() {
        $ref = \Yii::$app->request->post('ref');
        $model = Customer::findOne(['ref' => $ref]);
        $file = $this->getFile($model['ref']);
        //กราฟฟิก
        $graphic = Graphic::findOne(['ref' => $ref]);
        $fileGraphic = $this->getImgGraphic($graphic['ref_graphic']);
        return $this->renderPartial('viewmobile', [
                    'model' => $model,
                    'filelist' => $file,
                    'graphic' => $graphic,
                    'filegraphic' => $fileGraphic
        ]);
        //return $this->renderPartial("views");
    }

    public function actionSetting() {
        $userId = Yii::$app->user->identity->id;
        $sql = "SELECT d.id,d.department,d.url
                    FROM rule r INNER JOIN department d On r.department_id = d.id
                    WHERE d.active = '1' AND r.user_id = '$userId' ";
        $data['privilege'] = Yii::$app->db->createCommand($sql)->queryAll();
        $data['activepage'] = $this->activePage();
        $data['profile'] = $this->getProfile();
        return $this->render("setting", $data);
    }

    function activePage() {
        $userId = Yii::$app->user->identity->id;
        $sql = "select * from pagesetting where user_id = '$userId' ";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        if ($rs) {
            return $rs['department'];
        } else {
            return 0;
        }
    }

    function getProfile() {
        $userId = Yii::$app->user->identity->id;
        $sql = "SELECT p.*,d.department AS departmentname
                    FROM `profile` p LEFT JOIN department d ON p.department = d.id
                    WHERE p.user_id = '$userId' ";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs;
    }

    function getFile($ref) {
        $sql = "select * from uploads where ref = '$ref' and typefile = '2'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getImgGraphic($ref) {
        $sql = "select * from uploads where ref = '$ref' and typefile = '1'";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getTimeline($ref) {
        $sql = "SELECT t.*,d.department AS curdep,p.`name`
        FROM timeline t INNER JOIN department d ON t.department = d.id
        INNER JOIN `profile` p ON t.user_id = p.user_id
        WHERE t.ref = '$ref'
        ORDER BY t.d_update DESC";
        return \Yii::$app->db->createCommand($sql)->queryAll();
    }

    function actionSetmenu() {
        $menuId = \Yii::$app->request->post('menuId');
        Yii::$app->session->set("menu", $menuId);
    }

    public function actionSetpage() {
        $userId = Yii::$app->user->identity->id;
        $id = \Yii::$app->request->post('id');
        $url = \Yii::$app->request->post('link');
        Yii::$app->db->createCommand()
                ->delete("pagesetting", "user_id = '$userId'")
                ->execute();

        $columns = array(
            "department" => $id,
            "controller" => $url,
            "user_id" => $userId
        );
        Yii::$app->db->createCommand()
                ->insert("pagesetting", $columns)
                ->execute();
    }

}
