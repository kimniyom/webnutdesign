<style>
    .meter {
        box-sizing: content-box;
        height: 15px; /* Can be anything */
        position: relative;
        margin: 0px 0 0px 0; /* Just for demo spacing */
        background: #555;
        border-radius: 25px;
        padding: 2px;
        box-shadow: inset 0 -1px 1px rgba(255, 255, 255, 0.3);
    }
    .meter > span {
        display: block;
        height: 100%;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        background-color: rgb(43, 194, 83);
        background-image: linear-gradient(
            center bottom,
            rgb(43, 194, 83) 37%,
            rgb(84, 240, 84) 69%
            );
        box-shadow: inset 0 2px 9px rgba(255, 255, 255, 0.3),
            inset 0 -2px 6px rgba(0, 0, 0, 0.4);
        position: relative;
        overflow: hidden;
    }
    .meter > span:after,
    .animate > span > span {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        background-image: linear-gradient(
            -45deg,
            rgba(255, 255, 255, 0.2) 25%,
            transparent 25%,
            transparent 50%,
            rgba(255, 255, 255, 0.2) 50%,
            rgba(255, 255, 255, 0.2) 75%,
            transparent 75%,
            transparent
            );
        z-index: 1;
        background-size: 50px 50px;
        animation: move 2s linear infinite;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        overflow: hidden;
    }
    .animate > span:after {
        display: none;
    }
    .orange > span {
        background-image: linear-gradient(#f1a165, #f36d0a);
    }

    .red > span {
        background-image: linear-gradient(#ff0000, #f42323);
    }

    .nostripes > span > span,
    .nostripes > span::after {
        background-image: none;
    }

    @media screen and (max-device-width: 768px) {
        /* STYLES HERE */
        .text-gf-head{
            font-size: 20px;
        }

        .alert-heading{
            margin-top: -10px;
        }
    }

    @media screen and (min-device-width: 769px) and (max-device-width: 1024px) {
        /* STYLES HERE */
        .text-gf-head{
            font-size: 20px;
        }

        .alert-heading{
            margin-top: -10px;
        }
    }

    .active-false{
        background-image:linear-gradient(to right, #cf1b76, #666666);
    }

    .active-true{
        background-image:linear-gradient(to right, #ffff00, #cf1b76);
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

<input type="hidden" id="_ref"/>
<a href="<?php echo Yii::$app->urlManager->createUrl(['branchlaser/index']) ?>" style=" text-decoration: none;">
    <button type="button" class="btn btn-rounded btn-dark btn-outline" style=" margin-left: 30px;">
        <i class="fa fa-arrow-circle-left"></i> ออกจากหน้าค้นหา
    </button></a>
<div class="row" style="margin: 0px; margin-top: 0px; margin-bottom: 10px;">
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-6 col-lg-6" style=" padding: 0px;">
                <div class="alert alert-dark box-list-work" role="alert" style="background: #666666; font-family: skv; margin: 10px; border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px; padding-bottom: 25px;">
                    <div>
                        <div style=" width: 80%; float: left;">
                            <div style="height: 45px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                <h2 class="alert-heading" >
                                    <span class="text-gf-head"  style=" font-weight: bold; color: #FFFFFF; cursor: pointer; line-height: 35pt;" onclick="getViews('<?php echo $rs['ref'] ?>', '<?php echo $rs['status'] ?>')"><?php echo $rs['customer'] ?></span>
                                </h2>
                            </div>
                        </div>

                        <div style="float: right; position: absolute; top: 5px; right: 15px;">
                            <!-- ถ้ามีการรับงานแล้ว -->
                            <?php if ($rs['status'] == 2) { ?>
                                <?php if ($rs['status'] != 4) { ?>
                                    <a id="btn-list" class="btn btn-rounded btn-dark btn-sm pull-right active-false" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px;width: 100%;" onclick="popupConfirm('<?php echo $rs['ref'] ?>')">เสร็จแล้ว </a>
                                <?php } else { ?>
                                    <a class="btn btn-rounded btn-rounded btn-dark btn-sm pull-right active-true" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; width: 100%; height: 20px; cursor: default;">
                                        <span  style=" background: #cf1b76; border-radius: 10px; width: 30px; height: 20px; position: absolute; right: 0px; top: 0px;"></span>
                                    </a>
                                <?php } ?>
                            <?php } else { ?>
                                <a class="btn btn-rounded btn-rounded btn-dark btn-sm pull-right" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; width: 100%; height: 20px; cursor: default;">
                                    เสร็จแล้ว
                                </a>
                            <?php } ?>
                        </div>
                    </div>

                    <div style=" clear: both; border-top: solid 3px #8a8a8a; padding-top: 10px;">
                        <div style=" float: left; width: 65%;">
                            <?php
                            if ($rs['fast'] == 1) {
                                $text = "ด่วนสำคัญ";
                                $color = "red";
                                $percent = "100%";
                            } else {

                                if ($rs['level'] == 1) {
                                    $text = "ระดับ 1";
                                    $color = "green";
                                    $percent = "25%";
                                } else if ($rs['level'] == 2) {
                                    $text = "ระดับ 2";
                                    $color = "orange";
                                    $percent = "35%";
                                } else if ($rs['level'] == 3) {
                                    $text = "ระดับ 3";
                                    $color = "orange";
                                    $percent = "50%";
                                } else if ($rs['level'] == 4) {
                                    $text = "ด่วน";
                                    $color = "red";
                                    $percent = "65%";
                                } else {
                                    $text = "ด่วนมาก";
                                    $color = "red";
                                    $percent = "80%";
                                }
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
</script>
