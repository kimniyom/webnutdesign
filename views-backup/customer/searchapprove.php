<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/approve.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;

$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
?>

<!--
lส่งมอบงาน
-->
<div style=" height: 20px; width: 100%;"></div>
<a href="<?php echo Yii::$app->urlManager->createUrl(['customer/approve']) ?>" style=" text-decoration: none;">
    <button type="button" class="btn btn-rounded btn-dark btn-outline" style=" margin-left: 20px;">
        <i class="fa fa-arrow-circle-left"></i> ออกจากหน้าค้นหา
    </button></a>
<div class="row" style="margin: 0px; margin-bottom: 30px; margin-top: 10px;">
    <?php if (isset($dataList)) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-6 col-lg-4 col-12" style=" padding: 0px;">
                <div class="alert alert-dark box-list-work" role="alert"  style=" background: #d25fa0; font-family: skv; margin:10px 20px; border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px;">
                    <div class="row" style=" margin: 0px;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-9">
                            <div style="height: 35px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                <h3 class="alert-heading">
                                    <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" style=" font-weight: bold; color: #FFFFFF; line-height: 10pt;"><?php echo $rs['customer'] ?></a>
                                </h3>
                            </div>
                            <h4 class="alert-heading" style=" font-weight: normal; color: #FFFFFF;">ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-3">
                            <div class="btn-work-nut-send" onclick="updateStatus('<?php echo $rs['ref'] ?>')">
                                <div class="vertical-center">
                                    ส่งงาน
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php } else { ?>
        <div class="container">
            <div class="alert alert-primary" style="text-align: center">ไม่มีงานส่งมา</div>
        </div>
    <?php } ?>
</div>


<script type="text/javascript">
    setStatusWork();
    function setStatusWork() {
        var w = window.innerWidth;
        if (w < 1204) {
            $(".status-work").removeClass('mb-0 pull-right');
            $(".status-work").css({"width": "100%", "margin-top": "10px"});
        } else {
            $(".btn-work-nut-send").css({"font-size": "20px"});
        }
    }

    function updateStatus(ref) {
        var title = "ยืนยันการส่งมอบ..?";
        Swal.fire({
            icon: 'info',
            title: title,
            showDenyButton: true,
            //showCancelButton: true,
            confirmButtonText: `ตกลง`,
            denyButtonText: `cancel`,
            allowOutsideClick: false
        }).then((result) => {
            if (result.isConfirmed) {
                var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/approveconfirm']) ?>";
                var data = {ref: ref};
                $.post(url, data, function(res) {
                    getJob();
                });
            }
        });
    }

</script>