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

$this->title = 'จัดส่ง';
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

</style>
<div class="transport-index">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-bottom: 0px; font-family: skv;padding-bottom: 5px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left: 10px;">
                <div style="position: absolute; left: 5px; z-index: 2; top: 3px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                        <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                    </a>
                </div>
                <font style=" color: #ffffff; text-align: center; width: 100%; position: absolute; right: 0px; padding-top: 5px; font-size: 24px; z-index: 0;" id="title-head">
                จัดส่ง
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

    <div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-8 col-md-8">
            <div id="body-work" style="margin-top: 10px; overflow: auto;">
                <div id="job">
                    <div style="text-align: center; margin-top: 10%;">Loading...</div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-4" style=" border-left: #FFFFFF solid 1px; padding-bottom: 0px; padding-left: 0px; font-family: skv;" >
            <div class="card" >
                <div class="card-body" style=" padding-left:0px; padding-right: 10px; padding-bottom: 0px;background: #eac0d6;">
                    <div class="card-title" style=" font-weight: bold; margin-left: 10px; color: #000000;">จัดส่งแล้วรอยืนยัน</div>
                    <div id="body-history" style="overflow: auto; padding: 0px; background: #eac0d6;">
                        <table class="table">
                            <?php foreach ($transportTag as $tag): ?>
                                <tr>
                                    <td style="border-color: #FFFFFF; padding: 5px;">
                                        <a href="#" style="color: #000000; font-weight: bold;" onclick="getViews('<?php echo $tag['ref'] ?>')"><?php echo $tag['project_name'] ?></a>

                                    </td>
                                    <td style=" border-color: #FFFFFF; padding: 5px;"><a href="<?php echo $tag['link'] ?>" target="_blank"><?php echo $tag['tagnumber'] ?></a></td>
                                    <td style=" border-color: #FFFFFF; padding: 5px; width: 50px;"><a onclick="confirmTranfer('<?php echo $tag['ref'] ?>')"  style="cursor: pointer; padding: 0px 2px; font-size: 12px;" class="btn btn-dark btn-xs btn-block">ยืนยัน</a></td>
                                </tr>
                            <?php endforeach; ?>
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

    setInterval(function() {
        getJob();
    }, 300000);

    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        $(".tab-bottom").css({"background": "#eac0d6", "border-top": "solid 1px #ffffff", "color": "#ffffff"});
        $(".page-wrapper").css({"background": "#eac0d6"});
        if (w > 1024) {
            $("#body-work").css({"height": h - 155});
            $("#body-history").css({"height": h - 195});
        } else {
            if (w > 768) {
                $("#body-work").css({"height": h - 155});
                $("#body-history").css({"height": h - 195});
                $("#title-head").hide();
                $(".text-head-mobile").show();
                $(".head-mobile").html("<font style='font-size:32px;color:#ffffff;'>จัดส่ง</font>");
                //$("#head-toolbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)", "box-shadow": "#343434 0px 5px 10px 0px"});
            } else if (w > 500) {

                //$(".topbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)", "border-top": "0px", "color": "#ffffff"});
                $("#head-toolbar").css({"background-image": "linear-gradient(to right, #c65f8e, #cf1b76)"});
                $("#title-head").hide();
                $("#icon-menu-ham").css({"margin-left": "0px"});
                $(".text-head-mobile").show();
                $(".head-mobile").html("<font style='color:#FFFFFF;'>จัดส่ง</font>");
                //$(".sourecombo").css({"background": "#eac0d6"});
            } else {
                $("#title-head").hide();
                $(".text-head-mobile").show();
                $(".head-mobile").html("<font style='font-size:20px;color:#ffffff;'>จัดส่ง</font>");
            }
        }
    }



    function getJob() {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['transport/job']) ?>";
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
