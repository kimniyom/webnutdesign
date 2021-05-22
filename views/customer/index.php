<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/customer.css" rel="stylesheet">
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

    .my-box-search input[type='search']{
        background: #000000;
        border-radius: 20px; border:0px;
        color: #FFFFFF;
    }

    @media(max-width:767px) {
        /*
        #popupaddwork .modal-dialog{
            min-width: 100% !important;
            margin-right:-10px;

        }
        */
    }

</style>
<div class="customer-index">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-bottom: 0px;">
        <div class="card-content" >
            <div class="card-body" style=" padding: 0px; padding-left: 10px; font-family: skv; padding-top: 5px;">
                <div style="position: absolute; left: 5px; z-index: 2; top: 5px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style=" float: left;">
                        <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                    </a>
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['customer/create']) ?>">
                        <button type="button" class="btn btn-dark btn-rounded" style="color: pink"><i class="fa fa-plus"></i> สร้างใหม่</button>
                    </a>
                </div>
                <font style=" color: #ffffff; text-align: center; width: 100%; position: absolute; right: 0px; padding-top: 5px; font-size: 24px; z-index: 0;" id="title-head">
                รับงาน
                </font>

                <div class="pull-right" style=" margin-right: 0px; margin-top: 4px; z-index: 5; margin-bottom: 5px;">
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

                    <input type="hidden" name="" id="souredata" value="1">
                    <div class="btn-group dropleft" style=" margin-right: 10px; margin-top: 2px;">
                        <button type="button" class="btn btn-dark btn-rounded dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            จัดเรียง
                        </button>
                        <div class="dropdown-menu">
                            <button class="dropdown-item" type="button" onclick="setType(1)">งานเร่งด่วน</button>
                            <button class="dropdown-item" type="button" onclick="setType(2)">วันที่จัดส่งล่าสุด</button>
                            <button class="dropdown-item" type="button" onclick="setType(3)">วันที่รับล่าสุด</button>
                            <button class="dropdown-item" type="button" onclick="setType(4)">งานที่รับวันนี้</button>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-12 col-md-12">
            <div style=" top: 0px; font-weight: bold; margin-left: 30px; margin-top: 10px; font-family: skv; font-size: 14px;">
                !หมายเหตุ ข้อมูลจะหายไปเมื่อมีการยกเลิกงานหรืองานได้ Approve แล้ว
            </div>
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
                    <div id="body-history" style="overflow: auto; padding: 0px;">
                        <div class="steamline m-t-40">
                            <div class="sl-item" style=" display: none;">
                                <div class="sl-left bg-success"> <i class="fa fa-user"></i></div>
                                <div class="sl-right">
                                    <div class="font-medium">คุณ Dem omo <span class="sl-date"> 19/03/2564</span>
                                    </div>
                                    <div class="desc">
                                        ประเภทงาน: CNC<br/>
                                        <a href="javascript:popupdetail()" class="btn m-t-10 m-r-5 btn-rounded btn-outline-success btn-sm">ดูรายละเอียด</a>
                                        <a class="btn m-t-10 btn-rounded btn-outline-danger btn-sm disabled">สถานะล่าสุด กราฟิก</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Popup Detail -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupaddwork" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document" id="bb">
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

<!-- Popup Cancel -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupcancel" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="position: relative;">
            <div class="modal-header bg-danger">
                <h5 class="modal-title text-white">ยกเลิกงาน</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <h3><i class="fa fa-info fa-2x"></i> ระบุสาเหตุ</h3>
                <input type="hidden" name="" id="ref_cancel">
                <ul class="list-group">
                    <?php foreach ($mascancel as $cl): ?>
                        <li class="list-group-item" style="font-size: 18px;">
                            <input type="radio" name="typecancel" value="<?php echo $cl['id'] ?>" onclick="setVal()"> <?php echo $cl['name'] ?>
                        </li>
                    <?php endforeach; ?>
                    <li class="list-group-item" style="font-size: 18px;" onclick="setVal()">
                        <input type="radio" name="typecancel" value="99" > อื่น ๆ
                        <textarea class="form-control" rows="5" placeholder="ระบุสาเหตุ..." style="display: none;" id="etc"></textarea>
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-block" onclick="confirmCancel()">ยืนยันรายการ <i class="far fa-arrow-alt-circle-right"></i></button>
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
        if (w > 1024) {
            $("#body-work").css({"height": h - 170});
            $("#body-history").css({"height": h - 210});
        } else {
            if (w > 768) {
                $("#title-head").hide();
                $(".text-head-mobile").show();
                $(".head-mobile").html("<font style='color:#ffffff'>รับงาน</font>");
            }
            $("#bb").addClass("modal-dialog-scrollable");
            $("#head-toolbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)"});
            $("#title-head").hide();
            $("#icon-menu-ham").css({"margin-left": "0px"});
            $(".text-head-mobile").show();
            $(".head-mobile").html("<font style='color:#ffffff'>รับงาน</font>");
        }
    }

    function cancelJob(ref) {
        $("#ref_cancel").val(ref);
        $("#popupcancel").modal();
    }

    function confirmCancel() {
        var ref = $("#ref_cancel").val();
        var type = $('input[name="typecancel"]:checked').val();
        //alert(type);
        var etc = $("#etc").val();
        if (type == 99) {
            if (etc == "") {
                Swal.fire('Warning!', 'กรุณาระบุสาเหตุ...', 'warning');
                return false;
            }
        }

        if (!type) {
            Swal.fire('Warning!', 'กรุณาเลืกสาเหตุ...', 'warning');
            return false;
        }
        Swal.fire({
            icon: 'warning',
            title: 'ยืนยันรายการ...?',
            text: 'คุณแน่ใจหรือไม่ที่จะดำเนินรายการต่อ...?',
            showDenyButton: false,
            showCancelButton: true,
            confirmButtonText: `ตกลง`,
            //denyButtonText: `Don't save`,
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                //Swal.fire('Success!', '', 'success');

                var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/cancelwork']) ?>";
                var data = {
                    ref: ref,
                    typecancel: type,
                    typeetc: etc
                };
                $.post(url, data, function(res) {
                    if (res == 1) {
                        window.location.reload();
                    }
                });

            }
        });
    }

    function getViews(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/view']) ?>";
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

    function getJob() {
        var type = $("#souredata").val();
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/getjob']) ?>";
        var data = {type: type};
        $.post(url, data, function(res) {
            $("#job").html(res);
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
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/searchjob']) ?>";
        var data = {customer: customer, project: project};
        $.post(url, data, function(res) {
            $("#job").html(res);
        });
    }

    function setVal() {
        var type = $('input[name="typecancel"]:checked').val();
        if (type == 99) {
            $("#etc").show();
        } else {
            $("#etc").hide();
        }
    }
</script>



