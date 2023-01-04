<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "customers".
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
 * @property string|null $cur_dep แผนกปัจุบัน
 * @property int|null $last_dep แผนกก่อนหน้า
 * @property string|null $create_date วันที่บันทึก
 * @property int|null $user_id ผู้บันทึกข้อมูล
 * @property string|null $ref
 * @property int|null $transport 0 ไม่จัดส่ง 1 จัดส่ง
 * @property int|null $setup 0 ไม่ติดตั้ง 1 ติดตั้ง
 * @property int|null $fast 0 ทั่วไป 1 เร่งด่วน
 * @property int|null $flag 0 = NoApprove 1 = Approve 2 =  Cancel
 * @property int|null $quotation ใบเสนอราคา 0 = ไม่ออกใบเสนอราคา 1 = ออกใบเสนอราคา
 * @property int|null $confirm 0 = ยังไม่ตกลงซื้อ 1 = ตกลงซื้อ
 * @property int|null $outside 1 = ส่งผลิตนอกร้าน
 * @property int|null $mascancel รหัสยกเลิกงาน
 * @property string|null $canceletc สาเหตุอื่น ที่ยกเลิกงาน
 * @property int|null $print_status แผนกพิมพ์ 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จแล้ว
 * @property int|null $cnc_status แผนก cnc/laser 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จ
 * @property int|null $manufacture_status ผลิตทั่วไป 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 ผลิตเสร็จแล้ว
 * @property int|null $technician_status แผนกช่าง 0 ไม่ผลิต 1 = รับงาน 2 ติดตั้งเสร็จ
 * @property int|null $approve 0 = ยังไม่ส่งมอบงานลูกค้า 1 = ส่งมอบงานลูกค้า
 * @property int|null $userapprove พนักงานส่งมอบงาน
 * @property string|null $confirmdate วันที่ยืนยัน
 * @property string|null $comment comment
 */
class Customers extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customers';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['channel', 'typework', 'last_dep', 'user_id', 'transport', 'setup', 'fast', 'flag', 'quotation', 'confirm', 'outside', 'mascancel', 'print_status', 'cnc_status', 'manufacture_status', 'technician_status', 'approve', 'userapprove'], 'integer'],
            [['detail'], 'string'],
            [['date_getjob', 'time_getjob', 'create_date', 'confirmdate'], 'safe'],
            [['project_name', 'channel_etc', 'address', 'ref', 'canceletc', 'comment'], 'string', 'max' => 255],
            [['customer', 'tel', 'file', 'cur_dep'], 'string', 'max' => 100],
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
            'ref' => 'Ref',
            'transport' => '0 ไม่จัดส่ง 1 จัดส่ง',
            'setup' => '0 ไม่ติดตั้ง 1 ติดตั้ง',
            'fast' => '0 ทั่วไป 1 เร่งด่วน',
            'flag' => '0 = NoApprove 1 = Approve 2 =  Cancel',
            'quotation' => 'ใบเสนอราคา 0 = ไม่ออกใบเสนอราคา 1 = ออกใบเสนอราคา',
            'confirm' => '0 = ยังไม่ตกลงซื้อ 1 = ตกลงซื้อ',
            'outside' => '1 = ส่งผลิตนอกร้าน',
            'mascancel' => 'รหัสยกเลิกงาน',
            'canceletc' => 'สาเหตุอื่น ที่ยกเลิกงาน',
            'print_status' => 'แผนกพิมพ์ 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จแล้ว',
            'cnc_status' => 'แผนก cnc/laser 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จ',
            'manufacture_status' => 'ผลิตทั่วไป 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 ผลิตเสร็จแล้ว',
            'technician_status' => 'แผนกช่าง 0 ไม่ผลิต 1 = รับงาน 2 ติดตั้งเสร็จ',
            'approve' => '0 = ยังไม่ส่งมอบงานลูกค้า 1 = ส่งมอบงานลูกค้า',
            'userapprove' => 'พนักงานส่งมอบงาน',
            'confirmdate' => 'วันที่ยืนยัน',
            'comment' => 'comment',
        ];
    }
}
