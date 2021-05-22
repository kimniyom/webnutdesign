<style>
    .text-tran-head{
        font-size: 26px;
    }

    .send-heading{
        font-size: 14px;
    }

    .text-tran-customer{
        font-size: 16px;
    }
    @media screen and (max-width: 768px) {
        /* STYLES HERE */
        .text-tran-head{
            font-size: 20px;
        }

        .text-tran-customer{
            font-size: 14px;
        }

        .alert-heading{
            margin-top: -10px;
        }

        .send-heading{
            font-size: 14px;
        }

        .box-title-tran{
            height: 20px;
        }
    }


    @media screen and (min-width: 769px) and (max-width: 1024px) {
        /* STYLES HERE */
        .text-tran-head{
            font-size: 20px;
            line-height: 10pt;
        }

        .text-tran-customer{
            font-size: 14px;
        }

        .alert-heading{
            margin-top: -10px;
        }

        .send-heading{
            font-size: 14px;
        }

        .box-title-tran{
            height: 30px;
        }


    }
</style>
<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;

$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
?>

<!--
คิวติดตั้ง
-->
<div class="row" style=" margin: 0px;">
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-6 col-lg-6" style="margin: 0px; padding: 0px;">
                <div class="alert alert-dark box-list-work " role="alert"  style=" background: #d25fa0; font-family: skv; margin: 10px; border:none; border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px;">
                    <div class="row">
                        <div class="col-md-9 col-lg-9 col-sm-9 col-9">
                            <div style=" width: 100%; float: left;">
                                <div class="box-title-tran" style="height: 45px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                    <div class="alert-heading" >
                                        <div class="text-tran-head"  style=" font-weight: bold; cursor: pointer; line-height: 35pt; color: #FFFFFF;" onclick="getViews('<?php echo $rs['ref'] ?>')"><?php echo $rs['project_name'] ?></div>
                                    </div>
                                </div>
                                <div style="height: 20px; overflow: hidden; clear: both; ">
                                    <div class="text-tran-customer" style=" font-weight: bold; color:#FFFFFF;"><i class="far fa-user-circle"></i> <?php echo ($rs['customer']) ? $rs['customer'] : "-"; ?></div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-3">
                            <a href="<?php echo Yii::$app->urlManager->createUrl(['transport/update', 'ref' => $rs['ref']]) ?>" class="pull-right">
                                <button type=" button" class="btn btn-dark"> บันทึกจัดส่ง</button>
                            </a>
                        </div>
                    </div>
                    <hr style=" border-top: solid 3px #eac0d6; height: 3px; margin-top: 5px; margin-bottom: 5px;">
                    <div class="send-heading " style=" font-weight: normal; text-align: right; color: #ffffff;">ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php } else { ?>
        <div class="col-md-12 col-lg-12">
            <div class="container">
                <div class="alert alert-primary" style="text-align: center">ไม่มีงานส่งมา</div>
            </div>
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
        var title = "ยืนยันการรับงาน..?";

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
                var url = "<?php echo Yii::$app->urlManager->createUrl(['setup/updatestatus']) ?>";
                var data = {status: status, ref: ref};
                $.post(url, data, function(res) {
                    getJob();
                });
            }
        });
    }

</script>