<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "timeline".
 *
 * @property int $id
 * @property int|null $customer_id รหัสลูกค้า
 * @property string|null $ref รหัสใช้อ้างอิง
 * @property int|null $department แผนกที่บันทึก
 * @property int|null $user_id รหัสผู้บันทึกข้อมูล
 * @property string|null $log รายละเอียด
 * @property string|null $d_update วันที่บันทึกข้อมูล
 * @property string|null $todep แผนกที่ส่งไป
 */
class Timeline extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'timeline';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['customer_id', 'department', 'user_id'], 'integer'],
            [['d_update'], 'safe'],
            [['ref'], 'string', 'max' => 100],
            [['log'], 'string', 'max' => 255],
            [['todep'], 'string', 'max' => 2555],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'customer_id' => 'รหัสลูกค้า',
            'ref' => 'รหัสใช้อ้างอิง',
            'department' => 'แผนกที่บันทึก',
            'user_id' => 'รหัสผู้บันทึกข้อมูล',
            'log' => 'รายละเอียด',
            'd_update' => 'วันที่บันทึกข้อมูล',
            'todep' => 'แผนกที่ส่งไป',
        ];
    }

    function getLastTimeline($ref){
        $sql = "select todep from timeline where ref = '$ref' order by d_update desc limit 1";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        $lastDep = "";
        if($rs['todep']){
            $lastDep = "<b>แผนก: </b>".$rs['todep'];
        } else {
            $lastDep = "<i class='fa fa-info text-warning'></i> ยังไม่มีการยืนยัน";
        }
        return $lastDep;
    }
}
