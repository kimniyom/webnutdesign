
<!--
<link href="<?php //echo Yii::$app->urlManager->baseUrl ?>/css/account.css" rel="stylesheet">
-->
<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet">
<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/js/blueimp-gallery.min.js"></script>
<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/dosamigos-blueimp-gallery.js"></script>
<style>
    #w0 img{
        border-radius: 10px;
        margin: 10px;
        width: 20%;
        transition: box-shadow 0.3s ease-in-out;
    }
    #w0 img:hover{
        box-shadow: 0px 5px 20px 10px #cccccc;
    }
    .head-title{
        color: #00cccc;
    }

    .customer-view table tr th{
        padding: 5px;
        border-top: 0px;
    }
    .customer-view table tr td{
        padding: 5px;
        border-top: 0px;
    }
    .customer-view table{
        border-right: 0px;
    }

    @media(max-width:767px) {
     .customer-view .card{
        padding:0px;
        border:0px;
        border-radius: 0px;
        margin: 0px;
     }
      .customer-view .card-head{
        padding:0px;
        border:none;
        border-radius: 0px;
        margin: 0px;
     }

     .customer-view .card-responsive{
        padding: 0px !important;
        margin: 0px;
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
<div class="customer-view">
    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-3 col-lg-3 card-responsive" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; margin-bottom: 0px; padding-bottom: 0px;">
                <div class="card-header">
                    <i class="fa fa-user"></i> ข้อมูลลูกค้า
                </div>
                <div class="card-body" id="box-popup-left-view" style="overflow: auto; padding: 5px;">
                    <table class="table">
                        <tr>
                            <th>ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง</th>
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
            </div>
        </div>
        <div class="col-md-6 col-lg-6 card-responsive" style=" padding-left: 0px; padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px;margin-bottom: 0px; padding-bottom: 0px;">
                <div class="card-content" >
                    <div class="card-header">
                        <i class="fa fa-briefcase"></i> รายละเอียดงาน
                    </div>
                    <div class="card-body" id="box-popup-right-view" style="overflow: auto; padding: 5px;">
                        <h3 class="head-title text-info" style=" padding: 10px; padding-left: 5px;">ข้อมูลรับงาน</h3>
                        <table class="table">
                            <tr>
                                <th>ชื่องาน</th>
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
                            <div class="panel-body">
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
                        <!-- Account -->
                        <hr/>
                        <h3 class="head-title text-info" style=" padding: 10px; padding-left: 5px;">บัญชี</h3>
                        <hr/>
                        <h3 class="head-title text-info" style=" padding: 10px; padding-left: 5px;">กราฟิก / ใบสั่งงาน</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-lg-3 card-responsive" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;margin-bottom: 0px; padding-bottom: 0px;">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fas fa-long-arrow-alt-down text-danger"></i><i class="fas fa-long-arrow-alt-up text-success"></i> กิจกรรม
                    </div>
                    <div class="card-body" id="box-timeline-view" style="overflow: auto; padding: 0px;">
                        <ul class="list-group" style=" border-radius: 0px;">
                            <?php foreach ($timeline as $tm): ?>
                                <li class="list-group-item" style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                    <div class="btn btn-rounded btn-danger" style=" padding: 0px 5px;"><?php echo$ConfigModel->thaidate($tm['d_update']) ?></div>
                                    <ul>
                                        <li>แผนก: <?php echo $tm['curdep'] ?></li>
                                        <li>ส่งต่อแผนก: <?php echo $tm['todep'] ?></li>
                                        <li>โดย: <?php echo $tm['name'] ?></li>
                                    </ul>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreensView();
        });
            ');
?>

<script type="text/javascript">
    jQuery(function ($) {
    dosamigos.gallery.registerLightBoxHandlers('#w0 a', []);

    setScreensView();
    function setScreensView() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            $("#box-popup-left-view").css({"height": h - 128});
            $("#box-popup-right-view").css({"height": h - 128});
            $("#box-timeline-view").css({"height": h - 128});
        }
    }
});
</script>
