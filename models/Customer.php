<?php

namespace app\models;

use Yii;

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
class Customer extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['channel', 'typework', 'cur_dep', 'last_dep', 'user_id'], 'integer'],
            [['detail'], 'string'],
            [['date_getjob', 'time_getjob', 'create_date'], 'safe'],
            [['project_name', 'channel_etc', 'address'], 'string', 'max' => 255],
            [['customer', 'tel', 'file'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
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
            'cur_dep' => 'แผนกปัจุบัน',
            'last_dep' => 'แผนกก่อนหน้า',
            'create_date' => 'วันที่บันทึก',
            'user_id' => 'ผู้บันทึกข้อมูล',
        ];
    }
}
