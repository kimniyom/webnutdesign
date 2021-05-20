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

    @media(max-width:767px) {
        #popupaddwork .modal-dialog{
            min-width: 99% !important;
            margin-top: 5px !important;
            margin: auto;
        }

    }

    .account-index .card-header{
        background: #de93bc;
        border-radius: 0px;
        border:0px;
        color:#ffffff;
    }
    .account-list-group{
        padding-bottom: 0px;
    }

    .account-list-group{
        transition: 0.5s;
    }

    .account-list-group:hover{
        background-image: linear-gradient(to right, #16222A 0%, #3A6073  100%);
        color: #ffffff;
    }

    .list-out-side{
        background: #ffffff;
        color:#000000;
        transition: 0.5s;
    }

    .list-out-side:hover{
        color: #FFFFFF;
        cursor: pointer;
        background: #16222A;
        box-shadow: 0px 0px 20px 0px #16222A;
    }

    .my-box-search input[type='search']{
        background: #000000;
        border-radius: 20px; border:0px;
        color:#ffffff;
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
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px; border:0px; font-family: skv;">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left: 10px;">
               <div style="position: absolute; left: 5px; z-index: 2; top: 3px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                        <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                    </a>
                </div>
                    <font style=" color: #ffffff; text-align: center; width: 100%; position: absolute; right: 0px; padding-top: 5px; font-size: 24px; z-index: 0;" id="title-head">
                        บัญชี
                    </font>
               <div class="btn-group dropleft pull-right" style=" margin-right: 5px; margin-top: 8px;">
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

            </div>
        </div>
    </div>


    <div class="row" style="margin-top: 0px; padding-top: 0px; font-family: skv;" id="box-default">
        <div class="col-md-4 col-lg-4" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border:0px; margin-bottom: 0px;">
                <div class="card-header">
                    <i class="far fa-file-alt text-info"></i> ออกใบเสนอราคา
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto; padding: 5px; background: #eac0d6;">
                    <div id="jobaccount"></div>
                </div>
            </div>
        </div>
        <!--
        ### Box ยืนยันการรับงาน ###
        -->
        <div class="col-md-4 col-lg-4" style=" padding-left: 0px; padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border:0px; margin-bottom: 0px;">
                <div class="card-content" >
                    <div class="card-header">
                        <i class="fa fa-check text-success"></i> ตรวจสอบยืนยัน
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto; padding: 0px;">
                        <div id="confirmjob"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-lg-4" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border:0px;">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fas fa-truck-pickup text-danger"></i> ส่งผลิตนอกร้าน
                    </div>
                    <div class="card-body" id="box-timeline" style="overflow: auto; padding: 0px; background: #eac0d6;">
                        <ul class="list-group" style=" padding: 0px; margin: 0px;">
                            <?php foreach ($outside as $outsides):
                                ?>
                                <li class="list-group-item" style="border: none; border-bottom: solid 0px #eeeeee;background: #eac0d6;" onclick="popupMenu('<?php echo $outsides['ref'] ?>')">
                                    <div class="list-out-side" style=" border-radius: 10px; padding: 10px; padding-bottom: 5px;">
                                        <h4><?php echo $outsides['customer'] ?></h4>
                                        <p>กำหนดส่ง: <?php echo $ConfigWeb->thaidate($outsides['date_getjob']) ?></p>
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
<div class="modal fade" tabindex="-1" role="dialog" id="popupmenu" data-backdrop="static" style="background: #111111;">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content" style="position: relative;">
            <div class="modal-body bg-dark">
                <button class="btn btn-danger btn-rounded pull-right" data-dismiss="modal" aria-label="Close" id="btn-exit" style="padding:0px 5px;"><i class="fa fa-remove"></i></button>
                <input type="hidden" name="" id="ref">
                <p class="text-danger" style="text-align: center;">*ต้องตรวจเช็คข้อมูลงานก่อนยืนยันทุกครั้ง<br/>
                ให้แน่ใจว่างานส่งมอบให้ลูกค้าแล้ว</p>
                <hr/>
                <label>Comment ถ้ามี</label>
                <textarea class="form-control" rows="8" id="comment"></textarea>
                <button type="button" class="btn btn-success btn-block btn-rounded" onclick="confirmWork()"><i class="fa fa-check"></i> ยืนยัน</button>
                <button type="button" class="btn btn-info btn-block btn-rounded" onclick="getViewsPopup()"><i class="fa fa-eye"></i> ตรวจสอบ</button>
            </div>

        </div>
    </div>
</div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
            loadJobAccount();
            loadJobConfirm();
        });
            ');
?>

<script type="text/javascript">
    setInterval(function() {
        loadJobConfirm();
        loadJobAccount();
    }, 300000);
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 1024) {
            $("#box-popup-left").css({"height": h - 190});
            $("#box-popup-right").css({"height": h - 190});
            $("#box-timeline").css({"height": h - 190});
            $("#box-content").css({"height": h - 190});
        } else {
            if(w > 768){
                $("#box-popup-left").css({"height": h - 190});
                $("#box-popup-right").css({"height": h - 190});
                $("#box-timeline").css({"height": h - 190});
                $("#box-content").css({"height": h - 190});
            } 
            $(".modal-dialog").addClass("modal-dialog-scrollable");
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111", "margin-right": "10px", "margin-left": "10px"});

            $("#head-toolbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)"});
            $("#title-head").hide();
            $("#icon-menu-ham").css({"margin-left": "0px"});
            $(".text-head-mobile").show();
            $(".head-mobile").html("<font style='color:#ffffff'>บัญชี</font>");
        
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

    function confirmWork() {
        var ref = $("#ref").val();
        var comment = $("#comment").val();
        var data = {ref: ref, comment: comment};
        var url = "<?php echo Yii::$app->urlManager->createUrl(['account/confirmwork']) ?>";
        $.post(url, data, function(res) {
            if (res == 0) {
                $("#popupmenu").modal("hide");
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'ยืนยันงานสำเร็จ',
                    showConfirmButton: false,
                    timer: 1500
                });
                loadJobConfirm();
                loadJobAccount();
                //window.location.reload();
            } else {
                Swal.fire('Warning!', 'เกิดข้อผิดพลาด...', 'warning');
            }
        });

    }

    function loadJobAccount() {
        $("#jobaccount").html("<h4 style='text-align:center;'>Loading ...</h4>");
        var url = "<?php echo Yii::$app->urlManager->createUrl(['account/job']) ?>";
        var data = {};
        $.post(url, data, function(res) {
            $("#jobaccount").html(res);
        });
    }

    function loadJobConfirm() {
        $("#confirmjob").html("<h4 style='text-align:center;'>Loading ...</h4>");
        var url = "<?php echo Yii::$app->urlManager->createUrl(['account/loadjob']) ?>";
        var data = {};
        $.post(url, data, function(res) {
            $("#confirmjob").html(res);
        });
    }

</script>

