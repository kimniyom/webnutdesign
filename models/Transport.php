<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "transport".
 *
 * @property int $id
 * @property string|null $ref รหัสอ้างอิง
 * @property int|null $user_id ผู้รับงาน
 * @property int|null $status สถานะ 1 ยังไม่รับงาน 2 จัดส่งแล้ว 3  สินค้าถึงลูกค้า
 * @property int|null $flag 0 = NoApprove 1 = Approve 2 =  Cancel
 * @property string|null $create_date
 * @property string|null $confirm_date
 * @property string|null $address ที่อยู่จัดส่ง
 * @property resource|null $tagnumber เลขติดตามสินค้า
 */
class Transport extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'transport';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'status', 'flag'], 'integer'],
            [['create_date', 'confirm_date'], 'safe'],
            [['address'], 'string'],
            [['ref'], 'string', 'max' => 50],
            [['tagnumber'], 'string', 'max' => 100],
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
            'status' => 'สถานะ 1 ยังไม่รับงาน 2 จัดส่งแล้ว 3  สินค้าถึงลูกค้า',
            'flag' => '0 = NoApprove 1 = Approve 2 =  Cancel',
            'create_date' => 'Create Date',
            'confirm_date' => 'Confirm Date',
            'address' => 'ที่อยู่จัดส่ง',
            'tagnumber' => 'เลขติดตามสินค้า',
        ];
    }
}
