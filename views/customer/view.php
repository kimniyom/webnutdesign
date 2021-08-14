<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/customer.css" rel="stylesheet">
<style>
    #w2 img{
        border-radius: 10px;
        margin: 10px;
        width: 20%;
        transition: box-shadow 0.3s ease-in-out;
    }
    #w2 img:hover{
        box-shadow: 0px 5px 20px 10px #cccccc;
    }
    .head-title{
        color: #00cccc;
    }

    .customer-view table tr th{
        padding: 5px;
        border-top: 0px;
    }
    .customer-view table tr td{
        padding: 5px;
        border-top: 0px;
    }
    .customer-view table{
        border-right: 0px;
    }

    .customer-view .card-header{
        border-radius: 0px;
    }



    @media(max-width:768px) {
        .card-body{
            padding: 20px;
        }

        #box-popup-right{
            padding: 20px;
        }
    }

</style>
<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\ConfigWeb;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Customer */

$this->title = $model->customer;
//$this->params['breadcrumbs'][] = ['label' => 'Customers', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$ConfigModel = new ConfigWeb();
?>
<div class="customer-view" >
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px; border-bottom: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-home text-warning"></i></button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-chevron-left text-info"></i></button>
                </a>
                <a  href="<?php echo Yii::$app->urlManager->createUrl(['customer/create']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded" style="color: pink"><i class="fa fa-plus"></i> สร้างใหม่</button>
                </a>
                <div class="pull-right">
                    <div style="font-size: 20px; float: left; color: #ffffff;">รายละเอียดงาน</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-4 col-lg-4" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left: 0px;">
                <div class="card-header">
                    <i class="fa fa-user"></i> ข้อมูลลูกค้า
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto; padding: 5px;">
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
        <div class="col-md-5 col-lg-5" style=" padding-left: 0px; padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px;">
                <div class="card-content" >
                    <div class="card-header">
                        <i class="fa fa-briefcase"></i> รายละเอียดงาน
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto; padding: 5px;">

                        <?=
                        DetailView::widget([
                            'model' => $model,
                            'attributes' => [
                                'project_name',
                                [
                                    'format' => 'html',
                                    'label' => 'วันที่รับสินค้า',
                                    'value' => $ConfigModel->thaidate($model->date_getjob) . " " . $model->time_getjob
                                ],
                                [
                                    'format' => 'html',
                                    'label' => 'การจัดส่ง',
                                    'value' => ($model->transport == 1) ? "ต้องจัดส่ง" : "ไม่ต้องจัดส่ง"
                                ],
                                [
                                    'format' => 'html',
                                    'label' => 'การติดตั้ง',
                                    'value' => ($model->setup == 1) ? "มีการติดตั้ง" : "ไม่มีการติดตั้ง"
                                ],
                                [
                                    'format' => 'html',
                                    'label' => 'ความเร่งด่วน',
                                    'value' => ($model->fast == 1) ? "เร่งด่วน" : "ทั่วไป"
                                ],
                                [
                                    'format' => 'html',
                                    'label' => 'ใบเสนอราคา',
                                    'value' => ($model->quotation == 1) ? "ทำใบเสนอราคา" : "ไม่ต้องทำใบเสนอราคา"
                                ],
                            ],
                        ])
                        ?>
                        <div class="card">
                            <div class="card-content">
                                <div class=" card-body">
                                    <?php echo $model->detail ?>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body" style="padding: 10px;">
                                รูปภาพแนบ

                                <?= dosamigos\gallery\Gallery::widget(['items' => $model->getThumbnails($model->ref, 'รายละเอียดการคุยงาน')]); ?>
                                ไฟล์แนบ
                                <ul>
                                    <?php foreach ($filelist as $f): ?>
                                        <li><a href="<?php echo Url::to('@web/photolibrarys/' . $f['ref'] . '/' . $f['real_filename']) ?>" target="_back"><?php echo $f['file_name'] ?></a></li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-lg-3" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fas fa-long-arrow-alt-down text-danger"></i><i class="fas fa-long-arrow-alt-up text-success"></i> กิจกรรม
                    </div>
                    <div class="card-body" id="box-timeline" style="overflow: auto; padding: 0px;">
                        <ul class="list-group" style=" border-radius: 0px;">
                            <?php foreach ($timeline as $tm): ?>
                                <li class="list-group-item" style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                    <div class="btn btn-rounded btn-danger" style=" padding: 0px 5px;"><?php echo$ConfigModel->thaidate($tm['d_update']) ?></div>
                                    <ul>
                                        <li>แผนก: <?php echo $tm['curdep'] ?></li>
                                        <li>ส่งต่อแผนก: <?php echo $tm['todep'] ?></li>
                                        <li>โดย: <?php echo $tm['name'] ?></li>
                                    </ul>
                                </li>
                            <?php endforeach; ?>
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
        $("#menu1").addClass("active");
        if (w > 768) {
            $("#box-popup-left").css({"height": h - 190});
            $("#box-popup-right").css({"height": h - 190});
            $("#box-timeline").css({"height": h - 190});
        } else {
            $("#box-popup-left").css({"padding-right": "10px"});
            $("#box-popup-right").css({"padding-left": "15px", "padding-right": "15px"});
            $(".card").css({"margin-top": "0px", "margin-bottom": "0px"});
        }
    }

</script>
