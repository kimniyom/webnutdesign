<style>

</style>
<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;
use app\models\GraphicLog;

$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
$GraphicLog = new GraphicLog();
//$this->title = 'รับงาน';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" style="margin: 0px; margin-top: 0px; margin-bottom: 10px;">
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            $flag = $GraphicLog->getFlag($rs['ref']);
            ?>
            <div class="col-md-6 col-lg-6" style=" padding: 0px;">
                <div class="alert alert-dark box-list-work" role="alert" style="background: #d25fa0; font-family: skv; margin: 10px; border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px; padding-bottom: 25px;">
                    <?php if ($flag == 1) { ?>
                        <div class="badge" style=" padding: 10px 15px; border-radius: 15px; background: red; position: absolute; top: -10px; right: -10px; text-align: center;"><i class="fa fa-info" style="color:#ffffff;"></i></div>
                    <?php } ?>
                    <div>
                        <div style=" width: 80%; float: left;">
                            <div style="height: 45px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                <div class="alert-heading" >
                                    <span class="text-gf-head"  style=" font-weight: bold; color: #FFFFFF; cursor: pointer; line-height: 35pt;" onclick="getViews('<?php echo $rs['ref'] ?>')"><?php echo $rs['project_name'] ?></span>
                                </div>
                            </div>
                            <div style="height: 20px; overflow: hidden; clear: both; ">
                                <div class="text-tran-customer" style=" font-weight: bold; color:#FFFFFF;"><i class="far fa-user-circle"></i> <?php echo ($rs['customer']) ? $rs['customer'] : "-"; ?></div>
                            </div>
                        </div>
                        <div style="float: right; position: absolute; top: 5px; right: 15px;">
                            <!-- ถ้ามีการรับงานแล้ว -->
                            <?php if ($rs['status'] == 1) { ?>
                                <a class="btn btn-rounded btn-dark btn-sm pull-right active-true" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; height: 20px; cursor: default;">
                                    เสร็จแล้ว
                                    <div style=" background: #cf1b76; border-radius: 10px; width: 30px; height: 20px; position: absolute; right: 0px; top: 0px; "></div>
                                </a>
                            <?php } else { ?>

                                <a href="<?php echo \yii\helpers\Url::to(['graphic/formupdate', 'ref' => $rs['ref']]) ?>" id="btn-list" class="btn btn-rounded btn-dark btn-sm pull-right " style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px;width: 100%;">เสร็จแล้ว </a>
                                <!--
                                    <a id="btn-list" class="btn btn-rounded btn-dark btn-sm pull-right " style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px;width: 100%;" onclick="popupOrder('<?php //echo $rs['ref']                   ?>')">เสร็จแล้ว </a>
                                -->
                            <?php } ?>


                            <!-- ส่งผลิตต้องออกแบบก่อน -->
                            <div style=" clear: both; position: relative;">
                                <?php if ($rs['status'] == 1) { ?>
                                    <?php if ($rs['approver'] == 1) { ?>
                                        <a class="btn btn-rounded btn-dark btn-sm pull-right active-true" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px;  height: 20px; cursor: default; margin-top: 5px;">
                                            เสร็จแล้ว
                                            <div style=" background: #cf1b76; border-radius: 10px; width: 30px; height: 20px; position: absolute; right: 0px; top: 5px; "></div>
                                        </a>
                                    <?php } else { ?>
                                        <a class="btn btn-rounded btn-dark btn-sm pull-right" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; clear: both; width: 100%; margin-top: 5px;" onclick="popupSendWork('<?php echo $rs['ref'] ?>')">ส่งผลิต </a>
                                    <?php } ?>
                                <?php } else { ?>
                                    <a class="btn btn-rounded btn-dark btn-sm pull-right disabled" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; clear: both; width: 100%; margin-top: 5px;">ส่งผลิต </a>
                                <?php } ?>
                            </div>

                        </div>
                    </div>
                    <div style=" clear: both; border-top: solid 3px #eac0d6; padding-top: 10px;">
                        <div style=" float: left; width: 65%;">
                            <?php
                            if ($rs['level'] == 1) {
                                $text = "ระดับ 1";
                                $color = "green";
                                $percent = "30%";
                            } else if ($rs['level'] == 2) {
                                $text = "ระดับ 2";
                                $color = "green";
                                $percent = "40%";
                            } else if ($rs['level'] == 3) {
                                $text = "ระดับ 3";
                                $color = "orange";
                                $percent = "60%";
                            } else if ($rs['level'] == 4) {
                                $text = "ด่วน";
                                $color = "red";
                                $percent = "80%";
                            } else {
                                $text = "ด่วนมาก";
                                $color = "red";
                                $percent = "100%";
                            }
                            ?>
                            <div class="meter <?php echo $color ?> nostripes">
                                <span style="width: <?php echo $percent ?>; font-size: 12px; color: #FFFFFF; text-align: center; letter-spacing: 1px;">
                                    <?php echo $text ?>
                                </span>
                            </div>
                        </div>
                        <p class="mb-0 pull-right" style="text-align: center; color: #ffffff;">ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></p>
                    </div>
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
        if (w < 768) {
            $(".status-work").removeClass('mb-0 pull-right');
            $(".status-work").css({"width": "100%", "margin-top": "10px"});
        }
    }

    function popupSendWork(ref) {
        var title = "ยืนยันส่งผลิต..?";
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
                var url = "<?php echo Yii::$app->urlManager->createUrl(['graphic/sendwork']) ?>";
                var data = {ref: ref};
                $.post(url, data, function(res) {
                    getJob();
                });
            }
        });
    }
</script>