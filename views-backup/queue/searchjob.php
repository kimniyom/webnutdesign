<?php

use app\models\ConfigWeb;

$ConfigWeb = new ConfigWeb();
?>
<?php if ($dataList) { ?>
    <?php foreach ($dataList as $rs): ?>
        <div class="alert alert-dark box-list-work" role="alert" style="background: none; padding: 0px;">
            <div class="row" style=" margin: 0px;">
                <div class="col-md-12 col-lg-12">
                    <div style=" padding:10px;">
                        <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rs['customer'] ?></h2>
                        <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo $rs['time_getjob'] ?></h3>
                    </div>
                </div>
            </div>

            <!--
            <a href="<?php //echo Yii::$app->urlManager->createUrl(['customer/view', 'id' => $rs['id'], 'ref' => $rs['ref']])                                                                                                                                           ?>" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
            -->
            <div class="row" style=" margin: 0px; padding: 0px;">
                <div class="col-md-6 col-lg-6" style=" padding: 0px;">
                    <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" class="btn btn-dark btn-block" style="border-radius: 0px;">ดูรายละเอียด <i class="fa fa-eye"></i></a>
                </div>
                <div class="col-md-6 col-lg-6" style="padding:0px;">
                    <a href="<?php echo Yii::$app->urlManager->createUrl(['queue/update', 'ref' => $rs['ref']]) ?>" class="btn btn-success btn-block" style="border-radius: 0px;">ลงคิวติดตั้งงาน <i class="fas fa-pencil-alt"></i></a>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
<?php } else { ?>
    <div style="text-align: center;">ไม่มีข้อมูล</div>
<?php } ?>