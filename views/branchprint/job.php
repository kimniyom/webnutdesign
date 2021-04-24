<style type="text/css">

    .btn-work-nut-send {background-image: linear-gradient(to right, #000046 0%, #1CB5E0  51%, #000046  100%)}
    .btn-work-nut-send{
        width: 47%;
        height: 100%;
        position: absolute;
        text-align: center;
        border-radius: 10px;
        text-transform: uppercase;
        transition: 0.5s;
        background-size: 200% auto;
        color: white;

        float: left;
        font-size:2vw;
    }
    .btn-work-nut-send:hover {
        background-position: right center; /* change the direction of the change here */
        color: #fff;
        text-decoration: none;
        cursor: pointer;
    }

    .btn-work-nut-edit {background-image: linear-gradient(to right, #EB5757 0%, #000000  51%, #EB5757  100%)}
    .btn-work-nut-edit{
        width: 47%;
        height: 100%;
        position: absolute;
        text-align: center;
        border-radius: 10px;
        text-transform: uppercase;
        transition: 0.5s;
        background-size: 200% auto;
        color: white;

        right: 5px;
        font-size:2vw;
    }
    .btn-work-nut-edit:hover {
        background-position: right center; /* change the direction of the change here */
        color: #fff;
        text-decoration: none;
        cursor: pointer;
    }

    .vertical-center {
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }

    @media(max-width:767px) {
        .btn-work-nut-send {background-image: linear-gradient(to right, #000046 0%, #1CB5E0  51%, #000046  100%)}
        .btn-work-nut-send{
            width: 45%;
            height: 100%;
            position: absolute;
            text-align: center;
            border-radius: 10px;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;

            float: left;
            font-size:20px;
        }
        .btn-work-nut-send:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-work-nut-edit {background-image: linear-gradient(to right, #EB5757 0%, #000000  51%, #EB5757  100%)}
        .btn-work-nut-edit{
            width: 45%;
            height: 100%;
            position: absolute;
            text-align: center;
            border-radius: 10px;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;

            right: 5px;
            font-size:20px;
        }
        .btn-work-nut-edit:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
            cursor: pointer;
        }
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


                        <div class="btn-work-nut-edit" onclick="updateStatus('<?php echo $rs['ref'] ?>', '3')" >
                            <div class="vertical-center">
                                ส่งแก้ไข
                            </div>
                        </div>



                    <?php } ?>
                </div>
            </div>

            <hr>

            <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
            <!-- ถ้ามีการรับงานแล้ว -->
            <?php if ($rs['status'] == 1) { ?>
                <!-- แก้ไขเฉพาะงานตัวเองรับได้ -->
                <?php if (Yii::$app->user->identity->id == $rs['user_id'] || Yii::$app->user->identity->status == "A") { ?>
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
    <div class="container">
        <div class="alert alert-primary" style="text-align: center">ไม่มีงานค้าง</div>
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