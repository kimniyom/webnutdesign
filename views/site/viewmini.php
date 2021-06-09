<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet">
<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/js/blueimp-gallery.min.js"></script>
<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/blueimp-gallery/dosamigos-blueimp-gallery.js"></script>
<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/fancybox-2.1.7/source/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/fancybox-2.1.7/source/jquery.fancybox.css" media="screen" />
<style>
    @font-face {
        font-family: sarabun;
        src: url('<?php echo Yii::$app->urlManager->baseUrl ?>/css/sarabun/THSarabun Bold.ttf');
    }

    .box-work-detail img{
        border-radius: 10px;
        margin: 10px;
        width: 20%;
        transition: box-shadow 0.3s ease-in-out;
    }
    .box-work-detail img:hover{
        box-shadow: 0px 5px 20px 10px #cccccc;
    }


    .fancybox .img-crop{
        border-radius: 10px;
        margin: 10px;
        transition: box-shadow 0.3s ease-in-out;
        border: solid 1px #eeeeee;
    }

    .fancybox .img-crop:hover{
        box-shadow: 0px 0px 10px 0px #cccccc;
    }
    .head-title{
        color: #00cccc;

    }

    .customer-view-all{

    }

    .customer-view-all table tr th{
        padding: 5px;
        border-top: 0px;
    }
    .customer-view-all table tr td{
        padding: 5px;
        border-top: 0px;
    }
    .customer-view-all table{
        border-right: 0px;
    }


    .customer-view-all .card{
        border-radius: 0px;
        padding-bottom: 0px;
        margin-bottom: 0px;

    }

    .customer-view-all .card-header{
        border-bottom: solid 1px #eeeeee;
    }

    .customer-view-all #box-popup-right-view{
        border-left: solid 1px #eeeeee;
        border-right: solid 1px #eeeeee;
    }

    .customer-view-all .card-responsive-content{
        border-left: solid 1px #eeeeee;
        border-right: solid 1px #eeeeee;
    }

    .img-crop{
        width: 150px;
        height: 150px;
        background-position: center center;
        background-repeat: no-repeat;
    }

    .head-title-view{
        font-weight: bold;
        color: rgb(184, 0, 153);
        font-family: skvl;
    }
    .txt-customer{
        padding-left: 10px;
        border-bottom:solid 1px #eeeeee;
    }
    @media(max-width:767px) {
        .customer-view-all .card{
            padding:10px;
            margin-bottom: 20px;
            border:0px;
            border-radius: 10px;

        }
        .customer-view-all .card-header{
            background: none;
            border:none;
            border-radius: 0px;
            margin: 0px;

            font-weight: bold;
            padding-left: 0px;
        }

        .customer-view-all .box-production .list-group{
            margin-bottom: 10px;
        }

        .customer-view-all .card-responsive{
            padding: 0px !important;
            margin: 0px;
        }

        .customer-view-all .card-responsive-content{
            padding: 0px;
            margin: 0px;
            border:none;
        }



        .customer-view-all #box-popup-right-view{
            border-left: none;
            border-right: none;
        }

        .customer-view-all .card{
            margin-top: 0px;
            padding-top: 0px;
        }

        .head-title{
            color: #00cccc;

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
<div class="customer-view-all" style=" padding-top: 0px; margin-top: 0px; font-family: skvb;">
    <!-- ข้อมูลรับงาน -->
    <div class="box-work-detail">
        <div style=" background: #ffffff; padding: 10px; border-radius: 10px; box-shadow: #333333 0px 10px 10px 0px; position: relative;">
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
                    <td><?php echo ($model['transport'] == 1) ? "ต้องจัดส่ง" : "รับหน้าร้าน" ?></td>
                </tr>
                <tr>
                    <th>การติดตั้ง</th>
                    <td><?php echo ($model['setup'] == 1) ? "มีการติดตั้ง" : "ไม่มีการติดตั้ง" ?></td>
                </tr>
                <tr>
                    <th>ใบเสนอราคา</th>
                    <td><?php echo ($model['quotation'] == 1) ? "ทำใบเสนอราคา" : "ไม่ต้องทำใบเสนอราคา" ?></td>
                </tr>

            </table>
            <label>รายละเอียดงาน</label>
            <div style=" position: relative; word-wrap: break-word;" class="boxdetailgf">
                <?php if(!empty($model['detail'])) echo $model['detail'] ?>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    รูปภาพแนบ
                    <?php
                    $ref = $model['ref'];
                    $sql = "SELECT COUNT(*) FROM uploads WHERE ref = '$ref'";
                    $count = Yii::$app->db->createCommand($sql)->queryScalar();
                    if ($count > 0) {
                        echo dosamigos\gallery\Gallery::widget(['items' => $CustomerModel->getThumbnails($model['ref'], $model['project_name'])]);
                    } else {
                        echo "-";
                    }
                    ?>
                    <br/>ไฟล์แนบ
                    <?php if (!empty($filelist)) { ?>
                        <ul>
                            <?php foreach ($filelist as $f): ?>
                                <li><a href="<?php echo Url::to('@web/photolibrarys/' . $f['ref'] . '/' . $f['real_filename']) ?>" target="_back"><?php echo $f['file_name'] ?></a></li>
                            <?php endforeach; ?>
                        </ul>
                    <?php } else { ?>
                        -
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>

    <!-- กราฟิก -->
    <div class="box-graphic">
        <div style=" background: #ffffff; padding: 10px; border-radius: 10px; position: relative; margin-top: 20px;">
            <h3 class="head-title-view">กราฟิก / ใบสั่งงาน</h3>
            <?php
            if (!empty($graphic)) {
                ?>
                <label style="margin-left: 10px; font-weight: bold;">รายละเอียดใบสั่งงาน</label>
                <div class="alert alert-success">
                    <div class="content-graphic">
                        <?php if(!empty($graphic)) echo $graphic['detail'] ?>
                    </div>
                    <label><i class="fa fa-user text-warning"></i> โดย::<?php echo dektrium\user\models\Profile::findOne(['user_id' => $graphic['user_id']])['name'] ?></label>
                </div>
                <label style="margin-left: 10px; font-weight: bold;">ไฟล์งาน / ตัวอย่างงาน</label>
                <div class="table-responsive" style="border-radius: 10px; border:solid 0px #eeeeee; display: flex; flex-wrap: nowrap;text-overflow: auto; width: 100%;">
                    <?php
                    if (!empty($graphic['ref_graphic'])) {
                    foreach ($filegraphic as $files):
                        $img = Url::to('@web/photolibrarys/') . $graphic['ref_graphic'] . '/' . $files['real_filename'];
                        $imgfull = Url::to('@web/photolibrarys/') . $graphic['ref_graphic'] . '/' . $files['real_filename'];
                        ?>
                        <a class="fancybox" rel="gallery1" href="<?php echo $imgfull ?>" title="แบบงาน/ตัวอย่างงาน">
                            <div class="img-crop" style="background-image: url('<?php echo $img ?>');"></div>
                        </a>
                    <?php endforeach; } ?>
                </div>
            <?php } ?>
        </div>
    </div>


    <div class="view-content-left bg-white" style=" padding: 10px; border-radius: 10px; margin-top: 20px; box-shadow: #333333 0px 10px 10px 0px;">
        <h3 class="head-title-view">ข้อมูลลูกค้า</h3>
        <label class="head-title-view">ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง</label>
        <p class="txt-customer"> <?php echo $model['customer'] ?></p>
        <label class="head-title-view">เบอร์โทรศัพท์</label>
        <p class="txt-customer"><?php if(!empty($model['tel'])) echo $model['tel'] ?></p>
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
        <p class="txt-customer"><?php if(!empty($model['address'])) echo $model['address'] ?></p>
        <label class="head-title-view">ผู้รับงาน</label>
        <p class="txt-customer"><?php echo dektrium\user\models\Profile::findOne(['user_id' => $model['user_id']])['name'] ?></p>
        <label class="head-title-view">วันที่ทำรายการ</label>
        <p class="txt-customer"><?php echo $ConfigModel->thaidate($model['create_date']) ?></p>
    </div>


</div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreensView();
            SetImgResponsive(".content-graphic");
            $(".content-graphic img").fancybox({
                openEffect: "none",
                closeEffect: "none"
            });
        });
    ');
?>

<script type="text/javascript">
    setImg();

    jQuery(function($) {
        dosamigos.gallery.registerLightBoxHandlers('#w0 a', []);
        $(".fancybox").fancybox({
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
                //$("#box-popup-left-view-all").css({"height": h - 128});
                //$("#box-popup-right-view-all").css({"height": h - 128});
                //$("#box-timeline-view-all").css({"height": h - 128});
            }
        }
    });

    function setImg() {
        $(".boxdetailgf img").addClass("img img-responsive fancybox");
        $(".content-graphic img").addClass("img img-responsive fancybox");
    }

    function SetImgResponsive(BoxID) {
        var BoxPost = BoxID;
        var tn_array = $(BoxPost + ' img').map(function() {
            return $(this).attr("id");
        });

        for (var i = 0; i < tn_array.length; i++) {
            var tagimg = tn_array[i];
            var widthimg = $(BoxPost).width();
            var img = $(BoxPost + " #" + tagimg).width();
            if (img >= widthimg) {
                $(BoxPost + " #" + tagimg).addClass("img-responsive");
                $(BoxPost + " #" + tagimg).css({"width": "auto", "height": "auto"});
            }
        }

    }

</script>
