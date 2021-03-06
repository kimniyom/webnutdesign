<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/branchlaser.css" rel="stylesheet">
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
$this->title = "งานพิมพ์";
//$this->params['breadcrumbs'][] = $this->title;
?>
<style type="text/css" media="screen">
    html,body{
        background: #eac0d6;
    }
    #main-wrapper{
        background: #eac0d6;
    }


    .page-wrapper{
        background: #eac0d6;
    }

    .my-box-search input[type='search']{
        background: #000000;
        border-radius: 20px; border:0px;
        color: #FFFFFF;
    }

</style>
<div class="branchprint-index" style=" background: #eac0d6;">
    <div class="card" id="head-toolbar">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left: 10px; padding-top: 5px;">
                <div style="position: absolute; left: 5px; z-index: 2; top: 1px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="z-index: 100;">
                        <button type="button" class="btn btn-dark btn-rounded text-warning" style="z-index: 100;"><i class="fa fa-home"></i></button>
                    </a>
                </div>
                <font style=" color: #ffffff; text-align: center; width: 100%; position: absolute; right: 0px; padding-top: 5px; font-size: 24px; z-index: 0;" id="title-head">
                งานพิมพ์
                </font>
                <div class="pull-right" style=" margin-right: 0px; margin-top: 4px; z-index: 5; margin-bottom: 5px;">
                    <input type="hidden" name="" id="souredata" value="1">
                    <div class="btn-group dropleft" >
                        <button type="button" class="btn btn-dark btn-rounded dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ค้นหา
                        </button>
                        <div class="dropdown-menu" style="border-radius: 20px;">
                            <div class="form-inline my-2 my-lg-0 my-box-search" style="border-radius: 20px;  padding: 30px 10px 30px 20px; min-width: 350px;">
                                <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่อลูกค้า.." aria-label="ค้นด้วยชื่อลูกค้า.." id="txtcustomer" autocomplete="off" style="border-radius: 20px; border:0px; margin-bottom: 5px; width: 100%;">
                                <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่องาน.." aria-label="ค้นด้วยชื่องาน.." id="txtproject" autocomplete="off" style="border-radius: 20px; border:0px; width: 100%;">

                                <button class="btn btn-dark btn-rounded search-btn btn-block" type="button" onclick="searchJob()" style="margin-top: 30px;"><i class="fa fa-search"></i> ค้นหา</button>
                            </div>
                        </div>
                    </div>
                    <div class="btn-group dropleft" style=" margin-right: 10px; margin-top: 2px;">
                        <button type="button" class="btn btn-dark btn-rounded dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            จัดเรียง
                        </button>
                        <div class="dropdown-menu">
                            <button class="dropdown-item" type="button" onclick="setType(1)">งานเร่งด่วน</button>
                            <button class="dropdown-item" type="button" onclick="setType(2)">วันที่จัดส่งล่าสุด</button>
                            <button class="dropdown-item" type="button" onclick="setType(3)">วันที่รับล่าสุด</button>
                            <button class="dropdown-item" type="button" onclick="javascript:window.location.reload()">Refresh</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-12 col-md-12">

            <div id="body-work" style="margin-top: 10px; overflow: auto;">
                <div id="job">
                    <div style="text-align: center; margin-top: 10%;">Loading...</div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Popup Detail -->
<div class="modal fade " tabindex="-1" role="dialog" id="popupaddwork" data-backdrop="static" style="background: #111111;">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content" style="position: relative;background-image: linear-gradient( 135deg, #db7daf 10%, #cc1c77 100%); border-radius: 20px;">
            <div class="modal-header" style="border:none;">
                <h5 class="modal-title text-white">ข้อมูลรายละเอียด</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body" id="box-popup">
                <div id="view-customer"></div>
            </div>
            <div class="modal-footer" style="border:none;">
                <button type=" button" class="btn btn-dark btn-block btn-rounded" onclick="updateStatus()" id="btnSendWork">อ่านทั้งหมดเข้าใจแล้ว</button>
            </div>
        </div>
    </div>
</div>

<!-- Popup Confirm -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupConfirmwork" data-backdrop="static" style=" background: #111111;">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content  bg-dark" style="position: relative;">
            <div class="modal-header border-dark">
                <h5 class="modal-title text-white">รายละเอียด ถ้ามี...</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="box-popup">
                <input type="hidden" id="_ref_confirm"/>
                <textarea id="comment" class="form-control" rows="5"></textarea>
            </div>
            <div class="modal-footer border-dark">
                <button type=" button" class="btn btn-primary btn-block btn-rounded" onclick="updateConfirmStatus()">SEND</button>
            </div>
        </div>
    </div>
</div>


<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
            getJob();
        });
            ');
?>

<script>
    setInterval(function() {
        getJob();
    }, 300000);
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        $(".tab-bottom").css({"background": "#eac0d6", "border-top": "0px", "color": "#ffffff"});
        $(".page-wrapper").css({"background": "#eac0d6"});
        if (w > 1024) {
            $("#body-work").css({"height": h - 150});
            $("#body-history").css({"height": h - 210});
            //$("#head-toolbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)", "box-shadow": "#343434 0px 5px 10px 0px"});
        } else if (w > 500) {
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111", "margin-right": "10px"});
            //$(".topbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)", "border-top": "0px", "color": "#ffffff"});
            $("#head-toolbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)"});
            $("#title-head").hide();
            $("#icon-menu-ham").css({"margin-left": "0px"});
            $(".text-head-mobile").show();
            $(".head-mobile").html("<font style='color:#FFFFFF;'>งานพิมพ์</font>");
            //$(".sourecombo").css({"background": "#eac0d6"});
        } else {
            $("#title-head").hide();
            $(".text-head-mobile").show();
            $(".head-mobile").html("<font style='font-size:20px;color:#ffffff;'>งานพิมพ์</font>");
        }
    }

    function getJob() {
        var type = $("#souredata").val();
        var customer = $("#txtcustomer").val();
        var project = $("#txtproject").val();

        var url = "<?php echo Yii::$app->urlManager->createUrl(['branchprint/getjob']) ?>";
        var data = {
            type: type,
            customer: customer,
            project: project
        };
        $.post(url, data, function(res) {
            $("#job").html(res);
        });
    }

    function getViews(ref, status) {
        $("#_ref").val(ref);

        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/viewmobile']) ?>";

        if (status == 1) {
            $("#btnSendWork").show();
        } else {
            $("#btnSendWork").hide();
        }

        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
        });
    }

    function setType(val) {
        $("#souredata").val(val);
        getJob();
    }

    function searchJob() {
        var type = $("#souredata").val();
        var customer = $("#txtcustomer").val();
        var project = $("#txtproject").val();

        if (customer == "" && project == "") {
            $("#txtcustomer").focus();
            Swal.fire('Warning!', 'กรุณาเลือกอย่างน้อย 1 ตัวเลือก', 'warning');
            return false;
        }

        var url = "<?php echo Yii::$app->urlManager->createUrl(['branchprint/getjob']) ?>";
        var data = {
            type: type,
            customer: customer,
            project: project
        };
        $.post(url, data, function(res) {
            $("#job").html(res);
        });
    }

    function popupConfirm(ref) {
        $("#_ref_confirm").val(ref);
        $("#popupConfirmwork").modal();
    }

    function updateConfirmStatus() {
        var ref = $("#_ref_confirm").val();
        var comment = $("#comment").val();
        var url = "<?php echo Yii::$app->urlManager->createUrl(['branchprint/confirmwork']) ?>";
        var data = {comment: comment, ref: ref};
        $.post(url, data, function(res) {
            $("#popupConfirmwork").modal("hide");
            getJob();
        });
    }
</script>

