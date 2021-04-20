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
$this->title = 'รับงาน';
//$this->params['breadcrumbs'][] = $this->title;
?>
<?php if ($dataList) { ?>
    <?php foreach ($dataList as $rs): ?>
        <div class="alert alert-dark box-list-work" role="alert" style="background: none;">
            <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rs['project_name'] ?></h2>
            <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo $rs['time_getjob'] ?></h3>
            <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php echo $rs['customer'] ?></h4>
            <hr>
            <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
            <a href="<?php echo Yii::$app->urlManager->createUrl(['graphic/update', 'ref' => $rs['ref']]) ?>" class="btn btn-rounded btn-warning">รับงาน <i class="fas fa-pencil-alt"></i></a>
            <p class="mb-0 pull-right" style="text-align: center;">สถานะล่าสุด <br/> <?php echo $TimeLineModel->getLastTimeline($rs['ref'])?></p>
        </div>
    <?php endforeach; ?>
<?php } else { ?>
    ไม่มีงาน
<?php } ?>