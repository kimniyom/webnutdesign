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
<div class="row" style="margin: 0px; margin-bottom: 30px; margin-top: 20px;">
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-12 col-lg-6 col-12" style=" padding: 0px;">
                <div class="alert alert-dark box-list-work" role="alert"  style=" background: #ffffff; font-family: skv; margin:10px 20px;">
                    <div class="row" style=" margin: 0px;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-9">
                            <div style="height: 39px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                <h2 class="alert-heading">
                                    <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rs['project_name'] ?></a>
                                </h2>
                            </div>
                            <h3 class="alert-heading" style=" font-weight: normal;">ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></h3>
                            <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php echo $rs['customer'] ?></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-3">
                            <div class="btn-work-nut-send" onclick="updateStatus('<?php echo $rs['ref'] ?>')">
                                <div class="vertical-center">
                                    <ion-icon name="color-wand-outline" style="float: left;"></ion-icon> ส่งมอบงาน
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
        if (w < 768) {
            $(".status-work").removeClass('mb-0 pull-right');
            $(".status-work").css({"width": "100%", "margin-top": "10px"});
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