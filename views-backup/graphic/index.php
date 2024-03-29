<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/graphic.css" rel="stylesheet">
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
$this->title = 'กราฟิก / ออกแบบ';
//$this->params['breadcrumbs'][] = $this->title;
?>
<style type="text/css" media="screen">
    html,body{
        background: #eac0d6;
    }
    #main-wrapper{
        background: #eac0d6;
    }

    .my-box-search input[type='search']{
        background: #000000;
        border-radius: 20px; border:0px;
        color: #FFFFFF;
    }

</style>
<div class="graphic-index" style=" background: #eac0d6; font-family: skv;">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-bottom: 0px; padding-bottom: 5px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left: 10px; padding-top: 5px;">
                <div style="position: absolute; left: 5px; z-index: 2; top: 1px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="z-index: 100;">
                        <button type="button" class="btn btn-dark btn-rounded text-warning" style="z-index: 100;"><i class="fa fa-home"></i></button>
                    </a>
                </div>
                <font style=" color: #ffffff; text-align: center; width: 100%; position: absolute; right: 0px; padding-top: 5px; font-size: 24px; z-index: 0;" id="title-head">
                กราฟิก
                </font>

                <!--
                <select class="form-control" style=" width: 150px; margin-right: 10px; border: 0px; background: #111111; float: right; border-radius: 30px; color: #FFFFFF;" onchange="getJob()" id="souredata">
                    <option value="1">เร่งด่วน</option>
                    <option value="2">วันที่จัดส่ง</option>
                    <option value="3">รับล่าสุด</option>
                </select>
                -->
                <input type="hidden" name="" id="souredata" value="1">
                <!-- Default dropleft button -->
                <div class="btn-group dropleft pull-right" style=" margin-right: 10px; margin-top: 2px;">
                    <button type="button" class="btn btn-dark btn-rounded dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        จัดเรียง
                    </button>
                    <div class="dropdown-menu">
                        <button class="dropdown-item" type="button" onclick="setType(1)">งานเร่งด่วน</button>
                        <button class="dropdown-item" type="button" onclick="setType(2)">วันที่จัดส่งล่าสุด</button>
                        <button class="dropdown-item" type="button" onclick="setType(3)">วันที่รับล่าสุด</button>
                    </div>
                </div>

                <!--
                <button class="navbar-toggler bg-dark btn-rounded" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style=" display: none">
                    <span class="btn btn-sm btn-rounded text-white" style="color: rgb(184, 0, 153); font-weight: bold; padding: 0px;"><i class="fa fa-search"></i> ค้นหา</span>
                </button>

                <div class="collapse navbar-collapse " id="navbarSupportedContent" style=" display: none;">
                    <div class="form-inline my-box-search" style="border-radius: 30px;  padding: 1px 10px 1px 10px;">
                        <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่อลูกค้า.." aria-label="ค้นด้วยชื่อลูกค้า.." id="txtcustomer" style="border-radius: 20px; border:0px;">
                        <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่องาน.." aria-label="ค้นด้วยชื่องาน.." id="txtproject" style="border-radius: 20px; border:0px;">
                        <button class="btn btn-dark my-2 btn-rounded search-btn" type="button" onclick="searchJob()"><i class="fa fa-search"></i> ค้นหา</button>
                    </div>
                </div>
                -->


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
        <div class="col-lg-4 col-md-4" style=" border-left: #eeeeee solid 1px; padding-bottom: 0px; display: none;" >
            <div class="card" >
                <div class="card-body" style=" padding-left:0px; padding-right: 10px; padding-bottom: 0px;">
                    <div class="card-title" style=" font-weight: bold;">ประวัติการรับงาน</div>
                    <div id="body-history" style="overflow: auto; padding: 0px; ">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Popup Detail -->
<div class="modal fade " tabindex="-1" role="dialog" id="popupaddwork" data-backdrop="static" style=" background: #111111;">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content" style="position: relative;background-image: linear-gradient( 135deg, #db7daf 10%, #cc1c77 100%); border-radius: 20px;">
            <div class="modal-header" style="border:none;">
                <h5 class="modal-title text-white" style=" text-align: center;">ข้อมูลรายละเอียด</h5>
            </div>
            <div class="modal-body" id="box-popup">
                <div id="view-customer"></div>
            </div>
            <div class=" modal-footer" style="border:none;">
                <button type="button" class="btn btn-dark btn-rounded btn-block"  data-dismiss="modal" aria-label="Close" id="btn-exit">อ่านทำความเข้าใจแล้ว</button>
            </div>
        </div>
    </div>
</div>


<!-- Popup Detail -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupOrder" data-backdrop="static">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content bg-dark border-dark" style="position: relative;">
            <div class="modal-header border-dark">
                <h5 class="modal-title">สั่งงาน</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body bg-dark" id="box-popup">
                <div id="formorder"><div style=" text-align: center;">Loading...</div></div>
            </div>
            <div class="modal-footer border-dark">

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

<script type="text/javascript">
    setInterval(function() {
        getJob();
    }, 300000);
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        $(".tab-bottom").css({"border-top": "0px", "color": "#ffffff"});

        if (w > 1024) {
            $("#body-work").css({"height": h - 160});
            $("#body-history").css({"height": h - 210});
        } else {
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111", "margin-right": "10px"});
            //$(".topbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)", "border-top": "0px", "color": "#ffffff"});
            $("#head-toolbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)"});
            $("#title-head").hide();
            $("#icon-menu-ham").css({"margin-left": "0px"});
            $(".text-head-mobile").show();
            $(".head-mobile").html("<font style='color:#ffffff'>กราฟิก</font>");
        }
    }

    function getJob() {
        var type = $("#souredata").val();
        var url = "<?php echo Yii::$app->urlManager->createUrl(['graphic/getjob']) ?>";
        var data = {type: type};
        $.post(url, data, function(res) {
            $("#job").html(res);
        });
    }

    function setType(val) {
        $("#souredata").val(val);
        getJob();
    }

    function getViews(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/viewmobile']) ?>";
        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
        });
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
        var url = "<?php echo Yii::$app->urlManager->createUrl(['graphic/searchjob']) ?>";
        var data = {customer: customer, project: project};
        $.post(url, data, function(res) {
            $("#job").html(res);
        });
    }

    function popupOrder(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['graphic/formupdate']) ?>";
        var data = {ref: ref};
        $("#popupOrder").modal();
        $.post(url, data, function(res) {
            $("#popupOrder").modal();
            $("#formorder").html(res);
        });
    }
</script>
