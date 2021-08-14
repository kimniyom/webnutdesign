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
use app\models\ConfigWeb;

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
    public function actionIndex($month = "", $filter = "") {
        if ($month == "") {
            $Month = date("m");
            if (strlen($Month) < 2) {
                $m = "0" . $Month;
            } else {
                $m = $Month;
            }
        } else {
            $m = $month;
        }
        $model = new Dashboard();
        $reschartMonth = $model->chartMonth($m);
        $sunproject = 0;
        $label = array();
        $value = array();
        foreach ($reschartMonth as $rs):
//echo $rs['DAY'];
            array_push($label, $rs['DAY']);
            array_push($value, $rs['total']);
            $sunproject = $sunproject + $rs['total'];
        endforeach;
        $data['label'] = implode(",", $label);
        $data['value'] = implode(",", $value);
        $data['month'] = $m;
        $data['listCategory'] = $model->countCustotmerCat();
        $data['chartColumn'] = $model->chartColumn();
        $data['total'] = $sunproject;
//echo $data['label'];
        $data['filter'] = $filter;

        if ($filter == "yearnow" || $filter == "oldyear" || $filter == "") {
            if ($filter == "") {
                $reschart = $this->reportFilterYrae("yearnow");
            } else {
                $reschart = $this->reportFilterYrae($filter);
            }

            $data['chartTypeCategory'] = "'" . implode("','", $reschart[0]) . "'";
            $data['chartTypeVal'] = implode(",", $reschart[1]);
            $data['sumfilter'] = $reschart[2];
        } else {
            $reschart = $this->reportFilterMonth($filter);
            $data['chartTypeCategory'] = "'" . implode("','", $reschart[0]) . "'";
            $data['chartTypeVal'] = implode(",", $reschart[1]);
            $data['sumfilter'] = $reschart[2];
        }
        return $this->render('index', $data);
    }

    function reportFilterYrae($type) {
        $yearNow = date("Y");
        $sum = 0;
        $config = new ConfigWeb();
        if ($type == "yearnow") {
            $month1 = $this->countProject($yearNow, "01");
            $month2 = $this->countProject($yearNow, "02");
            $month3 = $this->countProject($yearNow, "03");
            $month4 = $this->countProject($yearNow, "04");
            $month5 = $this->countProject($yearNow, "05");
            $month6 = $this->countProject($yearNow, "06");
            $month7 = $this->countProject($yearNow, "07");
            $month8 = $this->countProject($yearNow, "08");
            $month9 = $this->countProject($yearNow, "09");
            $month10 = $this->countProject($yearNow, "10");
            $month11 = $this->countProject($yearNow, "11");
            $month12 = $this->countProject($yearNow, "12");
        } else {
            $yearOld = ($yearNow - 1);
            $month1 = $this->countProject($yearOld, "01");
            $month2 = $this->countProject($yearOld, "02");
            $month3 = $this->countProject($yearOld, "03");
            $month4 = $this->countProject($yearOld, "04");
            $month5 = $this->countProject($yearOld, "05");
            $month6 = $this->countProject($yearOld, "06");
            $month7 = $this->countProject($yearOld, "07");
            $month8 = $this->countProject($yearOld, "08");
            $month9 = $this->countProject($yearOld, "09");
            $month10 = $this->countProject($yearOld, "10");
            $month11 = $this->countProject($yearOld, "11");
            $month12 = $this->countProject($yearOld, "12");
        }
        $category = $config->month_full();
        $value = array($month1, $month2, $month3, $month4, $month5, $month6, $month7, $month8, $month9, $month10, $month11, $month12);
        $sum = $month1 + $month2 + $month3 + $month4 + $month5 + $month6 + $month7 + $month8 + $month9 + $month10 + $month11 + $month12;
        return array($category, $value, $sum);
    }

    function reportFilterMonth($type) {
        $config = new ConfigWeb();
        $monthFull = $config->month_full();
        $sum = 0;
        $m1 = $this->getLastYear(1);
        $m2 = $this->getLastYear(2);
        $m3 = $this->getLastYear(3);
        $m4 = $this->getLastYear(4);
        $m5 = $this->getLastYear(5);
        $m6 = $this->getLastYear(6);
        $month1 = $this->countProjectLastmonth($m1);
        $month2 = $this->countProjectLastmonth($m2);
        $month3 = $this->countProjectLastmonth($m3);
        $month4 = $this->countProjectLastmonth($m4);
        $month5 = $this->countProjectLastmonth($m5);
        $month6 = $this->countProjectLastmonth($m6);

        $monthName1 = $monthFull[(int) substr($m1, -2) - 1] . " " . substr($m1, 0, 4);
        $monthName2 = $monthFull[(int) substr($m2, -2) - 1] . " " . substr($m2, 0, 4);
        $monthName3 = $monthFull[(int) substr($m3, -2) - 1] . " " . substr($m3, 0, 4);
        $monthName4 = $monthFull[(int) substr($m4, -2) - 1] . " " . substr($m4, 0, 4);
        $monthName5 = $monthFull[(int) substr($m5, -2) - 1] . " " . substr($m5, 0, 4);
        $monthName6 = $monthFull[(int) substr($m6, -2) - 1] . " " . substr($m6, 0, 4);
        //หาชื่อเดือน

        if ($type == "3month") {
            $category = array($monthName3, $monthName2, $monthName1);
            $value = array($month3, $month2, $month1);
            $sum = $month3 + $month2 + $month1;
        } else {
            $category = array($monthName6, $monthName5, $monthName4, $monthName3, $monthName2, $monthName1);
            $value = array($month6, $month5, $month4, $month3, $month2, $month1);
            $sum = $month6 + $month5 + $month4 + $month3 + $month2 + $month1;
        }

        return array($category, $value, $sum);
    }

    function getLastYear($intMonth) {
        $sql = "SELECT LEFT(DATE_ADD(NOW(), INTERVAL -$intMonth MONTH),7) AS month";
        $res = \Yii::$app->db->createCommand($sql)->queryOne();
        return $res['month'];
    }

    function countProject($year, $month) {
        $sql = "SELECT SUBSTRING(create_date,6,2) AS month,count(*) AS total
                FROM customer
                WHERE LEFT(create_date,4) = '$year'
                AND  SUBSTRING(create_date,6,2) = '$month' ";
        $res = \Yii::$app->db->createCommand($sql)->queryOne();
        return $res['total'];
    }

    function countProjectLastmonth($month) {
        $sql = "SELECT SUBSTRING(create_date,6,2) AS month,count(*) AS total
                FROM customer
                WHERE LEFT(create_date,7) = '$month'";
        $res = \Yii::$app->db->createCommand($sql)->queryOne();
        return $res['total'];
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

    public function actionLastjob() {
        $Model = new Dashboard();
        $dataList = $Model->LastJob();
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
