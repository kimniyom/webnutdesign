<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/branchprint.css" rel="stylesheet">
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
<?php if (Yii::$app->user->identity->status == "U") { ?>
    <?php if ($dataListjob) { ?>
        <?php
        foreach ($dataListjob as $rss):
            ?>
            <div class="alert alert-dark box-list-work " role="alert"  style=" background: #ffffff;">
                <div class="row">
                    <div class="col-md-8 col-lg-8 col-sm-8 col-6">
                        <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rss['project_name'] ?></h2>
                        <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php echo $ConfigWeb->thaidate($rss['date_getjob']) ?> <?php echo $rss['time_getjob'] ?></h3>
                        <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php echo $rss['customer'] ?></h4>
                    </div>
                    <div class="col-md-4 col-lg-4 col-sm-4 col-6">

                        <div class="btn-work-nut-success" onclick="updateStatus('<?php echo $rss['ref'] ?>', '4')" >
                            <div class="vertical-center">
                                ยืนยันการผลิต
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <a href="javascript:getViews('<?php echo $rss['ref'] ?>')" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
                <p class="mb-0 pull-right status-work" style="text-align: center;">สถานะล่าสุด <br/> <?php echo $TimeLineModel->getLastTimeline($rss['ref']) ?></p>
            </div>
        <?php endforeach; ?>
    <?php } else { ?>
        <div class="container">
            <div class="alert alert-danger" style="text-align: center">ไม่มีงานค้าง</div>
        </div>
    <?php } ?>
<?php } ?>

<!--
งานที่ส่งมาจากแผนกอื่นยังไม่มีคนรับ
-->
<?php if ($dataList) { ?>
    <?php
    foreach ($dataList as $rs):
        ?>
        <div class="alert alert-dark box-list-work " role="alert"  style=" background: #ffffff;">
            <div class="row">
                <div class="col-md-8 col-lg-8 col-sm-8 col-6">
                    <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rs['project_name'] ?></h2>
                    <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo $rs['time_getjob'] ?></h3>
                    <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php echo $rs['customer'] ?></h4>
                </div>
                <div class="col-md-4 col-lg-4 col-sm-4 col-6">
                    <?php if ($rs['status'] == "1") { ?>
                        <div class="btn-work-nut-send" onclick="updateStatus('<?php echo $rs['ref'] ?>', '2')">
                            <div class="vertical-center">
                                รับงาน
                            </div>
                        </div>
                        <div class="btn-work-nut-edit" onclick="editWork('<?php echo $rs['ref'] ?>')" >
                            <div class="vertical-center">
                                ส่งแก้ไข
                            </div>
                        </div>
                    <?php } else if ($rs['status'] == "2") { ?>
                        <div class="btn-work-nut-success" onclick="updateStatus('<?php echo $rs['ref'] ?>', '4')" >
                            <div class="vertical-center">
                                ยืนยันการผลิต
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
            <hr>
            <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
            <p class="mb-0 pull-right status-work" style="text-align: center;">สถานะล่าสุด <br/> <?php echo $TimeLineModel->getLastTimeline($rs['ref']) ?></p>
        </div>
    <?php endforeach; ?>
<?php } else { ?>
    <div class="container">
        <div class="alert alert-primary" style="text-align: center">ไม่มีงานส่งมา</div>
    </div>
<?php } ?>

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

    function updateStatus(ref, status) {
        var title = "";
        if (status == 2) {
            title = "ยืนยันการรับงาน..?";
        } else if (status == 4) {
            title = "ยืนยันการผลิตงานเสร็จ";
        }
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
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchfacture/updatestatus']) ?>";
                var data = {status: status, ref: ref};
                $.post(url, data, function(res) {
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
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchfacture/editwork']) ?>";
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