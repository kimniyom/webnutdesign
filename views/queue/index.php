<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/queue.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;

$ConfigWeb = new ConfigWeb();
$this->title = 'Queue';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="queue-index">
    <div class="card" id="head-toolbar">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left:0px;">
                <nav class="navbar navbar-expand-lg navbar-light" style=" padding: 0px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                        <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                    </a>
                    <button class="navbar-toggler bg-dark btn-rounded" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="btn btn-sm btn-rounded text-white" style="color: rgb(184, 0, 153); font-weight: bold; padding: 0px;"><i class="fa fa-search"></i> ค้นหา</span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="form-inline my-2 my-lg-0 my-box-search" style="border-radius: 30px;  padding: 1px 10px 1px 10px;">
                            <input class="form-control mr-sm-2 mr-md-2" type="search" placeholder="ค้นด้วยชื่อลูกค้า.." aria-label="ค้นด้วยชื่อลูกค้า.." id="txtcustomer">
                            <input class="form-control mr-sm-2 mr-md-2" type="search" placeholder="ค้นด้วยชื่องาน.." aria-label="ค้นด้วยชื่องาน.." id="txtproject">
                            <button class="btn btn-dark my-2 btn-rounded search-btn" type="button" onclick="searchJob()"><i class="fa fa-search"></i> ค้นหา</button>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>


    <div class="row" style="margin-top: 0px; padding-top: 0px;" id="box-default">
        <div class="col-md-4 col-lg-4" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border:0px; margin-bottom: 0px;">
                <div class="card-header">
                    <i class="far fa-file-alt text-info"></i> ออกใบเสนอราคา / แนบใบเสนอราคา
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto; padding: 5px; background: #eeeeee;">
                    <?php if ($listData) { ?>
                        <?php foreach ($listData as $rs): ?>
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
                                <a href="<?php //echo Yii::$app->urlManager->createUrl(['customer/view', 'id' => $rs['id'], 'ref' => $rs['ref']])                                                                                                                       ?>" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
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
        <div class="col-md-4 col-lg-4" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border:0px;">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fas fa-truck-pickup text-danger"></i> ส่งผลิตนอกร้าน
                    </div>
                    <div class="card-body" id="box-timeline" style="overflow: auto; padding: 0px; background: #eeeeee;">
                        <ul class="list-group" style=" padding: 0px; margin: 0px;">
                            <?php foreach ($outside as $outsides):
                                ?>
                                <li class="list-group-item" style="border: none; border-bottom: solid 1px #eeeeee; background:#eeeeee" onclick="popupMenu('<?php echo $outsides['ref'] ?>')">
                                    <div class="list-out-side" style=" border-radius: 10px; padding: 10px; padding-bottom: 5px;">
                                        <h4>งาน: <?php echo $outsides['project_name'] ?></h4>
                                        <p>ลูกค้า:<?php echo $outsides['customer'] ?></p>
                                    </div>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Search Content -->
    <div class="row" style="margin-top: 0px; padding-top: 0px; display: none;" id="box-search">
        <div class="col-md-12 col-lg-12" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border:0px; margin-bottom: 0px;">
                <div class="card-header">
                    <i class="far fa-search text-info"></i> ค้นหา(แก้ไขได้เฉพาะงานของตัวเอง)
                    <div class="pull-right">
                        <i class="fas fa-times" style=" cursor: pointer;" onclick="closeResult()"></i>
                    </div>
                </div>
                <div class="card-body" id="box-content" style="overflow: auto; padding: 5px; background: #eeeeee;">

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
            <div class="modal-body" id="box-popup" >
                <div id="view-customer"></div>
            </div>
        </div>
    </div>
</div>

<!-- Menu -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupmenu" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content" style="position: relative;">
            <div class="modal-body">
                <input type="hidden" name="" id="ref">
                <h4 style=" text-align: center; margin-bottom: 10px;">คุณต้องการทำอะไร ...?</h4>
                <button type="button" class="btn btn-success btn-block btn-rounded" onclick="javascript:alert('กำลังดำเนินการในส่วนนี้อยู่');"><i class="fa fa-check"></i> ยืนยัน</button>
                <button type="button" class="btn btn-info btn-block btn-rounded" onclick="getViewsPopup()"><i class="fa fa-eye"></i> ตรวจสอบ</button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-block btn-rounded" data-dismiss="modal" aria-label="Close" id="btn-exit">ปิด</button>
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
            $("#box-popup-left").css({"height": h - 184});
            $("#box-popup-right").css({"height": h - 184});
            $("#box-timeline").css({"height": h - 184});
            $("#box-content").css({"height": h - 184});
        } else {
            $(".modal-dialog").addClass("modal-dialog-scrollable");
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111", "margin-right": "10px", "margin-left": "10px"});
        }
    }

    function getViews(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/view']) ?>";
        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
            $("#popupmenu").modal("hide");
        });
    }

    function getViewsPopup() {
        var ref = $("#ref").val();
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/view']) ?>";
        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
            $("#popupmenu").modal("hide");
        });
    }

    function popupMenu(ref) {
        $("#popupmenu").modal();
        $("#ref").val(ref);
    }

    function searchJob() {
        var customer = $("#txtcustomer").val();
        var project = $("#txtproject").val();

        if (customer == "" && project == "") {
            $("#txtcustomer").focus();
            Swal.fire('Warning!', 'กรุณาเลือกอย่างน้อย 1 ตัวเลือก', 'warning');
            return false;
        }
        $("#job").html("<h4 style='text-align:center;'>Loading ...</h4>");
        var url = "<?php echo Yii::$app->urlManager->createUrl(['account/searchjob']) ?>";
        var data = {customer: customer, project: project};
        $.post(url, data, function(res) {
            $("#box-search").show();
            $("#box-default").hide();
            $("#box-content").html(res);
        });
    }

    function closeResult() {
        $("#box-search").hide();
        $("#box-default").show();
    }
</script>

