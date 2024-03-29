<?php

namespace app\models;

use Yii;
use yii\helpers\Url;

/**
 * This is the model class for table "graphic".
 *
 * @property int $id
 * @property string|null $ref ref อ้างอิงลูกค้า
 * @property int|null $customer_id รหัสลูกค้า
 * @property string|null $detail รายละเอียดข้อมูลใบสั่งงาน
 * @property string|null $link ลิงแนบไฟล์ตัวอย่างงาน / แบบงาน
 * @property string|null $ref_graphic รหัสอ้างอิงอัพโหลดไฟล์ตัวอย่างงาน / แบบงาน
 * @property int|null $user_id ผู้บันทึกงาน
 * @property int|null $last_dep แผนกที่ส่งมา
 * @property int|null $status 0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก
 * @property int|null $approve 0 = งานยังไม่approve 1 = งาน approve แล้ว
 * @property string|null $create_date วันที่รับบงาน
 * @property string|null $update_date วันที่แก้ไขล่าสุด
 */
class Graphic extends \yii\db\ActiveRecord {

    const UPLOAD_FOLDER = 'photolibrarys';

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'graphic';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['flagsend'], 'required'],
            [['customer_id', 'user_id', 'last_dep', 'status', 'approve', 'flagsend'], 'integer'],
            [['detail'], 'string'],
            [['create_date', 'update_date'], 'safe'],
            [['ref'], 'string', 'max' => 50],
            [['link'], 'string', 'max' => 255],
            [['ref_graphic'], 'string', 'max' => 100],
            ['todep', 'required', 'when' => function ($model) {
                    return $model->flagsend == 2;
                }, 'whenClient' => "function (attribute, value) {
                    var channel = $('input[name=\"Graphic[flagsend]\"]:checked').val();
                    return channel == 2;
                }",
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'ref' => 'ref อ้างอิงลูกค้า',
            'customer_id' => 'รหัสลูกค้า',
            'detail' => 'รายละเอียดข้อมูลใบสั่งงาน',
            'link' => 'ลิงค์แนบไฟล์ตัวอย่างงาน / แบบงาน',
            'ref_graphic' => 'รหัสอ้างอิงอัพโหลดไฟล์ตัวอย่างงาน / แบบงาน',
            'user_id' => 'ผู้บันทึกงาน',
            'last_dep' => 'แผนกที่ส่งมา',
            'status' => '1 = ยังไม่รับงาน 2 = รับงาน 3 = งานถูกยกเลิก',
            'approve' => '0 = งานยังไม่approve 1 = งาน approve แล้ว',
            'create_date' => 'วันที่รับบงาน',
            'update_date' => 'วันที่แก้ไขล่าสุด',
            'flagsend' => 'การส่งต่อแผนกอื่น',
            'todep' => 'ส่งต่อแผนก'
        ];
    }

    function getJob($type) {
        if (!Yii::$app->user->isGuest) {
            $status = Yii::$app->user->identity->status;
            $user_id = Yii::$app->user->identity->id;
        } else {
            $status = "";
            $user_id = "";
        }

        if ($type == 1) {
            $order = "ORDER BY D,H";
        } else if ($type == 2) {
            $order = "ORDER by c.date_getjob asc";
        } else {
            $order = "ORDER by c.create_date desc";
        }

        if ($status == "A" || $status == "M") {
            $sql = "select c.*,g.status,g.approve as approver,
                        TIMESTAMPDIFF(day,CURDATE(),c.date_getjob) AS D,
                        TIMESTAMPDIFF(HOUR,NOW(),CONCAT(c.date_getjob,' ',c.time_getjob)) AS H,
                        TIMESTAMPDIFF(HOUR,c.`create_date`,CONCAT(c.date_getjob,' ',c.time_getjob)) AS INDAY
                    from graphic g INNER JOIN customer c ON g.ref = c.ref
                    where g.approve != '1' and g.status != '2' and c.flag = '0' $order";
        } else {
            $sql = "select c.*,g.status,g.approve as approver,
                        TIMESTAMPDIFF(day,CURDATE(),c.date_getjob) AS D,
                        TIMESTAMPDIFF(HOUR,NOW(),CONCAT(c.date_getjob,' ',c.time_getjob)) AS H,
                        TIMESTAMPDIFF(HOUR,c.`create_date`,CONCAT(c.date_getjob,' ',c.time_getjob)) AS INDAY
                    from graphic g INNER JOIN customer c ON g.ref = c.ref
                    where g.approve != '1' and g.status != '2' and c.flag = '0' $order";
        }

        //echo $sql;
        return Yii::$app->db->createCommand($sql)->queryAll();
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
                'src' => self::getUploadUrl(true) . $ref . '/' . $file->real_filename,
                'options' => ['title' => $event_name]
            ];
        }
        return $preview;
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

        $sql = "select c.*,g.status,g.approve as approver from graphic g INNER JOIN customer c ON g.ref = c.ref WHERE c.flag = '0' $where";

        return Yii::$app->db->createCommand($sql)->queryAll();
        //return $sql;
    }

}
