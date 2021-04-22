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



</style>
<div class="customer-index">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-bottom: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left: 10px;">
                <nav class="navbar navbar-expand-lg navbar-light" style=" padding: 0px;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                        <button type="button" class="btn btn-primary btn-rounded"><i class="fa fa-home"></i> Home</button>
                    </a>
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['customer/create']) ?>">
                        <button type="button" class="btn btn-success btn-rounded "><i class="fa fa-plus"></i> สร้างใหม่</button>
                    </a>
                    <button class="navbar-toggler bg-white btn-rounded" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="btn btn-sm btn-rounded" style="color: rgb(184, 0, 153); font-weight: bold; padding: 0px;"><i class="fa fa-search"></i> ค้นหา</span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="form-inline my-2 my-lg-0 my-box-search" style="border-radius: 30px;  padding: 1px 10px 1px 10px;">
                            <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่อลูกค้า.." aria-label="ค้นด้วยชื่อลูกค้า.." id="txtcustomer" style="border-radius: 20px; border:0px;">
                            <input class="form-control mr-sm-2" type="search" placeholder="ค้นด้วยชื่องาน.." aria-label="ค้นด้วยชื่องาน.." id="txtproject" style="border-radius: 20px; border:0px;">
                            <button class="btn btn-info my-2 btn-rounded search-btn" type="button" onclick="searchJob()"><i class="fa fa-search"></i> ค้นหา</button>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
    </div>
    <div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-8 col-md-8">
            <div style=" top: 0px; font-weight: bold; margin-left: 30px; margin-top: 10px;">
                !หมายเหตุ ข้อมูลจะหายไปเมื่อมีการยกเลิกงานหรืองานได้ Approve แล้ว
            </div>
            <div id="body-work" style="margin-top: 10px; overflow: auto;">
                <div id="job">
                    <div style="text-align: center; margin-top: 10%;">Loading...</div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-4" style=" border-left: #eeeeee solid 1px; padding-bottom: 0px;" >
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
                                        <a href="javascript:popupdetail()"
                                           class="btn m-t-10 m-r-5 btn-rounded btn-outline-success btn-sm">ดูรายละเอียด</a>
                                        <a
                                            class="btn m-t-10 btn-rounded btn-outline-danger btn-sm disabled">สถานะล่าสุก กราฟิก</a>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php /*
      GridView::widget([
      'dataProvider' => $dataProvider,
      'filterModel' => $searchModel,
      'columns' => [
      ['class' => 'yii\grid\SerialColumn'],
      'id',
      'project_name',
      'customer',
      'tel',
      'channel',
      'channel_etc',
      'address',
      'typework',
      'detail:ntext',
      'file',
      'date_getjob',
      'time_getjob',
      'cur_dep',
      'last_dep',
      'create_date',
      'user_id',

      ['class' => 'yii\grid\ActionColumn'],
      ],
      ]);
     */ ?>


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
            <div class="modal-body" id="box-popup">
                <div id="view-customer"></div>
            </div>
        </div>
    </div>
</div>

<!-- Popup Cancel -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupcancel" data-backdrop="static">
    <div class="modal-dialog" role="document">
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
                    <?php foreach($mascancel as $cl): ?>
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
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            $("#body-work").css({"height": h - 170});
            $("#body-history").css({"height": h - 210});
        } else {
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111"});
        }
    }

    function cancelJob(ref){
        $("#ref_cancel").val(ref);
        $("#popupcancel").modal();
    }

    function confirmCancel() {
        var ref = $("#ref_cancel").val();
        var type = $('input[name="typecancel"]:checked').val();
        //alert(type);
        var etc = $("#etc").val();
        if (type == 99) {
            if(etc == ""){
                Swal.fire('Warning!', 'กรุณาระบุสาเหตุ...', 'warning');
                return false;
            }
        } 

        if(!type){
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
                $.post(url, data, function (res) {
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
        $.post(url, data, function (res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
        });
    }

    function getJob() {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/getjob']) ?>";
        var data = {};
        $.post(url, data, function (res) {
            $("#job").html(res);
        });
    }

    function searchJob() {
        var customer = $("#txtcustomer").val();
        var project = $("#txtproject").val();
        
        if(customer == "" && project == ""){
            $("#txtcustomer").focus();
            Swal.fire('Warning!', 'กรุณาเลือกอย่างน้อย 1 ตัวเลือก', 'warning');
            return false;
        }
        $("#job").html("<h4 style='text-align:center;'>Loading ...</h4>");
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/searchjob']) ?>";
        var data = {customer: customer, project: project};
        $.post(url, data, function (res) {
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



