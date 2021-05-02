<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/setup.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
//$this->title = 'รับงาน';
//$this->params['breadcrumbs'][] = $this->title;
?>

<!--
คิวติดตั้ง
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
                    <?php if ($rs['approve'] == "0") { ?>
                        <div class="btn-work-nut-send" onclick="updateStatus('<?php echo $rs['ref'] ?>')">
                            <div class="vertical-center">
                                <ion-icon name="color-wand-outline" style="float: left;"></ion-icon> รับงาน
                            </div>
                        </div>
                    <?php } else if ($rs['approve'] == "1") { ?>
                        <a href="<?php echo Yii::$app->urlManager->createUrl(['setup/update', 'ref' => $rs['ref']]) ?>">
                            <div class="btn-work-nut-success">
                                <div class="vertical-center">
                                    <ion-icon name="bulb-outline" style="float: left;"></ion-icon> ยืนยันการติดตั้ง
                                </div>
                            </div></a>
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