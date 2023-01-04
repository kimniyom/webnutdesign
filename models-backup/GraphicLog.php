<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "graphic_log".
 *
 * @property int $id
 * @property string|null $ref รหัสอ้างอิงงาน
 * @property int|null $type_edit รายการแก้ไข
 * @property string|null $edit_etc รายละเอียดแก้ไข อื่น ๆ
 * @property int|null $send_dep แผนกที่ส่งมาแก้ไข
 * @property string|null $d_update วันที่บันทึก
 */
class GraphicLog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'graphic_log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type_edit', 'send_dep','flag'], 'integer'],
            [['edit_etc'], 'string'],
            [['d_update'], 'safe'],
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
            'ref' => 'รหัสอ้างอิงงาน',
            'type_edit' => 'รายการแก้ไข',
            'edit_etc' => 'รายละเอียดแก้ไข อื่น ๆ',
            'send_dep' => 'แผนกที่ส่งมาแก้ไข',
            'd_update' => 'วันที่บันทึก',
        ];
    }

    function getFlag($ref){
        $sql = "select count(*) as total from graphic_log where ref='$ref' and flag = 1";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        if($rs['total'] > 0){
            return 1;
        } else {
            return 0;
        }
    }
}
