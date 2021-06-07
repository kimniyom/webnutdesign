<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/view-mobile.css" rel="stylesheet">
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
    <!-- ข้อมูลรับงาน -->
    <div class="box-work-detail">
        <div style=" background: none; padding: 10px; border-radius: 10px;position: relative;">

            <div class="row" style="margin: 0px;">
                <div class="col-md-3 col-lg-3 col-3" style=" padding-left: 0px;">
                    <div style="width: 120px; color: #FFFFFF;">ชื่องาน</div>
                </div>
                <div class="col-md-9 col-lg-9 col-9">
                    <div style=" position: relative; word-wrap: break-word; color:#FFFFFF;">
                        <?php echo $model['project_name'] ?>
                    </div>
                </div>
            </div>

            <div class="row" style="margin: 0px;">
                <div class="col-md-3 col-lg-3 col-3" style=" padding-left: 0px;">
                    <div style="width: 120px; color: #FFFFFF;">ลูกค้า</div>
                </div>
                <div class="col-md-9 col-lg-9 col-9">
                    <div style=" position: relative; word-wrap: break-word; color:#FFFFFF;">
                        <?php echo $model['customer'] ?>
                    </div>
                </div>
            </div>

            <div class="row" style="margin: 0px;">
                <div class="col-md-3 col-lg-3 col-3" style=" padding-left: 0px;">
                    <div style="width: 120px; color: #FFFFFF;">วันที่รับสินค้า</div>
                </div>
                <div class="col-md-9 col-lg-9 col-9">
                    <div style=" position: relative; word-wrap: break-word; color:#FFFFFF;">
                        <?php echo $ConfigModel->thaidate($model['date_getjob']) . " " . $model['time_getjob'] ?>
                    </div>
                </div>
            </div>

            <div class="row" style="margin: 0px;">
                <div class="col-md-3 col-lg-3 col-3" style=" padding-left: 0px;">
                    <div style="width: 120px; color: #FFFFFF;">รายละเอียด</div>
                </div>
                <div class="col-md-9 col-lg-9 col-9">
                    <div style=" position: relative; word-wrap: break-word; color:#FFFFFF;" id="boxdetailcustomer">
                        <?php echo $model['detail'] ?>
                    </div>
                    <div class="table-responsive" style="border-radius: 10px; border:solid 0px #eeeeee; display: flex; flex-wrap: nowrap;text-overflow: auto; width: 100%;" id="showImg"></div>
                </div>
            </div>
            <?php
            $ref = $model['ref'];
            $sql = "SELECT COUNT(*) FROM uploads WHERE ref = '$ref'";
            $count = Yii::$app->db->createCommand($sql)->queryScalar();
            if ($count > 0) {
                ?>
                <div class="panel panel-default">
                    <div class="panel-body" style=" color: #FFFFFF;">
                        รูปภาพแนบ
                        <?php
                        if ($count > 0) {
                            echo dosamigos\gallery\Gallery::widget(['items' => $CustomerModel->getThumbnails($model['ref'], $model['project_name'])]);
                        } else {
                            echo "-";
                        }
                        ?>

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

    <!-- กราฟิก -->
    <div class="box-graphic">
        <div style=" padding: 10px; border-radius: 10px; position: relative; margin-top: 20px; background: #d983b2;">
            <h4 class="head-title-view" style=" color: #ffffff; font-weight: bold;"><b>กราฟิก / ใบสั่งงาน</b></h4>
            <?php
            if ($graphic) {
                ?>
                <label style="margin-left: 10px; font-weight: bold; color: #ffffff;">รายละเอียดใบสั่งงาน</label>
                <?php if ($graphic['detail']) { ?>
                    <div class="alert alert-dark" style=" padding: 5px; padding-left: 15px; color: #ffffff; background: #d45f93; border:0px;">
                        <div class="boxdetailgf">
                            <?php echo $graphic['detail'] ?>
                        </div>
                        <div class="table-responsive" style="border-radius: 10px; border:solid 0px #000000; display: flex; flex-wrap: nowrap;text-overflow: auto; width: 100%;" id="showImgGraphic"></div>
                    </div>
                <?php } ?>
                <?php if ($filegraphic) { ?>
                    <label style="margin-left: 10px; font-weight: bold; color: #ffffff; width: 100%;">ไฟล์งาน / ตัวอย่างงาน</label>
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
                <?php } ?>
                <?php
                if (isset($graphic['user_id'])) {
                    $gName = dektrium\user\models\Profile::findOne(['user_id' => $graphic['user_id']])['name'];
                    if ($gName) {
                        ?>
                        <hr/>
                        <label style="color: #ffffff;"><i class="fa fa-user text-warning"></i> โดย::<?php echo $gName ?></label>
                    <?php } ?>
                <?php } ?>
            <?php } ?>
        </div>
    </div>


    <div id="boxImgDetail" style=" display: none;">
        <?php echo $model['detail'] ?>
    </div>

    <div id="boxImgGraphic" style="display: none;">
        <?php echo $graphic['detail'] ?>
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
                //$("#box-popup-left-view-all").css({"height": h - 128});
                //$("#box-popup-right-view-all").css({"height": h - 128});
                //$("#box-timeline-view-all").css({"height": h - 128});
            }
        }
    });


    function setImg() {
        $("#boxdetailcustomer p img:last-child").remove()
        var imgs = $('#boxImgDetail p').children('img').map(function() {
            return $(this).attr('src')
        }).get();

        for (var i = 0; i < imgs.length; i++) {
            let imgUrl = imgs[i];
            $("#showImg").append("<a class='fancyboxdetail' rel='gallery1' href='" + imgUrl + "' title='แบบงาน/ตัวอย่างงาน'><div class='img-crop-detail' style='background-image: url(" + imgUrl + ");'></div></a>");
        }
    }

    function setImgGraphic() {
        $(".boxdetailgf p img:last-child").remove()
        var imgs = $('#boxImgGraphic p').children('img').map(function() {
            return $(this).attr('src')
        }).get();

        for (var i = 0; i < imgs.length; i++) {
            let imgUrl = imgs[i];
            $("#showImgGraphic").append("<a class='fancyboxGraphic' rel='gallery1' href='" + imgUrl + "' title='แบบงาน/ตัวอย่างงาน'><div class='img-crop-detail' style='background-image: url(" + imgUrl + ");'></div></a>");
        }

    }
</script>
