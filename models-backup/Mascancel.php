<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mascancel".
 *
 * @property int $id
 * @property string|null $name สาเหตุยกเลิกงาน
 */
class Mascancel extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mascancel';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'สาเหตุยกเลิกงาน',
        ];
    }
}
