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
            [['project_name', 'customer', 'channel', 'date_getjob', 'time_getjob', 'channel_etc', 'cur_dep', 'transport', 'setup', 'fast'], 'required'],
            [['channel', 'typework', 'last_dep', 'user_id', 'transport', 'setup', 'fast'], 'integer'],
            [['detail'], 'string'],
            [['cur_dep'], 'safe'],
            [['date_getjob', 'time_getjob', 'create_date'], 'safe'],
            [['project_name', 'channel_etc', 'address', 'ref'], 'string', 'max' => 255],
            [['customer', 'tel'], 'string', 'max' => 100]
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
            'channel_etc' => 'อื่น ๆ ระบุ เช่น line Id',
            'address' => 'ที่อยู่',
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
            'fast' => 'ความเร่งด่วน',
        ];
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
