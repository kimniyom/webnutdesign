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
                            <button class="btn btn-info my-2 btn-rounded search-btn" type="button"><i class="fa fa-search"></i> ค้นหา</button>
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
                <?php if ($dataList) { ?>
                    <?php foreach ($dataList as $rs): ?>
                        <div class="alert alert-dark box-list-work" role="alert" style="background: none;">
                            <h2 class="alert-heading" style=" font-weight: bold; color: rgb(184, 0, 153);"><?php echo $rs['project_name'] ?></h2>
                            <h3 class="alert-heading" style=" font-weight: normal;">กำหนดส่ง: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo $rs['time_getjob'] ?></h3>
                            <h4 class="alert-heading" style=" font-weight: normal;">ลูกค้า: <?php echo $rs['customer'] ?></h4>
                            <hr>
                            <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/view', 'id' => $rs['id'], 'ref' => $rs['ref']]) ?>" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
                            <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/update', 'id' => $rs['id']]) ?>" class="btn btn-rounded btn-warning">แก้ไข <i class="fas fa-pencil-alt"></i></a>
                            <a href="javascript:confirmCancel('<?php echo $rs['ref'] ?>')" class="btn btn-rounded btn-danger">ยกเลิก <i class="fa fa-remove"></i></a>
                            <p class="mb-0 pull-right" style="text-align: center;">สถานะล่าสุด <br/> <?php echo $TimeLineModel->getLastTimeline($rs['ref'])?></p>
                        </div>
                    <?php endforeach; ?>
                <?php } else { ?>
                    ไม่มีงานที่รับวันนี้
                <?php } ?>
            </div>
        </div>
        <div class="col-lg-4 col-md-4" style=" border-left: #eeeeee solid 1px; padding-bottom: 0px;" >
            <div class="card" >
                <div class="card-body" style=" padding-left:0px; padding-right: 10px; padding-bottom: 0px;">
                    <div class="card-title" style=" font-weight: bold;">ประวัติการรับงาน</div>
                    <div id="body-history" style="overflow: auto; padding: 0px;">
                        <div class="steamline m-t-40">
                            <div class="sl-item">
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
                            <div class="sl-item">
                                <div class="sl-left bg-info"><i class="fa fa-image"></i></div>
                                <div class="sl-right">
                                    <div class="font-medium">โรงแรมเวียงตาก <span class="sl-date"> 19/03/2564</span></div>
                                    <div class="desc">
                                        ประเภทงาน: ป้าย<br/>
                                        <a href="javascript:void(0)"
                                           class="btn m-t-10 m-r-5 btn-rounded btn-outline-success btn-sm">ดูรายละเอียด</a>
                                        <a
                                            class="btn m-t-10 btn-rounded btn-outline-danger btn-sm disabled">สถานะล่าสุก รออนุมัติ</a>
                                    </div>
                                </div>
                            </div>
                            <div class="sl-item">
                                <div class="sl-left"> <img class="img-circle" alt="user"
                                                           src="../assets/images/users/1.png"> </div>
                                <div class="sl-right">
                                    <div class="font-medium">ร้าน A-Mobile <span class="sl-date"> 19/03/2564</span></div>
                                    <div class="desc">
                                        ประเภทงาน: ป้าย<br/>
                                        <a href="javascript:void(0)"
                                           class="btn m-t-10 m-r-5 btn-rounded btn-outline-success btn-sm">ดูรายละเอียด</a>
                                        <a
                                            class="btn m-t-10 btn-rounded btn-outline-danger btn-sm disabled">สถานะล่าสุก ส่งงานเรียบร้อย</a>
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

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
        });
            ');
?>

<script>
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            $("#body-work").css({"height": h - 205});
            $("#body-history").css({"height": h - 210});
        } else {
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111"});
        }
    }

    function confirmCancel(ref) {
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
                                      var data = {ref: ref};
                                      $.post(url,data,function(res){
                                        if(res == 1){
                                          window.location.reload();
                                        }
                                      });
                                        
                                    }
                                });
                            }
</script>



