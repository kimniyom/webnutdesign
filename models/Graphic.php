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
class Graphic extends \yii\db\ActiveRecord
{
    const UPLOAD_FOLDER = 'photolibrarys';
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'graphic';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['customer_id', 'user_id', 'last_dep', 'status', 'approve'], 'integer'],
            [['detail'], 'string'],
            [['create_date', 'update_date'], 'safe'],
            [['ref'], 'string', 'max' => 50],
            [['link'], 'string', 'max' => 255],
            [['ref_graphic'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ref' => 'ref อ้างอิงลูกค้า',
            'customer_id' => 'รหัสลูกค้า',
            'detail' => 'รายละเอียดข้อมูลใบสั่งงาน',
            'link' => 'ลิงค์แนบไฟล์ตัวอย่างงาน / แบบงาน',
            'ref_graphic' => 'รหัสอ้างอิงอัพโหลดไฟล์ตัวอย่างงาน / แบบงาน',
            'user_id' => 'ผู้บันทึกงาน',
            'last_dep' => 'แผนกที่ส่งมา',
            'status' => '0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก',
            'approve' => '0 = งานยังไม่approve 1 = งาน approve แล้ว',
            'create_date' => 'วันที่รับบงาน',
            'update_date' => 'วันที่แก้ไขล่าสุด',
            'flagsend' => 'การส่งต่อแผนกอื่น'
        ];
    }

    function getJob() {
        $status = Yii::$app->user->identity->status;
        $user_id = Yii::$app->user->identity->id;
        if ($status == "A" || $status == "M") {
            $sql = "select c.* from graphic g INNER JOIN customer c ON g.ref = c.ref 
                    where g.approve = '0' and g.`flagsend` = '0' and status != 2";
        } else {
            $sql = "select c.* from graphic g INNER JOIN customer c ON g.ref = c.ref 
                    where g.approve = '0' and g.`flagsend` = '0' and status != 2";
        }

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
                'src' => self::getUploadUrl(true) . $ref . '/thumbnail/' . $file->real_filename,
                'options' => ['title' => $event_name]
            ];
        }
        return $preview;
    }
}
