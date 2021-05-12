<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;

/* @var $this yii\web\View */
/* @var $searchModel app\models\TransportSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();

$this->title = 'ส่งมอบงาน';
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
        #popupaddwork .modal-dialog{
            min-width: 99% !important;
            margin-top: 5px !important;
            margin: auto;
        }

    }

</style>
<div class="transport-index">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-bottom: 0px; ">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left: 10px;">
                <nav class="navbar navbar-expand-lg navbar-light" style=" padding: 0px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                        <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                    </a>
                    <div class="navbar-brand" style=" color: #ffffff;" id="title-head">
                        ส่งมอบงาน
                    </div>
                    <button class="navbar-toggler bg-dark btn-rounded" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="btn btn-sm btn-rounded text-white" style="color: rgb(184, 0, 153); font-weight: bold; padding: 0px;"><i class="fa fa-search"></i> ค้นหา</span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="form-inline my-2 my-lg-0 my-box-search" style="border-radius: 30px;  padding: 1px 10px 1px 10px;">
                            <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่อลูกค้า.." aria-label="ค้นด้วยชื่อลูกค้า.." id="txtcustomer" style="border-radius: 20px; border:0px;">
                            <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่องาน.." aria-label="ค้นด้วยชื่องาน.." id="txtproject" style="border-radius: 20px; border:0px;">
                            <button class="btn btn-dark my-2 btn-rounded search-btn" type="button" onclick="searchJob()"><i class="fa fa-search"></i> ค้นหา</button>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
    </div>

    <div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-12 col-md-12">
            <div style=" top: 0px; font-weight: bold; margin-left: 30px; margin-top: 10px;">
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
                    <div class="card-title" style=" font-weight: bold;">จัดส่งแล้วรอยืนยัน</div>
                    <div id="body-history" style="overflow: auto; padding: 0px;">
                        <table class="table">
                            <?php //foreach ($transportTag as $tag): ?>
                            <tr>
                                <td><?php //echo $tag['customer']     ?></td>
                                <td><?php //echo $tag['tagnumber']     ?></td>
                                <td></td>
                            </tr>
                            <?php //endforeach; ?>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Popup Detail -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupaddwork" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" style="position: relative;">
            <div class="modal-header">
                <h5 class="modal-title">ข้อมูลรายละเอียด</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body" id="box-popup" style=" border-radius:10px;">
                <div id="view-customer"></div>
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
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            $("#body-work").css({"height": h - 170});
            $("#body-history").css({"height": h - 210});
        } else {
            $(".modal-dialog").addClass("modal-dialog-scrollable");
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111", "margin-right": "10px"});

        }
    }

    function getJob() {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/approveload']) ?>";
        var data = {};
        $.post(url, data, function(res) {
            $("#job").html(res);
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

    function searchJob() {
        var customer = $("#txtcustomer").val();
        var project = $("#txtproject").val();

        if (customer == "" && project == "") {
            $("#txtcustomer").focus();
            Swal.fire('Warning!', 'กรุณาเลือกอย่างน้อย 1 ตัวเลือก', 'warning');
            return false;
        }
        $("#job").html("<h4 style='text-align:center;'>Loading ...</h4>");
        var url = "<?php echo Yii::$app->urlManager->createUrl(['transport/searchjob']) ?>";
        var data = {customer: customer, project: project};
        $.post(url, data, function(res) {
            $("#job").html(res);
        });
    }

    function confirmTranfer(ref) {
        var title = "ยืนยันการจัดส่งงาน..?";

        Swal.fire({
            icon: 'info',
            title: title,
            showDenyButton: true,
            //showCancelButton: true,
            confirmButtonText: `ตกลง`,
            denyButtonText: `cancel`,
            allowOutsideClick: false
        }).then((result) => {
            if (result.isConfirmed) {
                var url = "<?php echo Yii::$app->urlManager->createUrl(['transport/updatestatus']) ?>";
                var data = {ref: ref};
                $.post(url, data, function(res) {
                    window.location.reload();
                });
            }
        });
    }
</script>
