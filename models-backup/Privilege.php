<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "privilege".
 *
 * @property int $id
 * @property int|null $user_id
 * @property int|null $edit_project แก้ไขรายละเอียดงาน 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์
 * @property int|null $notify_customer แจ้งงานลูกค้าทราบ 0 = ไม่มีสิทิ์ 1 = มีสิทธิ์
 * @property int|null $edit_tranfer ข้อมูลการจัดส่ง 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์
 * @property int|null $approve สิทธิ์ยืนยันงาน 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์
 */
class Privilege extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'privilege';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'edit_project', 'notify_customer', 'edit_tranfer', 'approve','queue'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'edit_project' => 'Edit Project',
            'notify_customer' => 'Notify Customer',
            'edit_tranfer' => 'Edit Tranfer',
            'approve' => 'Approve',
            'queue' => 'queue'
        ];
    }
}
