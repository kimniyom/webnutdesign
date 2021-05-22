<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Dashboard;
use app\models\Customer;

class DashboardController extends Controller {
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
        $model = new Dashboard();
        $reschartMonth = $model->chartMonth();
        $label = array();
        $value = array();
        foreach ($reschartMonth as $rs):
            //echo $rs['DAY'];
            array_push($label, $rs['DAY']);
            array_push($value, $rs['total']);
        endforeach;
        $data['label'] = implode(",", $label);
        $data['value'] = implode(",", $value);

        $data['listCategory'] = $model->countCustotmerCat();
        //echo $data['label'];
        return $this->render('index', $data);
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

    public function actionSearchjob() {
        $project = Yii::$app->request->post('project');
        $Model = new Dashboard();
        $dataList = $Model->searchJob($project);
        return $this->renderPartial('job', [
                    'dataList' => $dataList
        ]);
    }

    public function actionGetqueue() {
        $model = new Customer();
        $datesend = date("Y-m-d");
        $data['jobToday'] = $model->getJobToDay($datesend);
        $data['jobBeforday'] = $model->getJobBeforDay($datesend);
        $data['jobTomorow'] = $model->getJobTomorow($datesend);
        $data['datetomorow'] = $model->getTomorow($datesend);
        $data['dateselect'] = $datesend;
        return $this->renderPartial('queue', $data);
    }

}
