<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/customer.css" rel="stylesheet">
<style>
    #w2 img{
        border-radius: 10px;
        margin: 10px;
        width: 30%;
        transition: box-shadow 0.3s ease-in-out;
    }
    #w2 img:hover{
        box-shadow: 0px 5px 20px 10px #cccccc;
    }
    .head-title{
        color: #00cccc;
    }
</style>
<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\ConfigWeb;

/* @var $this yii\web\View */
/* @var $model app\models\Customer */

$this->title = $model->customer;
//$this->params['breadcrumbs'][] = ['label' => 'Customers', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$ConfigModel = new ConfigWeb();
?>
<div class="customer-view">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-primary btn-rounded"><i class="fa fa-home"></i> Home</button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['customer']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-info btn-rounded"><i class="fa fa-chevron-left"></i> กลับ</button>
                </a>
                | <button type="button" class="btn btn-danger btn-rounded"><i class="fa fa-remove"></i> ยกเลิก</button>

                <div class="pull-right">
                    <div style="font-size: 20px; float: left; color: #ffffff;">รายละเอียดงาน</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-4 col-lg-4" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px;">
                <div class="card-header">
                    <i class="fa fa-user"></i> ข้อมูลลูกค้า
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <?=
                    DetailView::widget([
                        'model' => $model,
                        'attributes' => [
                            'customer',
                            'tel',
                            //'channel',
                            //'channel_etc',
                            //getChannel
                            [
                                'format' => 'html',
                                'label' => 'ช่องทางลูกค้าติดต่อมา',
                                'value' => $ConfigModel->getChannel($model->channel) . ' (ข้อมูลอื่น ๆ: ' . $model->channel_etc . ')'
                            ],
                            'address',
                            [
                                'format' => 'html',
                                'label' => 'ผู้รับงาน',
                                'value' => dektrium\user\models\Profile::findOne(['user_id' => $model->user_id])['name']
                            ],
                            [
                                'format' => 'html',
                                'label' => 'วันที่ทำรายการ',
                                'value' => $ConfigModel->thaidate($model->create_date)
                            ],
                        ],
                    ])
                    ?>

                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-6" style=" padding-left: 0px; padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px;">
                <div class="card-content" >
                    <div class="card-header">
                        <i class="fa fa-briefcase"></i> รายละเอียดงาน
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto;">
                        <h4 class="head-title">ข้อมูลรับงาน</h4>
                        <?=
                        DetailView::widget([
                            'model' => $model,
                            'attributes' => [
                                'project_name',
                                'date_getjob',
                                'time_getjob',
                                'detail:ntext',
                            ],
                        ])
                        ?>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <?= dosamigos\gallery\Gallery::widget(['items' => $model->getThumbnails($model->ref, $model->project_name)]); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2 col-lg-2" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fas fa-long-arrow-alt-down text-danger"></i><i class="fas fa-long-arrow-alt-up text-success"></i> กิจกรรม
                    </div>
                    <div class="card-body" id="box-timeline" style="overflow: auto; padding: 0px;">
                        <ul class="list-group" style=" border-radius: 0px;">
                            <li class="list-group-item" style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                16 เม.ย. 2564 00:54:29
                                <ul>
                                    <li>รับงาน</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
        });
            ');
?>

<script type="text/javascript">
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            $("#box-popup-left").css({"height": h - 193});
            $("#box-popup-right").css({"height": h - 193});
            $("#box-timeline").css({"height": h - 193});
        }
    }

</script>
