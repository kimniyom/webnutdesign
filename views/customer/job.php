<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;

$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
//$this->title = 'รับงาน';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" style=" margin: 0px; margin-bottom: 20px;">
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-6 col-lg-4 col-sm-6" style="margin: 0px; padding: 0px;">
                <div class="alert alert-dark box-list-work" role="alert">
                    <div style=" float: left; width: 80%;">
                        <div style="height: 35px; overflow: hidden;">
                            <a href="javascript:getViews('<?php echo $rs['ref'] ?>')">
                                <div class="text-tran-head" style=" font-weight: bold; color:#FFFFFF;"><?php echo $rs['project_name'] ?></div>
                            </a>
                        </div>

                        <div style="height: 20px; overflow: hidden; clear: both; ">
                            <div class="text-tran-customer" style=" font-weight: bold; color:#FFFFFF;"><i class="far fa-user-circle"></i> <?php echo ($rs['customer']) ? $rs['customer'] : "-"; ?></div>
                        </div>
                    </div>

                    <div style=" position: absolute; right: 10px; top: 10px;">
                        <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/update', 'id' => $rs['id']]) ?>" class="btn btn-rounded btn-dark btn-sm" style="padding: 0px 5px; width: 60px;">แก้ไข <i class="fas fa-pencil-alt"></i></a>
                        <br/>
                        <a href="javascript:cancelJob('<?php echo $rs['ref'] ?>')" class="btn btn-rounded btn-danger btn-sm" style="margin-top: 5px;padding: 0px 5px; width: 60px;">ยกเลิก <i class="fa fa-remove"></i></a>
                    </div>

                    <div class="send-heading pull-right" style=" font-weight: normal; color: #FFFFFF;"><i class="far fa-calendar-alt"></i> ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></div>

                    <div style=" clear: both;">
                        <hr style=" height: 5px; margin-top: 0px; margin-bottom: 0px; border-top: #FFFFFF solid 3px;">
                        <div style=" overflow: hidden;">
                            <p class="mb-0 status-work" style="text-align: center; white-space: nowrap; color: #FFFFFF;"><?php echo $TimeLineModel->getLastTimeline($rs['ref']) ?></p>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php } else { ?>
        <div class="col-md-12 col-lg-12">
            <div class="container">
                <div class="alert alert-primary" style="text-align: center">ไม่มีงานค้าง</div>
            </div>
        </div>
    <?php } ?>
</div>
<script type="text/javascript">
    setStatusWork();
    function setStatusWork() {
        var w = window.innerWidth;

        if (w < 1024) {
            $(".status-work").removeClass('mb-0 pull-right');
            $(".status-work").css({"width": "100%", "margin-top": "10px"});
        }

    }
</script>