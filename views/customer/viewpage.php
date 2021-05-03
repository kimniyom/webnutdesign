<style>
    .customer-viewpage #w1 img{
        border-radius: 10px;
        margin: 10px;
        width: 20%;
        transition: box-shadow 0.3s ease-in-out;
    }
    .customer-viewpage #w1 img:hover{
        box-shadow: 0px 5px 20px 10px #cccccc;
    }
    
    .customer-viewpage table tr th{
        padding: 5px;
        border-top: 0px;
    }
    .customer-viewpage table tr td{
        padding: 5px;
        border-top: 0px;
    }
    .customer-viewpage table{
        border-right: 0px;
    }

    @media(max-width:768px) {
        .head-title{
            margin-left: 20px;
        }

        .content-view{
            padding: 20px;
        }
    }
</style>
<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\ConfigWeb;
use yii\helpers\Url;
use app\models\Customer;

$ConfigModel = new ConfigWeb();
$CustomerModel = new Customer();
?>
<div class="customer-viewpage">
    <h3 class="head-title text-info" style=" padding: 10px; padding-left: 5px;"><i class="fa fa-user"></i> ข้อมูลลูกค้า</h3>
    <div style="margin:10px;" class="content-view">
        <table class="table">
            <tr>
                <th style="width: 150px;">ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง</th>
                <td><?php echo $model['customer'] ?></td>
            </tr>
                        <tr>
                            <th>เบอร์โทรศัพท์</th>
                            <td><?php echo $model['tel'] ?></td>
                        </tr>
                        <tr>
                            <th>ช่องทางลูกค้าติดต่อมา</th>
                            <td><?php echo $ConfigModel->getChannel($model['channel']) . ' (ข้อมูลอื่น ๆ: ' . $model['channel_etc'] . ')' ?></td>
                        </tr>
                        <tr>
                            <th>ที่อยู่ / ข้อมูลการจัดส่ง</th>
                            <td><?php echo $model['address'] ?></td>
                        </tr>
                        <tr>
                            <th>ผู้รับงาน</th>
                            <td><?php echo dektrium\user\models\Profile::findOne(['user_id' => $model['user_id']])['name'] ?></td>
                        </tr>
                        <tr>
                            <th>วันที่ทำรายการ</th>
                            <td><?php echo $ConfigModel->thaidate($model['create_date']) ?></td>
                        </tr>
            </table>
        </div>
                    <h3 class="head-title text-info" style=" padding: 10px; padding-left: 5px;"><i class="fa fa-briefcase"></i> รายละเอียด</h3>
                        <div style="margin:10px;" class="content-view">
                        <table class="table">
                            <tr>
                                <th style="width: 150px;">ชื่องาน</th>
                                <td><?php echo $model['project_name'] ?></td>
                            </tr>
                            <tr>
                                <th>วันที่รับสินค้า</th>
                                <td><?php echo $ConfigModel->thaidate($model['date_getjob']) . " " . $model['time_getjob'] ?></td>
                            </tr>
                            <tr>
                                <th>การจัดส่ง</th>
                                <td><?php echo ($model['transport'] == 1) ? "ต้องจัดส่ง" : "ไม่ต้องจัดส่ง" ?></td>
                            </tr>
                            <tr>
                                <th>การติดตั้ง</th>
                                <td><?php echo ($model['setup'] == 1) ? "มีการติดตั้ง" : "ไม่มีการติดตั้ง" ?></td>
                            </tr>
                            <tr>
                                <th>ความเร่งด่วน</th>
                                <td><?php echo ($model['fast'] == 1) ? "เร่งด่วน" : "ทั่วไป" ?></td>
                            </tr>
                            <tr>
                                <th>ใบเสนอราคา</th>
                                <td><?php echo ($model['quotation'] == 1) ? "ทำใบเสนอราคา" : "ไม่ต้องทำใบเสนอราคา" ?></td>
                            </tr>
                            <tr>
                                <th>รายละเอียดงาน</th>
                                <td><?php echo $model['detail'] ?></td>
                            </tr>
                        </table>

                        <div class="panel panel-default">
                            <div class="panel-body" style=" padding: 10px;">
                                รูปภาพแนบ
                                <?php echo dosamigos\gallery\Gallery::widget(['items' => $CustomerModel->getThumbnails($model['ref'], $model['project_name'])]); ?>
                                ไฟล์แนบ
                                <ul>
                                    <?php foreach ($filelist as $f): ?>
                                        <li><a href="<?php echo Url::to('@web/photolibrarys/' . $f['ref'] . '/' . $f['real_filename']) ?>" target="_back"><?php echo $f['real_filename'] ?></a></li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
</div>

                   
                        <!-- Account -->
</div>



