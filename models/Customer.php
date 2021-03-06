<?php

namespace app\models;

use Yii;
use yii\helpers\Url;

/**
 * This is the model class for table "customer".
 *
 * @property int $id
 * @property string|null $project_name ชื่องาน
 * @property string|null $customer ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง
 * @property string|null $tel เบอร์โทรศัพท์
 * @property int|null $channel ช่องทางที่ลูกค้าติดต่อ
 * @property string|null $channel_etc อื่น ๆ ระบุ เช่น line Id
 * @property string|null $address ที่อยู่
 * @property int|null $typework ประเภทงาน
 * @property string|null $detail รายละเอียดงาน
 * @property string|null $file ไฟล์แนบ
 * @property string|null $date_getjob วันที่รับสินค้า
 * @property string|null $time_getjob เวลาลูกค้ารับสินค้า
 * @property int|null $cur_dep แผนกปัจุบัน
 * @property int|null $last_dep แผนกก่อนหน้า
 * @property string|null $create_date วันที่บันทึก
 * @property int|null $user_id ผู้บันทึกข้อมูล
 */
class Customer extends \yii\db\ActiveRecord {

    const UPLOAD_FOLDER = 'photolibrarys';

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'customer';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['project_name', 'customer', 'channel', 'date_getjob', 'time_getjob', 'transport', 'fast', 'confirm', 'quotation', 'payment', 'typecustomer'], 'required'],
            ['lineid', 'required', 'when' => function ($model) {
                    return $model->channel == 1;
                }, 'whenClient' => "function (attribute, value) {
                return $('#Customer-channel').val() == 1;
            }",
            ],
            ['channel_etc', 'required', 'when' => function ($model) {
                    return $model->channel == 4;
                }, 'whenClient' => "function (attribute, value) {
                return $('#Customer-channel').val() == 4;
            }"
            ],
            [['channel', 'typework', 'last_dep', 'user_id', 'transport', 'setup', 'fast', 'confirm', 'quotation', 'mascancel', 'level', 'payment', 'typecustomer'], 'integer'],
            [['detail'], 'string'],
            [['cur_dep'], 'safe'],
            [['date_getjob', 'time_getjob', 'create_date'], 'safe'],
            [['project_name', 'channel_etc', 'lineid', 'address', 'ref', 'canceletc'], 'string', 'max' => 255],
            [['customer', 'tel'], 'string', 'max' => 100],
                // 'file'
                // 'cur_dep'
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'project_name' => 'ชื่องาน',
            'customer' => 'ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง',
            'tel' => 'เบอร์โทรศัพท์',
            'channel' => 'ช่องทางที่ลูกค้าติดต่อ',
            'lineid' => 'Line ID',
            'channel_etc' => 'อื่น ๆ ระบุ เช่น ฝากช่างมา',
            'address' => 'ที่อยู่ / ข้อมูลการจัดส่ง',
            'typework' => 'ประเภทงาน',
            'detail' => 'รายละเอียดงาน',
            'file' => 'ไฟล์แนบ',
            'date_getjob' => 'วันที่รับสินค้า',
            'time_getjob' => 'เวลาลูกค้ารับสินค้า',
            'cur_dep' => 'ส่งต่อแผนก',
            'last_dep' => 'แผนกก่อนหน้า',
            'create_date' => 'วันที่บันทึก',
            'user_id' => 'ผู้บันทึกข้อมูล',
            'transport' => 'การจัดส่ง',
            'setup' => 'การติดตั้ง',
            'fast' => 'ความสำคัญ',
            'confirm' => 'สถานะการซื้อ',
            'quotation' => 'ใบเสนอราคา',
            'level' => 'ระดับความเร่งด่วน 5 = ด่วนมาก',
            'payment' => 'การชำระเงิน',
            'typecustomer' => 'ประเภทลูกค้า'
        ];
    }

    public static function getUploadPath() {
        return Yii::getAlias('@webroot') . '/' . self::UPLOAD_FOLDER . '/';
    }

    public static function getUploadUrl() {
        return Url::base(true) . '/' . self::UPLOAD_FOLDER . '/';
    }

    public function getThumbnailsOld($ref, $event_name) {
        $uploadFiles = Uploads::find()->where(['ref' => $ref])->all();
        $preview = [];
        foreach ($uploadFiles as $file) {
            $preview[] = [
                'url' => self::getUploadUrl(true) . $ref . '/' . $file->real_filename,
                'src' => self::getUploadUrl(true) . $ref . '/thumbnail/' . $file->real_filename,
                'options' => ['title' => $event_name]
            ];
        }
        return $preview;
    }

    public function getThumbnails($ref, $event_name) {
        $uploadFiles = Uploads::find()->where(['ref' => $ref])->all();
        $preview = [];
        foreach ($uploadFiles as $file) {
            $preview[] = [
                'url' => self::getUploadUrl(true) . $ref . '/' . $file->real_filename,
                'src' => self::getUploadUrl(true) . $ref . '/' . $file->real_filename,
                'options' => ['title' => $event_name]
            ];
        }
        return $preview;
    }

    function getJob($type) {
        if (!Yii::$app->user->isGuest) {
            $status = Yii::$app->user->identity->status;
            $user_id = Yii::$app->user->identity->id;
        } else {
            $status = "";
            $user_id = "";
        }

        if ($type == "1") {
            $order = "order by c.level desc";
        } else if ($type == "2") {
            $order = "order by c.date_getjob asc";
        } else if ($type == "3") {
            $order = "order by c.create_date desc";
        } else {
            $order = "and DATE(c.create_date) = CURDATE() order by c.create_date desc";
        }

        if ($status == "A" || $status == "M") {
            $sql = "select * from customer c where c.flag = '0' AND c.approve = '0' $order";
        } else {
            $sql = "select * from customer c where c.flag = '0' AND c.approve = '0' and user_id = '$user_id' $order";
        }

        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    function searchJob($customer = "", $project = "") {
        $where = "";
        if ($customer != "" && $project == "") {
            $where .= "WHERE c.customer LIKE '%" . $customer . "%'";
        } else if ($customer == "" && $project != "") {
            $where .= "WHERE c.project_name LIKE '%" . $project . "%'";
        } else if ($customer != "" && $project != "") {
            $where .= "WHERE c.customer LIKE '%" . $customer . "%' AND c.project_name LIKE '%" . $project . "%'";
        }

        $sql = "select c.* from customer c $where";

        return Yii::$app->db->createCommand($sql)->queryAll();
        //return $sql;
    }

    function getJobAll($type) {
        if ($type == "1") {
            $sql = "select * from customer WHERE flag = '0' order by flag ASC,create_date DESC";
        } else if ($type == "2") {
            $sql = "select * from customer WHERE flag = '1' order by flag ASC,create_date DESC";
        } else if ($type == "3") {
            $sql = "select * from customer WHERE flag = '2' order by flag ASC,create_date DESC";
        } else {
            $sql = "select * from customer order by flag ASC,create_date DESC";
        }

        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getJobToDay($date) {
        $sql = "SELECT * FROM customer
            WHERE date_getjob = '$date'
            AND flag = '0' AND approve = '0'";
        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getJobBeforDay($date) {
        $sql = "SELECT * FROM customer
            WHERE date_getjob < '$date'
            AND flag = '0' AND approve = '0'";
        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getJobTomorow($date) {
        $sql = "SELECT * FROM customer
            WHERE date_getjob = DATE_ADD('$date', INTERVAL 1 DAY)
            AND flag = '0' AND approve = '0'";
        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getTomorow($date) {
        $sql = "SELECT DATE_ADD('$date', INTERVAL 1 DAY) as tomorow";
        return Yii::$app->db->createCommand($sql)->queryOne()['tomorow'];
    }

    function searchApprove($customer = "", $project = "") {
        $where = "";
        if ($customer != "" && $project == "") {
            $where .= "WHERE c.flag = '0' AND c.transport = '0' AND c.customer LIKE '%" . $customer . "%'";
        } else if ($customer == "" && $project != "") {
            $where .= "WHERE c.flag = '0' AND c.transport = '0' AND c.project_name LIKE '%" . $project . "%'";
        } else if ($customer != "" && $project != "") {
            $where .= "WHERE c.flag = '0' AND c.transport = '0' AND c.customer LIKE '%" . $customer . "%' AND c.project_name LIKE '%" . $project . "%'";
        }

        $sql = "select c.* from customer c $where";

        return Yii::$app->db->createCommand($sql)->queryAll();
        //return $sql;
    }

}
