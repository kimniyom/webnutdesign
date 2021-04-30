<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "branchmarketing".
 *
 * @property int $id
 * @property string|null $ref รหัสอ้างอิง
 * @property int|null $user_id ผู้รับงาน
 * @property int|null $status สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว
 * @property int|null $flag 0 = NoApprove 1 = Approve 2 =  Cancel
 * @property string|null $create_date
 * @property string|null $confirm_date
 */
class Branchmarketing extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'branchmarketing';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'status', 'flag'], 'integer'],
            [['create_date', 'confirm_date'], 'safe'],
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
            'user_id' => 'ผู้รับงาน',
            'status' => 'สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว',
            'flag' => '0 = NoApprove 1 = Approve 2 =  Cancel',
            'create_date' => 'Create Date',
            'confirm_date' => 'Confirm Date',
        ];
    }
}
