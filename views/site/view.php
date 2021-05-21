<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/view.css" rel="stylesheet">
<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet">
<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/js/blueimp-gallery.min.js"></script>
<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/dosamigos-blueimp-gallery.js"></script>
<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/fancybox-2.1.7/source/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/fancybox-2.1.7/source/jquery.fancybox.css" media="screen" />
<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\ConfigWeb;
use yii\helpers\Url;
use app\models\Customer;

$ConfigModel = new ConfigWeb();
$CustomerModel = new Customer();
?>
<div class="customer-view-all">
    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-4 col-lg-4 card-responsive" style="padding-right: 0px;">
            <div class="card" style=" border-top:0px;   background: #eeeeee;">
                <div class="card-header">
                    <i class="fa fa-user"></i> ข้อมูลลูกค้า
                </div>
                <div class="card-body" id="box-popup-left-view-all" style="overflow: auto; padding: 10px; background: #eeeeee;">
                    <div class="view-content-left bg-white" style=" padding: 10px; border-radius: 10px;">
                        <label class="head-title-view">ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง</label>
                        <p class="txt-customer"><i class="fa fa-user-circle text-danger"></i> <?php echo $model['customer'] ?></p>
                        <label class="head-title-view">เบอร์โทรศัพท์</label>
                        <p class="txt-customer"><?php echo $model['tel'] ?></p>
                        <label class="head-title-view">ช่องทางลูกค้าติดต่อมา</label>
                        <p class="txt-customer">
                            <?php 
                            if($model['channel'] == "1"){
                                echo "Line ".$model['lineid'];
                            } else if($model['channel'] == "2"){
                                 echo "โทรศัพท์";
                            } else if($model['channel'] == "3"){
                                echo "หน้าร้าน";
                            } else {
                                echo $model['channel_etc'];
                            }
                            ?>        
                        </p>
                        <label class="head-title-view">ที่อยู่ / ข้อมูลการจัดส่ง</label>
                        <p class="txt-customer"><?php echo $model['address'] ?></p>
                        <label class="head-title-view">ผู้รับงาน</label>
                        <p class="txt-customer"><?php echo dektrium\user\models\Profile::findOne(['user_id' => $model['user_id']])['name'] ?></p>
                        <label class="head-title-view">วันที่ทำรายการ</label>
                        <p class="txt-customer"><?php echo $ConfigModel->thaidate($model['create_date']) ?></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5 col-lg-5 card-responsive-content" style=" padding-left: 0px; padding-right: 0px;">
            <div class="card" style=" border-top:0px; background: #d9e0df;">
                <div class="card-content" >
                    <div class="card-header" style="border-bottom: 0px; border-left: 0px; border-right: 0px;">
                        <i class="fa fa-briefcase"></i> รายละเอียดงาน
                    </div>
                    <div class="card-body" id="box-popup-right-view-all" style="overflow: auto; padding: 10px;">
                        <!-- ข้อมูลรับงาน -->
                        <div class="box-work-detail">
                            <div style=" background: #ffffff; padding: 10px; border-radius: 10px;">
                                <h3 class="head-title-view">ข้อมูลรับงาน</h3>
                                <table class="table table-bordered">
                                    <tr>
                                        <th style=" width: 120px;">ชื่องาน</th>
                                        <td><?php echo $model['project_name'] ?></td>
                                    </tr>
                                    <tr>
                                        <th>วันที่รับสินค้า</th>
                                        <td><?php echo $ConfigModel->thaidate($model['date_getjob']) . " " . $model['time_getjob'] ?></td>
                                    </tr>
                                    <tr>
                                        <th>การจัดส่ง</th>
                                        <td><?php echo ($model['transport'] == "1") ? "ต้องจัดส่ง" : "รับหน้าร้าน" ?></td>
                                    </tr>
                                    <tr>
                                        <th>การติดตั้ง</th>
                                        <td><?php echo ($model['setup'] == "1") ? "มีการติดตั้ง" : "ไม่มีการติดตั้ง" ?></td>
                                    </tr>
                                    <tr>
                                        <th>ใบเสนอราคา</th>
                                        <td><?php echo ($model['quotation'] == "1") ? "ทำใบเสนอราคา" : "ไม่ต้องทำใบเสนอราคา" ?></td>
                                    </tr>
                                    <tr>
                                        <th>รายละเอียดงาน</th>
                                        <td>
                                            <div style=" position: relative; word-wrap: break-word;" id="boxdetailcustomer">
                                                <?php echo $model['detail'] ?>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="table-responsive" style="border-radius: 10px; border:solid 0px #eeeeee; display: flex; flex-wrap: nowrap;text-overflow: auto; width: 100%;" id="showImg"></div>
                                        </td>
                                    </tr>
                                </table>
                                <?php 
                                    $ref = $model['ref'];
                                    $sql = "SELECT COUNT(*) FROM uploads WHERE ref = '$ref'";
                                    $count = Yii::$app->db->createCommand($sql)->queryScalar();
                                    if($count > 0){
                                ?>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        รูปภาพแนบ
                                        <?php
                                        if ($count > 0) {
                                            echo dosamigos\gallery\Gallery::widget(['items' => $CustomerModel->getThumbnails($model['ref'], $model['project_name'])]);
                                        } ?>
                                        
                                        <?php if ($filelist) { ?>
                                            <br/>ไฟล์แนบ
                                            <ul>
                                                <?php foreach ($filelist as $f): ?>
                                                    <li><a href="<?php echo Url::to('@web/photolibrarys/' . $f['ref'] . '/' . $f['real_filename']) ?>" target="_back"><?php echo $f['file_name'] ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            </div>
                        </div>

                        <!-- Account -->
                        <div class="box-account">
                            <div style=" background: #ffffff; padding: 10px; border-radius: 10px; margin-top: 10px;">
                                <h3 class="head-title-view">บัญชี</h3>
                                <div style="">
                                    <?php if ($account) { ?>
                                        <label style="font-weight: bold;">รายละเอียด</label>
                                        <div class="alert alert-warning">
                                            <?php echo ($account['detail']) ? $account['detail'] : "-" ?>
                                            <label><i class="fa fa-user text-warning"></i>โดย <?php echo dektrium\user\models\Profile::findOne(['user_id' => $account['user_id']])['name'] ?></label>
                                        </div>
                                    <?php } else { ?>
                                        ยังไม่มีข้อมูลในส่วนนี้
                                    <?php } ?>
                                </div>
                            </div>
                        </div>

                        <!-- กราฟิก -->
                        <div class="box-graphic">
                            <div style=" background: #ffffff; padding: 10px; border-radius: 10px; margin-top: 10px;">
                                <h3 class="head-title-view">กราฟิก / ใบสั่งงาน</h3>
                                <?php
                                if ($graphic) {
                                    ?>
                                    <label style="margin-left: 10px; font-weight: bold;">รายละเอียดใบสั่งงาน</label>
                                    <div class="alert alert-success">
                                        <div class="boxdetailgf">
                                            <?php echo $graphic['detail'] ?>
                                        </div>
                                        <div class="table-responsive" style="border-radius: 10px; border:solid 0px #eeeeee; display: flex; flex-wrap: nowrap;text-overflow: auto; width: 100%;" id="showImgGraphic"></div>
                                        <label><i class="fa fa-user text-warning"></i>โดย <?php echo dektrium\user\models\Profile::findOne(['user_id' => $graphic['user_id']])['name'] ?></label>
                                    </div>
                                    <label style="margin-left: 10px; font-weight: bold;">ไฟล์งาน / ตัวอย่างงาน</label>
                                    <div class="table-responsive" style="border-radius: 10px; border:solid 0px #eeeeee; display: flex; flex-wrap: nowrap;text-overflow: auto; width: 100%;">
                                        <?php
                                        foreach ($filegraphic as $files):
                                            $img = Url::to('@web/photolibrarys/') . $graphic['ref_graphic'] . '/' . $files['real_filename'];
                                            $imgfull = Url::to('@web/photolibrarys/') . $graphic['ref_graphic'] . '/' . $files['real_filename'];
                                            ?>
                                            <a class="fancybox" rel="gallery1" href="<?php echo $imgfull ?>" title="แบบงาน/ตัวอย่างงาน">
                                                <div class="img-crop" style="background-image: url('<?php echo $img ?>');"></div>
                                            </a>
                                        <?php endforeach; ?>
                                    </div>
                                <?php } else { ?>
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="card-body" style="text-align: center;">
                                                ยังไม่มีข้อมูลในส่วนนี้
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>

                        <!-- แผนกผลิต -->
                        <div class="box-production">
                            <div style=" background: #ffffff; padding: 10px; border-radius: 10px; margin-top: 10px;">
                                <h3 class="head-title-view">ส่งผลิต</h3>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-6" style="margin-bottom: 10px;">
                                        <div class="list-group">
                                            <div class=" list-group-item active" style="text-align: center;">
                                                งานพิมพ์
                                            </div>
                                            <div class=" list-group-item" style="text-align: center;">
                                                <img src="<?php echo Url::to('@web/icon/printers.png') ?>" class=" img-responsive" style=" width: 48px;"/><br/>
                                                <?php if ($model['print_status'] != "0") { ?>
                                                    <?php if ($model['print_status'] == 1) { ?>
                                                        <i class="fa fa-remove text-danger"></i> อยู่ระหว่างการผลิต
                                                    <?php } else { ?>
                                                        <i class="fa fa-check text-success"></i> ผลิตเสร็จแล้ว
                                                    <?php } ?>
                                                <?php } else { ?>
                                                    ไม่มีการผลิต
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-sm-6" style="margin-bottom: 10px;">
                                        <div class="list-group">
                                            <div class=" list-group-item active" style="text-align: center;">
                                                CNC/LASER
                                            </div>
                                            <div class=" list-group-item" style="text-align: center;">
                                                <img src="<?php echo Url::to('@web/icon/laser-cutting-machine.png') ?>" class=" img-responsive" style=" width: 48px;"/><br/>
                                                <?php if ($model['cnc_status'] != "0") { ?>
                                                    <?php if ($model['cnc_status'] == 1) { ?>
                                                        <i class="fa fa-remove text-danger"></i> อยู่ระหว่างการผลิต
                                                    <?php } else { ?>
                                                        <i class="fa fa-check text-success"></i> ผลิตเสร็จแล้ว
                                                    <?php } ?>
                                                <?php } else { ?>
                                                    ไม่มีการผลิต
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 10px;">
                                        <div class="list-group">
                                            <div class=" list-group-item active" style="text-align: center;">
                                                ผลิตทั่วไป
                                            </div>
                                            <div class=" list-group-item" style="text-align: center;">
                                                <img src="<?php echo Url::to('@web/icon/engineer.png') ?>" class=" img-responsive" style=" width: 48px;"/><br/>
                                                <?php if ($model['manufacture_status'] != "0") { ?>
                                                    <?php if ($model['manufacture_status'] == 1) { ?>
                                                        <i class="fa fa-remove text-danger"></i> อยู่ระหว่างการผลิต
                                                    <?php } else { ?>
                                                        <i class="fa fa-check text-success"></i> ผลิตเสร็จแล้ว
                                                    <?php } ?>
                                                <?php } else { ?>
                                                    <span style="text-align:center; color:#d1d1d1;">ไม่มีการผลิต</span>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End box product -->

                        <!-- แผนกติดตั้ง -->
                        <div class="box-setup">
                            <div style=" background: #ffffff; padding: 10px; border-radius: 10px; margin-top: 10px;">
                                <h3 class="head-title-view">ช่างติดตั้ง</h3>
                                <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 10px;">
                                    <div class="list-group">
                                        <div class=" list-group-item" style="text-align: center;">
                                            <?php if ($model['setup'] == "1") { ?>
                                                <?php if ($model['technician_status'] == 1) { ?>
                                                    <i class="fa fa-remove text-danger"></i> อยู่ระหว่างการดำเนินงาน
                                                <?php } else if ($model['technician_status'] == 2) { ?>
                                                    <i class="fa fa-check text-success"></i> ติดตั้งเสร็จแล้ว
                                                    <br/>รูปภาพการติดตั้งงาน
                                                    <div class="table-responsive" style="border-radius: 10px; border:solid 0px #eeeeee; display: flex; flex-wrap: nowrap;text-overflow: auto; width: 100%;">
                                                        <?php
                                                        $refsetup = app\models\Queue::findOne(['ref' => $model['ref']])['refsetup'];
                                                        $filesetups = \app\models\Uploads::findAll(['ref' => $refsetup]);
                                                        foreach ($filesetups as $file):
                                                            $imgsetup = Url::to('@web/photolibrarys/') . $refsetup . '/thumbnail/' . $file['real_filename'];
                                                            $imgfullsetup = Url::to('@web/photolibrarys/') . $refsetup . '/' . $file['real_filename'];
                                                            ?>
                                                            <a class="fancybox" rel="gallery1" href="<?php echo $imgfullsetup ?>" title="รูปงานติดตั้ง">
                                                                <div class="img-crop" style="background-image: url('<?php echo $imgsetup ?>');"></div>
                                                            </a>
                                                        <?php endforeach; ?>
                                                    </div>
                                                <?php } else { ?>
                                                    <i class="fa fa-info"></i> ยังไม่รับงาน
                                                <?php } ?>
                                            <?php } else { ?>
                                                <span style="text-align:center; color:#d1d1d1;">ไม่มีการติดตั้ง</span>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ​End Box Setup -->
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
                    <div class="card-body" id="box-timeline-view-all" style="overflow: auto; padding: 0px;">
                        <ul class="list-group" style=" border-radius: 0px;">
                            <?php foreach ($timeline as $tm): ?>
                                <li class="list-group-item" style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                    <div class="btn btn-rounded btn-danger" style=" padding: 0px 5px;"><?php echo$ConfigModel->thaidate($tm['d_update']) ?></div>
                                    <ul>
                                        <li>
                                            แผนกรับ: <?php echo $tm['curdep'] ?>
                                            <ul>
                                                <li>
                                                    <?php echo $tm['log'] ?>
                                                </li>
                                            </ul>
                                        </li>

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

<div id="boxImgDetail" style=" display: none;">
        <?php echo $model['detail'] ?>
    </div>

    <div id="boxImgGraphic" style="display: none;">
        <?php echo $graphic['detail'] ?>
    </div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreensView();
        });
    ');
?>

<script type="text/javascript">
        
        setImg();
        setImgGraphic();
    jQuery(function($) {
        dosamigos.gallery.registerLightBoxHandlers('#w0 a', []);
        $(".fancybox").fancybox({
            openEffect: "elastic",
            closeEffect: "none"
        });
        $(".fancyboxdetail").fancybox({
            openEffect: "elastic",
            closeEffect: "none"
        });
        $(".fancyboxGraphic").fancybox({
            openEffect: "elastic",
            closeEffect: "none"
        });
        $(".fancyboxsetup").fancybox({
            openEffect: "elastic",
            closeEffect: "none"
        });

        
setScreensView();
        function setScreensView() {
            var h = window.innerHeight;
            var w = window.innerWidth;
            if (w > 768) {
                $("#box-popup-left-view-all").css({"height": h - 128});
                $("#box-popup-right-view-all").css({"height": h - 128});
                $("#box-timeline-view-all").css({"height": h - 128});
            }
        }
    });

    function setImg() {
        $("#boxdetailcustomer p img:last-child").remove()
        var imgs = $('#boxImgDetail p').children('img').map(function () {
            return $(this).attr('src')
        }).get();
        
        for( var i=0; i<imgs.length; i++ ) {
            let imgUrl = imgs[i];
            $("#showImg").append("<a class='fancyboxdetail' rel='gallery1' href='"+ imgUrl +"' title='แบบงาน/ตัวอย่างงาน'><div class='img-crop-detail' style='background-image: url("+ imgUrl +");'></div></a>");
        }
    }

     function setImgGraphic() {
        $(".boxdetailgf p img:last-child").remove()
        var imgs = $('#boxImgGraphic p').children('img').map(function () {
            return $(this).attr('src')
        }).get();
        
        for( var i=0; i<imgs.length; i++ ) {
            let imgUrl = imgs[i];
            $("#showImgGraphic").append("<a class='fancyboxGraphic' rel='gallery1' href='"+ imgUrl +"' title='แบบงาน/ตัวอย่างงาน'><div class='img-crop-detail' style='background-image: url("+ imgUrl +");'></div></a>");
        }
    
    }
</script>
