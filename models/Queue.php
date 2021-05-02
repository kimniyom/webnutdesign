<?php

namespace app\models;

use Yii;
use yii\helpers\Url;

class Queue extends \yii\db\ActiveRecord {

    const UPLOAD_FOLDER = 'photolibrarys';

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'queue';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['queuedate', 'timesetup'], 'required'],
            [['user_id', 'approve', 'confirm', 'usersetup'], 'integer'],
            [['queuedate', 'timesetup', 'dupdate'], 'safe'],
            [['detail'], 'string'],
            [['ref', 'refsetup'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'ref' => 'รหัสอ้างอิง',
            'user_id' => 'คนรับงาน',
            'queuedate' => 'วันที่ติดตั้ง',
            'timesetup' => 'เวลาเเข้าติดตั้ง',
            'approve' => 'สถานะติดตั้งรับงาน 0 = ยังไม่ลงติดตั้ง 1 = ลงรับงาน 2 = ติดตั้งแล้ว',
            'confirm' => '0 = ยังไม่ลงคิวงาน 1 = ลงคิวงานติดตั้งแล้ว',
            'dupdate' => 'วันที่บันทึกข้อมูล',
            'usersetup' => 'ช่างติดตั้ง',
            'detail' => 'ข้อความอื่น ๆ',
            'refsetup' => 'รหัสอ้างอิงการติดตั้ง',
        ];
    }

    function searchJob($customer = "", $project = "") {
        $where = "";
        if ($customer != "" && $project == "") {
            $where .= "AND c.customer LIKE '%" . $customer . "%'";
        } else if ($customer == "" && $project != "") {
            $where .= "AND c.project_name LIKE '%" . $project . "%'";
        } else if ($customer != "" && $project != "") {
            $where .= "AND c.customer LIKE '%" . $customer . "%' AND c.project_name LIKE '%" . $project . "%'";
        }

        $sql = "select g.*,c.customer,c.confirm,c.tel,c.time_getjob,c.date_getjob,c.project_name
                    from queue g INNER JOIN customer c ON g.ref = c.ref WHERE g.`confirm` = '1' AND g.approve = '0' $where";

        return Yii::$app->db->createCommand($sql)->queryAll();
        //return $sql;
    }

    public static function getUploadPath() {
        return Yii::getAlias('@webroot') . '/' . self::UPLOAD_FOLDER . '/';
    }

    public static function getUploadUrl() {
        return Url::base(true) . '/' . self::UPLOAD_FOLDER . '/';
    }

    public function getThumbnails($ref, $event_name) {
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

}
