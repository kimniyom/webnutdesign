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
<div class="row" style="margin: 0px; margin-bottom: 30px; margin-top: 10px; padding: 0px 10px;">
    <?php if (isset($dataList)) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-6 col-lg-4 col-12" style=" padding: 0px;">
                <div class="alert alert-dark box-list-work" role="alert"  style=" background: #d25fa0; font-family: skv; margin:10px 10px; border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px;">
                    <div class="row" style=" margin: 0px;">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-9">
                            <div style="height: 40px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                <div class="text-tran-head">
                                    <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" style=" font-weight: bold; color: #FFFFFF; line-height: 10pt;"><?php echo $rs['project_name'] ?></a>
                                </div>
                            </div>
                            <div style="height: 20px; overflow: hidden; clear: both; ">
                                <div class="text-tran-customer" style=" font-weight: bold; color:#FFFFFF;"><i class="far fa-user-circle"></i> <?php echo ($rs['customer']) ? $rs['customer'] : "-"; ?></div>
                            </div>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-3">
                            <div class="btn-work-nut-send" onclick="updateStatus('<?php echo $rs['ref'] ?>')">
                                <div class="vertical-center">
                                    ส่งมอบ
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr style=" border-top: solid 3px #eac0d6; height: 3px; margin-top: 5px; margin-bottom: 5px;">
                    <div class="send-heading " style=" font-weight: normal; text-align: right; color: #ffffff;">ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo substr($rs['time_getjob'],0,5) ?></div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php } else { ?>
        <div class="container">
            <div class="alert alert-primary" style="text-align: center">ไม่มีงานค้าง</div>
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