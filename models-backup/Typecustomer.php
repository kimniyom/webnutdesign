<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "typecustomer".
 *
 * @property int $id
 * @property string|null $typename ประเภทลูกค้า
 */
class Typecustomer extends \yii\db\ActiveRecord {

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'typecustomer';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['typename'], 'required'],
            [['typename'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'typename' => 'ประเภทลูกค้า',
        ];
    }

}
