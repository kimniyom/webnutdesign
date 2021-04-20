<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/account.css" rel="stylesheet">
<style type="text/css" media="screen">
    @media(min-width:767px) {
        #popupaddwork .modal-dialog{
            min-width: 99% !important;
            margin-top: 10px !important;
            margin: auto;
        }

        #detail-q{
            position: relative;
            overflow: auto;
        }

        #box-popup{
            background: #ffffff;
            padding:0px;
            padding-bottom: 0px;
        }
    }



</style>
<?php
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;

$ConfigWeb = new ConfigWeb();
$this->title = 'Accounts';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="account-index">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-primary btn-rounded"><i class="fa fa-home"></i> Home</button>
                </a>
               
                <div class="pull-right">
                    <div style="font-size: 20px; float: left; color: #ffffff;">บัญชี</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-4 col-lg-4" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px;">
                <div class="card-header">
                    <i class="far fa-file-alt text-info"></i> ออกใบเสนอราคา / แนบใบเสนอราคา
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto; padding: 5px;">
                    <?php if ($dataList) { ?>
                        <?php foreach ($dataList as $rs): ?>
                            <div class="alert alert-dark box-list-work" role="alert" style="background: none; padding: 0px;">
                                <div class="row" style=" margin: 0px;">
                                    <div class="col-md-12 col-lg-12">
                                        <div style=" padding:10px;">
                                        <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rs['project_name'] ?></h2>
                                        <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo $rs['time_getjob'] ?></h3>
                                        <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php echo $rs['customer'] ?></h4>
                                        </div>
                                    </div>
                                </div>
                     
                                <!--
                                <a href="<?php //echo Yii::$app->urlManager->createUrl(['customer/view', 'id' => $rs['id'], 'ref' => $rs['ref']])                    ?>" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
                                -->
                                <div class="row" style=" margin: 0px; padding: 0px;">
                                    <div class="col-md-6 col-lg-6" style=" padding: 0px;">
                                        <a href="javascript:getViews('<?php echo $rs['ref'] ?>')" class="btn btn-dark btn-block" style="border-radius: 0px;">ดูรายละเอียด <i class="fa fa-eye"></i></a>
                                    </div>
                                    <div class="col-md-6 col-lg-6" style="padding:0px;">
                                        <a href="<?php echo Yii::$app->urlManager->createUrl(['account/update', 'ref' => $rs['ref']]) ?>" class="btn btn-success btn-block" style="border-radius: 0px;">ใบเสนอราคา <i class="fas fa-pencil-alt"></i></a>
                                    </div>
                                </div>
                                
                                
                            </div>
                        <?php endforeach; ?>
                    <?php } else { ?>
                        <div style="text-align: center;">ไม่มีข้อมูล</div>
                    <?php } ?>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-lg-4" style=" padding-left: 0px; padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px;">
                <div class="card-content" >
                    <div class="card-header">
                        <i class="fa fa-check text-success"></i> ตรวจสอบยืนยัน(งานถึงมือลูกค้าแล้ว)
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto; padding: 0px;">
                        <ul class="list-group" style=" padding: 0px; margin: 0px;">
                            <?php foreach($job as $jobs): ?>
                            <li class="list-group-item" style="border: none; border-bottom: solid 1px #eeeeee;">
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <h4>งาน: <?php echo $jobs['project_name'] ?><h4/>
                                        <p>ลูกค้า:<?php echo $jobs['customer'] ?></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6">
                                        <button type="button" class="btn btn-success btn-block btn-sm" onclick="javascript:alert('กำลังดำเนินการในส่วนนี้อยู่');"><i class="fa fa-check"></i> CONFIRM</button>
                                    </div>
                                    <div class="col-md-6 col-lg-6">
                                        <button type="button" class="btn btn-info btn-block btn-sm" onclick="getViews('<?php echo $jobs['ref'] ?>')"><i class="fa fa-eye"></i> CHECK</button>
                                    </div>
                                </div>
                            </li>
                        <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-lg-4" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fas fa-truck-pickup text-danger"></i> ส่งผลิตนอกร้าน
                    </div>
                    <div class="card-body" id="box-timeline" style="overflow: auto; padding: 0px;">
                        <!--
                        <ul class="list-group" style=" border-radius: 0px;">
                        <?php //foreach ($timeline as $tm): ?>
                                <li class="list-group-item" style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                    <div class="btn btn-rounded btn-danger" style=" padding: 0px 5px;"><?php //echo$ConfigModel->thaidate($tm['d_update'])                                                                   ?></div>
                                    <ul>
                                        <li>แผนก: <?php //echo $tm['curdep']                                                                   ?></li>
                                        <li>ส่งต่อแผนก: <?php //echo $tm['todep']                                                                   ?></li>
                                        <li>โดย: <?php //echo $tm['name']                                                                   ?></li>
                                    </ul>
                                </li>
                        <?php //endforeach; ?>
                        </ul>
                        -->
                        <div style="text-align: center;">อยู่ระหว่างการดำเนินงาน</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

   <!-- เอาคิวข้าว -->
    <div class="modal fade" tabindex="-1" role="dialog" id="popupaddwork" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="position: relative;">
                <div class="modal-header">
                    <h5 class="modal-title">ข้อมูลรายละเอียด</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <div class="modal-body" id="box-popup">
                    <div id="view-customer"></div>
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

    function getViews(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/view']) ?>";
        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
        });
    }
</script>

