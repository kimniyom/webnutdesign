<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "queue".
 *
 * @property int $id
 * @property string|null $ref รหัสอ้างอิง
 * @property int|null $uset_id คนรับงาน
 * @property string|null $queuedate วันที่ติดตั้ง
 * @property string|null $timesetup เวลาเเข้าติดตั้ง
 * @property int|null $approve สถานะติดตั้งรับงาน 0 = ยังไม่ลงติดตั้ง 1 = ลงรับงาน 2 = ติดตั้งแล้ว
 * @property int|null $confirm 0 = ยังไม่ลงคิวงาน 1 = ลงคิวงานติดตั้งแล้ว
 * @property string|null $dupdate วันที่บันทึกข้อมูล
 */
class Queue extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'queue';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['uset_id', 'approve', 'confirm','usersetup'], 'integer'],
            [['queuedate', 'timesetup', 'dupdate'], 'safe'],
            [['ref'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ref' => 'รหัสอ้างอิง',
            'uset_id' => 'คนรับงาน',
            'queuedate' => 'วันที่ติดตั้ง',
            'timesetup' => 'เวลาเเข้าติดตั้ง',
            'approve' => 'สถานะติดตั้งรับงาน 0 = ยังไม่ลงติดตั้ง 1 = ลงรับงาน 2 = ติดตั้งแล้ว',
            'confirm' => '0 = ยังไม่ลงคิวงาน 1 = ลงคิวงานติดตั้งแล้ว',
            'dupdate' => 'วันที่บันทึกข้อมูล',
            'usersetup' => 'ช่างติดตั้ง',
        ];
    }
}
