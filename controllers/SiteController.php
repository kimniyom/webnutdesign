<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Url;
use yii\helpers\html;
use yii\helpers\BaseFileHelper;
use yii\helpers\Json;
use yii\helpers\ArrayHelper;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Customer;
use app\models\CustomerSearch;
use app\models\Uploads;
use yii\web\UploadedFile;

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
        return $this->render('index');
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
        return $this->renderPartial('view', [
                    'model' => $model,
                    'filelist' => $file,
                    'timeline' => $timeline
        ]);
        //return $this->renderPartial("views");
    }

    function getFile($ref) {
        $sql = "select * from uploads where ref = '$ref' and typefile = '2'";
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

}
