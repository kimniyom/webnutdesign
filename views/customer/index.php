<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'รับงาน';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-index">
    <div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <div class="card-title" style="margin: 0px;">
                        <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/create']) ?>">
                            <button type="button" class="btn btn-success"><i class="fa fa-plus"></i> บันทึกข้อมูลรายละเอียด</button>
                        </a>
                        <div style="position: absolute; right: 5px; top: 5px;">งานที่รับวันนี้</div>
                    </div>
                    <div id="body-work" style="margin-top: 10px; overflow: auto;">
                        <div class="alert alert-dark" role="alert" style="background: none;">
                            <h4 class="alert-heading">ลูกค้า คุณXXX XXX</h4>
                            <p>รายละเอียดงาน ...</p>
                            <hr>
                            <a href="javascript:popupdetail()" class="btn btn-rounded btn-info">ดูรายละเอียด <i class="fa fa-eye"></i></a>
                            <a href="javascript:popupedit()" class="btn btn-rounded btn-warning">แก้ไข <i class="fa fa-pencil"></i></a>
                            <a href="javascript:confirmCancel()" class="btn btn-rounded btn-danger">ยกเลิก <i class="fa fa-remove"></i></a>
                            <p class="mb-0 pull-right" style="text-align: center;">สถานะล่าสุด <br/> ฝ่ายกราฟิก</p>
                        </div>

                        <div class="alert alert-dark" role="alert" style="background: none;">
                            <h4 class="alert-heading">ลูกค้า คุณDemo Demo</h4>
                            <p>รายละเอียดงาน ...</p>
                            <hr>
                            <a href="javascript:void(0)" class="btn btn-rounded btn-info">ดูรายละเอียด</a>
                            <p class="mb-0 pull-right" style="text-align: center;">สถานะล่าสุด <br/> ฝ่ายผลิต</p>
                        </div>

                        <div class="alert alert-dark" role="alert" style="background: none;">
                            <h4 class="alert-heading">ลูกค้า คุณทดสอบ ทดสอบ</h4>
                            <p>รายละเอียดงาน ...</p>
                            <hr>
                            <a href="javascript:void(0)" class="btn btn-rounded btn-info">ดูรายละเอียด</a>
                            <p class="mb-0 pull-right" style="text-align: center;">สถานะล่าสุด<br/>ฝ่ายบัญชี<br/> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">ประวัติการรับงาน</h5>
                    <div id="body-history" style="overflow: auto;">
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


