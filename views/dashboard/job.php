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
<br/>
<?php if ($dataList) { ?>
    <ul class=" list-group" style=" font-family: skv;">
        <?php
        foreach ($dataList as $rs):
            ?>
            <li class=" list-group-item">
                <div style=" position: absolute; bottom: 0px; right: 3px;">
                    <?php if ($rs['flag'] == "0") { ?>
                        <label class="alert alert-warning" style=" padding: 3px; margin: 5px;">กำลังดำเนินการ</label>
                    <?php } else if ($rs['flag'] == "1") { ?>
                        <label class="alert alert-success" style=" padding: 3px; margin: 5px;">เสร็จแล้ว</label>
                    <?php } else { ?>
                        <label class="alert alert-danger" style=" padding: 3px; margin: 5px;">ยกเลิก</label>
                    <?php } ?>
                </div>
                <a href="javascript:getViews('<?php echo $rs['ref'] ?>')">
                    <div  style=" font-weight: bold;"><?php echo $rs['project_name'] ?></div>
                </a>
                ส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?><br/>
                <?php echo $TimeLineModel->getLastTimeline($rs['ref']) ?>
            </li>
        <?php endforeach; ?>
    </ul>
<?php } else { ?>
    <div class="alert alert-primary" style="text-align: center; width: 100%;">ไม่พบข้อมูล</div>
<?php } ?>

