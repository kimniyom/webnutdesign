<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;
use app\models\GraphicLog;

$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
//$this->title = 'รับงาน';
//$this->params['breadcrumbs'][] = $this->title;
?>

<!--
งานที่ส่งมาจากแผนกอื่นยังไม่มีคนรับ
-->

<div class="row" style="margin: 0px; margin-top: 0px; margin-bottom: 10px;">
    <input type="hidden" id="_ref"/>
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-6 col-lg-6" style=" padding: 0px;">
                <div class="alert alert-dark box-list-work">
                    <div>
                        <div style=" width: 80%; float: left;">
                            <div class="control-head-box">
                                <div class="alert-heading" >
                                    <span class="text-gf-head"  style=" font-weight: bold; color: #FFFFFF; cursor: pointer; line-height: 35pt;" onclick="getViews('<?php echo $rs['ref'] ?>', '<?php echo $rs['status'] ?>')"><?php echo $rs['project_name'] ?></span>
                                </div>
                            </div>
                            <div style="height: 20px; overflow: hidden; clear: both; ">
                                <div class="text-tran-customer" style=" font-weight: bold; color:#FFFFFF;"><i class="far fa-user-circle"></i> <?php echo ($rs['customer']) ? $rs['customer'] : "-"; ?></div>
                            </div>
                        </div>

                        <div style="float: right; position: absolute; top: 5px; right: 15px;">
                            <!-- ถ้ามีการรับงานแล้ว -->
                            <?php if ($rs['status'] == "2") { ?>
                                <?php if ($rs['status'] != "4") { ?>
                                    <a id="btn-list" class="btn btn-rounded btn-dark btn-sm pull-right active-false"
                                       onclick="popupConfirm('<?php echo $rs['ref'] ?>')">เสร็จแล้ว </a>
                                   <?php } else { ?>
                                    <a class="btn btn-rounded btn-rounded btn-dark btn-sm pull-right active-true" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; width: 100%; height: 20px; cursor: default;">
                                        <span  style="background: #cf1b76; border-radius: 10px; width: 30px; height: 20px; position: absolute; right: 0px; top: 0px;"></span>
                                    </a>
                                <?php } ?>
                            <?php } else { ?>
                                <a class="btn btn-rounded btn-rounded btn-dark btn-sm pull-right disabled" id="btn-list">
                                    เสร็จแล้ว
                                </a>
                            <?php } ?>
                        </div>
                    </div>

                    <div style=" clear: both; border-top: solid 3px #eac0d6; padding-top: 10px;">
                        <div style=" float: left; width: 65%;">
                            <?php
                            if ($rs['level'] == 1) {
                                $text = "ระดับ 1";
                                $color = "green";
                                $percent = "25%";
                            } else if ($rs['level'] == 2) {
                                $text = "ระดับ 2";
                                $color = "green";
                                $percent = "40%";
                            } else if ($rs['level'] == 3) {
                                $text = "ระดับ 3";
                                $color = "yellow";
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
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchlaser/updatestatus']) ?>";
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
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchlaser/editwork']) ?>";
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