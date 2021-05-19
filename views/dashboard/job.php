<style>
    .text-tran-head{
        font-size: 26px;
    }

    .send-heading{
        font-size: 18px;
    }
    @media screen and (max-width: 768px) {
        /* STYLES HERE */
        .text-tran-head{
            font-size: 20px;
        }

        .alert-heading{
            margin-top: -10px;
        }

        .send-heading{
            font-size: 16px;
        }

        .box-title-tran{
            height: 20px;
        }
    }


    @media screen and (min-width: 769px) and (max-width: 1024px) {
        /* STYLES HERE */
        .text-tran-head{
            font-size: 20px;
            line-height: 10pt;
            margin-top: 8px;
        }

        .alert-heading{
            margin-top: -10px;
        }

        .send-heading{
            font-size: 16px;
        }

        .box-title-tran{
            height: 30px;
        }


    }
</style>
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
<div class="row" style=" margin: 0px; margin-bottom: 20px; padding-top: 10px;">
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
                <div class="alert alert-dark box-list-work" role="alert" style="background: #d25fa0; font-family: skv; margin: 10px; border-radius: 10px; box-shadow:#4a4a4a 5px 5px 10px 0px;">
                    <div style=" float: left; width: 80%;">
                        <div style="height: 35px; overflow: hidden;">
                            <a href="javascript:getViews('<?php echo $rs['ref'] ?>')">
                                <div class="text-tran-head" style=" font-weight: bold; color:#FFFFFF;"><?php echo $rs['project_name'] ?></div>
                            </a>
                        </div>
                        <div class="send-heading" style=" font-weight: normal; color: #FFFFFF;">ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></div>
                    </div>

                    <div style=" position: absolute; right: 10px; top: 10px;">
                        <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/update', 'id' => $rs['id']]) ?>" class="btn btn-rounded btn-dark btn-sm" style="padding: 0px 5px; width: 60px;">แก้ไข <i class="fas fa-pencil-alt"></i></a>
                        <br/>
                        <a href="javascript:cancelJob('<?php echo $rs['ref'] ?>')" class="btn btn-rounded btn-danger btn-sm" style="margin-top: 5px;padding: 0px 5px; width: 60px;">ยกเลิก <i class="fa fa-remove"></i></a>
                    </div>

                    <div style=" clear: both;">
                        <hr style=" height: 5px; margin-top: 0px; margin-bottom: 0px; border-top: #FFFFFF solid 3px;">
                        <div style=" overflow: hidden;">
                            <p class="mb-0 status-work" style="text-align: center; white-space: nowrap; color: #FFFFFF;"><?php echo $TimeLineModel->getLastTimeline($rs['ref']) ?></p>
                        </div>
                    </div>
                </div>
        <?php endforeach; ?>
    <?php } else { ?>
            <div class="alert alert-primary" style="text-align: center; width: 100%;">ไม่พบข้อมูล</div>
    <?php } ?>
</div>
