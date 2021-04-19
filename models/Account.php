<?php

namespace app\models;

use Yii;
use \yii\web\UploadedFile;
/**
 * This is the model class for table "account".
 *
 * @property int $id
 * @property int|null $customer_id รหัสลูกค้า
 * @property string|null $link ลิงแนบใบเสนอราคา
 * @property string|null $ref_account รหัสอ้างอิงอัพโหลดไฟล์
 * @property int|null $user_id ผู้บันทึกงาน
 * @property int|null $last_dep แผนกที่ส่งมา
 * @property int|null $status 0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก
 * @property int|null $approve 0 = งานยังไม่approve 1 = งาน approve แล้ว
 * @property string|null $create_date วันที่รับบงาน
 * @property string|null $update_date วันที่แก้ไขล่าสุด
 */
class Account extends \yii\db\ActiveRecord {
    public $upload_foler ='uploads/account';
    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'account';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['customer_id', 'user_id', 'last_dep', 'status', 'approve'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['detail', 'ref'], 'string'],
            [['link'], 'string', 'max' => 255],
            [['ref_account'], 'string', 'max' => 100],
            [['file'], 'file',
              'skipOnEmpty' => true,
              'extensions' => 'pdf,doc,docx'
            ],
            
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'customer_id' => 'รหัสลูกค้า',
            'link' => 'ลิงค์แนบใบเสนอราคา',
            'ref_account' => 'รหัสอ้างอิงอัพโหลดไฟล์',
            'user_id' => 'ผู้บันทึกงาน',
            'last_dep' => 'แผนกที่ส่งมา',
            'status' => '0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก',
            'approve' => '0 = งานยังไม่approve 1 = งาน approve แล้ว',
            'create_date' => 'วันที่รับบงาน',
            'update_date' => 'วันที่แก้ไขล่าสุด',
            'detail' => 'อื่น ๆ',
            'file' => 'แนบใบเสนอราคา',
        ];
    }

    public function upload($model,$attribute)
    {
        $file  = UploadedFile::getInstance($model, $attribute);
          $path = $this->getUploadPath();
        if ($this->validate() && $file !== null) {

            $fileName = md5($file->baseName.time()) . '.' . $file->extension;
            //$fileName = $photo->baseName . '.' . $photo->extension;
            if($file->saveAs($path.$fileName)){
              return $fileName;
            }
        }
        return $model->isNewRecord ? false : $model->getOldAttribute($attribute);
    }

    public function getUploadPath(){
      return Yii::getAlias('@webroot').'/'.$this->upload_foler.'/';
    }

    public function getUploadUrl(){
      return Yii::getAlias('@web').'/'.$this->upload_foler.'/';
    }

    public function getPhotoViewer(){
      return empty($this->file) ? Yii::getAlias('@web').'/images/none.png' : $this->getUploadUrl().$this->file;
    }
    }
