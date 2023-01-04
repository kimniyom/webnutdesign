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
$GraphicLog = new GraphicLog();
//$this->title = 'รับงาน';
//$this->params['breadcrumbs'][] = $this->title;
?>
<a href="<?php echo Yii::$app->urlManager->createUrl(['graphic/index']) ?>" style=" text-decoration: none;">
    <button type="button" class="btn btn-rounded btn-dark btn-outline" style=" margin-left: 30px;">
        <i class="fa fa-arrow-circle-left"></i> ออกจากหน้าค้นหา
    </button></a>
<?php if ($dataList) { ?>
    <?php
    foreach ($dataList as $rs):
        $flag = $GraphicLog->getFlag($rs['ref']);
        ?>
        <div class="alert alert-dark box-list-work" role="alert" style="background: none;">
            <?php if ($flag == 1) { ?>
                <div class="badge" style=" padding: 10px 15px; border-radius: 15px; background: red; position: absolute; top: -10px; right: -10px; text-align: center;"><i class="fa fa-info" style="color:#ffffff;"></i></div>
            <?php } ?>
            <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rs['project_name'] ?></h2>
            <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo $rs['time_getjob'] ?></h3>
            <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php echo $rs['customer'] ?></h4>
            <hr>
            <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
            <!-- ถ้ามีการรับงานแล้ว -->
            <?php if($rs['status'] == 1){ ?>
                <!-- แก้ไขเฉพาะงานตัวเองรับได้ -->
                <?php if(Yii::$app->user->identity->id == $rs['user_id'] || Yii::$app->user->identity->status == "A"){ ?>
                    <a href="<?php echo Yii::$app->urlManager->createUrl(['graphic/update', 'ref' => $rs['ref']]) ?>" class="btn btn-rounded btn-warning">รับงาน / แก้ไขงาน<i class="fas fa-pencil-alt"></i></a>
                <?php } else { ?>
                    <button type="button" class="btn btn-rounded btn-warning disabled">ไม่ได้รับสิทธิ์ <i class="fas fa-info"></i></button>
                <?php } ?>
            <?php } else { ?>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['graphic/update', 'ref' => $rs['ref']]) ?>" class="btn btn-rounded btn-warning">รับงาน / แก้ไขงาน<i class="fas fa-pencil-alt"></i></a>
            <?php } ?>
            <p class="mb-0 pull-right status-work" style="text-align: center;">สถานะล่าสุด <br/> <?php echo $TimeLineModel->getLastTimeline($rs['ref']) ?></p>
        </div>
    <?php endforeach; ?>
<?php } else { ?>
    <div class="container" style=" padding-top: 10%;">
        <div class="alert alert-warning" style="text-align: center">ไม่พบข้อมูล</div>
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
</script>