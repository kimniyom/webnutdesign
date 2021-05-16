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
            line-height: 20pt;
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

$ConfigWeb = new ConfigWeb();
?>
<?php if ($dataList) { ?>
    <?php foreach ($dataList as $rs): ?>
        <div class="alert alert-dark box-list-work" role="alert" style="background: #d25fa0; font-family: skv; margin: 10px; border-radius: 10px; border:none;">
            <div class="row" style=" margin: 0px; padding: 0px;">
                <div class="col-md-12 col-lg-12" style=" padding: 0px;">
                    <a href="javascript:getViews('<?php echo $rs['ref'] ?>')">
                        <div class="text-tran-head" style=" font-weight: bold; color:#FFFFFF;"><?php echo $rs['project_name'] ?></div>
                    </a>
                    <div class="send-heading" style=" font-weight: normal; color: #FFFFFF;">ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></div>
                </div>
            </div>
            <div class="row" style=" margin: 0px; padding: 0px;">
                <div class="col-md-4 col-lg-6 col-12" style="padding:0px;">

                </div>
                <div class="col-md-8 col-lg-6 col-12" style="padding:0px;">
                    <a href="<?php echo Yii::$app->urlManager->createUrl(['account/update', 'ref' => $rs['ref']]) ?>" class="btn btn-dark btn-block btn-sm" style="border-radius: 10px;">ใบเสนอราคา <i class="fas fa-pencil-alt"></i></a>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
<?php } else { ?>
    <div style="text-align: center;">ไม่มีข้อมูล</div>
<?php } ?>