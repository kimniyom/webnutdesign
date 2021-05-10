
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
use app\models\GraphicLog;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
//$this->title = 'รับงาน';
//$this->params['breadcrumbs'][] = $this->title;
?>

<!--
งานที่รับเห็นเฉพาะของ User
-->
<div class="row" style="margin: 0px; margin-top: 0px; margin-bottom: 10px;">
    <?php if (Yii::$app->user->identity->status == "U") { ?>
        <?php if ($dataListjob) { ?>
            <?php
            foreach ($dataListjob as $rss):
                ?>
                <div class="col-md-6 col-lg-6" style=" padding: 0px;">
                    <div class="alert alert-dark box-list-work" role="alert" style="background: #666666; font-family: skv; margin: 10px; border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px; padding-bottom: 25px;">
                        <div>
                            <div style=" width: 80%; float: left;">
                                <div style="height: 45px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                    <h2 class="alert-heading" >
                                        <span class="text-gf-head"  style=" font-weight: bold; color: #FFFFFF; cursor: pointer; line-height: 35pt;" onclick="getViews('<?php echo $rss['ref'] ?>')"><?php echo $rss['project_name'] ?></span>
                                    </h2>
                                </div>
                            </div>
                        </div>

                        <!--
                        <div class="row">
                            <div class="col-md-8 col-lg-8 col-sm-8 col-6">
                                <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php //echo $rss['project_name']                                ?></h2>
                                <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php //echo $ConfigWeb->thaidate($rss['date_getjob'])                                ?> <?php //echo $rss['time_getjob']                                ?></h3>
                                <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php //echo $rss['customer']                                ?></h4>
                            </div>
                            <div class="col-md-4 col-lg-4 col-sm-4 col-6">

                                <div class="btn-work-nut-success" onclick="updateStatus('<?php //echo $rss['ref']                                ?>', '4')" >
                                    <div class="vertical-center">
                                        ยืนยันการผลิต
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <a href="javascript:getViews('<?php //echo $rss['ref']                                ?>')" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
                        <p class="mb-0 pull-right status-work" style="text-align: center;">สถานะล่าสุด <br/> <?php //echo $TimeLineModel->getLastTimeline($rss['ref'])                                ?></p>
                        -->


                    </div>
                </div>
            <?php endforeach; ?>
        <?php } else { ?>
            <div class="container">
                <div class="alert alert-danger" style="text-align: center">ไม่มีงานค้าง</div>
            </div>
        <?php } ?>
    <?php } ?>
</div>
<!--
งานที่ส่งมาจากแผนกอื่นยังไม่มีคนรับ
-->

<input type="hidden" id="_ref"/>
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
                                    <span class="text-gf-head"  style=" font-weight: bold; color: #FFFFFF; cursor: pointer; line-height: 35pt;" onclick="getViews('<?php echo $rs['ref'] ?>', '<?php echo $rs['status'] ?>')"><?php echo $rs['project_name'] ?></span>
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

                    <!--

                    <div class="row">
                        <div class="col-md-8 col-lg-8 col-sm-8 col-6">
                            <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php //echo $rs['project_name']                             ?></h2>
                            <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php //echo $ConfigWeb->thaidate($rs['date_getjob'])                             ?> <?php //echo $rs['time_getjob']                             ?></h3>
                            <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php //echo $rs['customer']                             ?></h4>
                        </div>
                        <div class="col-md-4 col-lg-4 col-sm-4 col-6">
                    <?php //if ($rs['status'] == "1") { ?>
                                <div class="btn-work-nut-send" onclick="updateStatus('<?php //echo $rs['ref']                             ?>', '2')">
                                    <div class="vertical-center">
                                        รับงาน
                                    </div>
                                </div>
                                <div class="btn-work-nut-edit" onclick="editWork('<?php //echo $rs['ref']                             ?>')" >
                                    <div class="vertical-center">
                                        ส่งแก้ไข
                                    </div>
                                </div>
                    <?php //} else if ($rs['status'] == "2") { ?>
                                <div class="btn-work-nut-success" onclick="updateStatus('<?php //echo $rs['ref']                             ?>', '4')" >
                                    <div class="vertical-center">
                                        ยืนยันการผลิต
                                    </div>
                                </div>
                    <?php //} ?>
                        </div>
                    </div>
                    -->
                </div>
            </div>
        <?php endforeach; ?>
    <?php } else { ?>
        <div class="container">
            <div class="alert alert-primary" style="text-align: center">ไม่มีงานส่งมา</div>
        </div>
    <?php } ?>
</div>

<!-- Popup EditWork -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupeditwork" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="position: relative;">
            <div class="modal-header bg-danger">
                <h5 class="modal-title text-white">รายละเอียดที่ต้องแก้ไขงาน</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <h3><i class="fa fa-info fa-2x"></i> ระบุสาเหตุ</h3>
                <input type="hidden" name="" id="ref_cancel">
                <ul class="list-group">
                    <?php foreach ($maseditwork as $cl): ?>
                        <li class="list-group-item" style="font-size: 18px;">
                            <input type="radio" name="typeedit" value="<?php echo $cl['id'] ?>" onclick="setVal()"> <?php echo $cl['name'] ?>
                        </li>
                    <?php endforeach; ?>
                    <li class="list-group-item" style="font-size: 18px;" onclick="setVal()">
                        <input type="radio" name="typeedit" value="99" > อื่น ๆ
                        <textarea class="form-control" rows="5" placeholder="รายละเอียดที่ต้องแก้ไขงาน..." style="display: none;" id="etc"></textarea>
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-block" onclick="confirmEdit()">ยืนยันรายการ <i class="far fa-arrow-alt-circle-right"></i></button>
            </div>
        </div>
    </div>
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

    function updateStatus() {
        var ref = $("#_ref").val();
        Swal.fire({
            icon: 'info',
            title: "ยืนยัน",
            showDenyButton: true,
            //showCancelButton: true,
            confirmButtonText: `ตกลง`,
            denyButtonText: `cancel`,
            allowOutsideClick: false
        }).then((result) => {
            if (result.isConfirmed) {
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchprint/updatestatus']) ?>";
                var data = {status: 2, ref: ref};
                $.post(url, data, function(res) {
                    $("#popupaddwork").modal("hide");
                    getJob();
                });
            }
        });

    }


    function editWork(ref) {
        $("#ref_cancel").val(ref);
        $("#popupeditwork").modal();
    }

    function confirmEdit() {
        var ref = $("#ref_cancel").val();
        var type = $('input[name="typeedit"]:checked').val();
        //alert(type);
        var etc = $("#etc").val();
        if (type == 99) {
            if (etc == "") {
                Swal.fire('Warning!', 'กรุณาระบุสาเหตุ...', 'warning');
                return false;
            }
        }

        if (!type) {
            Swal.fire('Warning!', 'กรุณาเลืกสาเหตุ...', 'warning');
            return false;
        }
        Swal.fire({
            icon: 'warning',
            title: 'ยืนยันรายการ...?',
            text: 'คุณแน่ใจหรือไม่ที่จะดำเนินรายการต่อ...?',
            showDenyButton: false,
            showCancelButton: true,
            confirmButtonText: `ตกลง`,
            //denyButtonText: `Don't save`,
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                //Swal.fire('Success!', '', 'success');
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchprint/editwork']) ?>";
                var data = {
                    ref: ref,
                    type: type,
                    typeetc: etc
                };
                $.post(url, data, function(res) {
                    if (res == 1) {
                        window.location.reload();
                    }
                });

            }
        });
    }

    function setVal() {
        var type = $('input[name="typeedit"]:checked').val();
        if (type == 99) {
            $("#etc").show();
        } else {
            $("#etc").hide();
        }
    }
</script>