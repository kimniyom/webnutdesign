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
งานที่ส่งมาจากแผนกอื่นยังไม่มีคนรับ
-->
<a href="<?php echo Yii::$app->urlManager->createUrl(['setup/index']) ?>" style=" text-decoration: none;">
    <button type="button" class="btn btn-rounded btn-dark btn-outline" style=" margin-left: 30px;">
        <i class="fa fa-arrow-circle-left"></i> ออกจากหน้าค้นหา
    </button></a>
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
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchprint/updatestatus']) ?>";
                var data = {status: status, ref: ref};
                $.post(url, data, function(res) {
                    getJob();
                });
            }
        });

    }

</script>