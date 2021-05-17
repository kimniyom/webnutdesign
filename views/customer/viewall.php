<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/customer.css" rel="stylesheet">
<style type="text/css">
    table thead tr th{
        color: #000000;
    }

    table tbody tr td{
        color: #000000;
        padding: 0px;
    }
</style>



<?php
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;
use dektrium\user\models\Profile;

$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
$this->title = 'งานทั้งหมด';
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
            min-width: 100% !important;
            margin-right:-10px;

        }
    }

    .customer-viewall table thead tr th{
        white-space: nowrap;
    }

    .customer-viewall table tbody tr td{
        white-space: nowrap;
        padding: 5px;
    }

</style>
<div class="customer-viewall">
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-bottom: 0px; padding-top: 5px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 0px; padding-left: 10px;">
                <nav class="navbar navbar-expand-lg navbar-light" style=" padding: 0px; font-family: skv;">
                    <a class="navbar-brand" href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                        <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                    </a>
                    <div style="margin-right: 10px; font-size: 20px; color: #FFFFFF; text-align: center;">งานทั้งหมด</div>
<div style="display: none;">
                    <button class="navbar-toggler bg-dark btn-rounded" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="btn btn-sm btn-rounded text-white" style="color: rgb(184, 0, 153); font-weight: bold; padding: 0px;"><i class="fa fa-search"></i> ค้นหา</span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="form-inline my-2 my-lg-0 my-box-search" style="border-radius: 30px;  padding: 1px 10px 1px 10px;">
                            <input class="form-control mr-sm-2 mr-md-2" type="search" placeholder="ค้นด้วยชื่อลูกค้า.." aria-label="ค้นด้วยชื่อลูกค้า.." id="txtcustomer">
                            <input class="form-control mr-sm-2 mr-md-2" type="search" placeholder="ค้นด้วยชื่องาน.." aria-label="ค้นด้วยชื่องาน.." id="txtproject" >
                            <button class="btn btn-dark my-2 btn-rounded search-btn" type="button" onclick="searchJob()"><i class="fa fa-search"></i> ค้นหา</button>
                        </div>
                    </div>
</div>
                    <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/export']) ?>" target="_bank" style="position: absolute;right: 10px;" id="btn-export">
                    <button type="button" class="btn btn-dark" ><i class="fa fa-file-excel-o"></i> Export</button></a>
                    
                </nav>

            </div>
        </div>
    </div>

    <div class="row" style="margin-bottom: 0px; font-family: skv; font-size: 16px;">
        <div class="col-lg-12 col-md-12">
            <div style=" top: 0px; font-weight: bold; margin-left: 10px; margin-top: 10px;">
                <!--
                <span class="badge bg-dark text-white">ทั้งหมด <?php //echo count($dataList)        ?> </span>
                <span class="badge bg-success text-white">ยืนยันแล้ว 0 </span>
                <span class="badge bg-warning text-white">กำลังดำเนินการ 0 </span>
                <span class="badge bg-danger text-white">ยกเลิก 0 </span>
                -->
                
            </div>
            <div id="body-work" style="margin-top: 10px; overflow: auto; margin-bottom: 15px;">
                <div id="job" class=" table-responsive">
                    <table id="tb-all" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th style=" text-align: center;">#</th>
                                <th>สถานะ</th>
                                <th>ลูกค้า</th>
                                <th>งาน</th>
                                <th>วันที่รับงาน</th>
                                <th>กำหนดส่ง</th>
                                <th>ผุ้รับงาน</th>
                                <th>แผนกล่าสุด</th>
                                <th style="text-align: center">จัดส่ง</th>
                                <th>ติดตั้ง</th>
                                <th>งานพิมพ์</th>
                                <th>CNC/LASER</th>
                                <th>ผลิตทั่วไป</th>
                                <th>ส่งมอบงาน</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 0;
                            foreach ($dataList as $rs): $i++;
                                if ($rs['flag'] == 2) {
                                    $tr = "table-danger";
                                } else if ($rs['flag'] == 1) {
                                    $tr = "table-success";
                                } else {
                                    $tr = "";
                                }
                                ?>
                                <tr class="<?php echo $tr ?>">
                                    <td style="text-align: center;"><?php echo $i ?></td>
                                    <td style=" font-size: 18px;">
                                        <?php if ($rs['flag'] == 2) { ?>
                                            <label class="label label-danger" style=" margin: 0px; width: 100%;"><ion-icon name="close-outline"></ion-icon> ยกเลิก</label>
                                        <?php } else if ($rs['flag'] == 1) { ?>
                                            <label class="label label-success" style=" margin: 0px; width: 100%;"><ion-icon name="checkmark-outline"></ion-icon> สำเร็จ</label>
                                        <?php } else { ?>
                                            <label class="label label-warning" style=" margin: 0px; color: #ffffff;"><ion-icon name="cog-outline"></ion-icon> กำลังดำเนินงาน</label>
                                        <?php } ?>
                                    </td>
                                    <td><?php echo $rs['customer'] ?></td>
                                    <td><?php echo $rs['project_name'] ?></td>
                                    <td><?php echo $ConfigWeb->thaidate(substr($rs['create_date'],0,10)) ?></td>
                                    <td><?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></td>
                                    <td><?php echo Profile::findOne(['user_id' => $rs['user_id']])['name'] ?></td>
                                    <td>
                                        <?php echo $TimeLineModel->getLastTimeline($rs['ref']) ?>
                                    </td>
                                    <td style=" text-align: center;">
                                        <?php
                                        if ($rs['transport'] == 1) {
                                            $transport = app\models\Transport::findOne(['ref' => $rs['ref']]);
                                            if ($transport['status'] == 1) {
                                                echo "<font class='text-danger'><i class='fa fa-remove'></i></font>";
                                            } else {
                                                //$useTransport = Profile::findOne(['user_id' => $transport['user_id']])['name'];
                                                echo "<i class='fa fa-check text-success'></i>";
                                            }
                                            ?>
                                        <?php } else { ?>
                                            -
                                        <?php } ?>
                                    </td>
                                    <td style=" text-align: center">
                                        <?php
                                        if ($rs['setup'] == 1) {
                                            $setup = app\models\Queue::findOne(['ref' => $rs['ref']]);
                                            if ($setup['approve'] == 0) {
                                                echo "<font class='text-danger'><i class='fa fa-remove'></i></font>";
                                            } else {
                                                //$useSetup = Profile::findOne(['user_id' => $setup['usersetup']])['name'];
                                                echo "<i class='fa fa-check text-success'></i>";
                                            }
                                            ?>
                                        <?php } else { ?>
                                            -
                                        <?php } ?>
                                    </td>
                                    <td style="text-align: center;">
                                        <?php
                                        $bPrint = \app\models\Branchprint::findOne(['ref' => $rs['ref']]);
                                        if ($rs['print_status'] == 1) {
                                            echo "<i class='fa fa-remove text-danger'></i>";
                                        } else if ($rs['print_status'] == 2) {
                                            //$usePrint = Profile::findOne(['user_id' => $bPrint['user_id']])['name'];
                                            echo "<i class='fa fa-check text-success'></i>";
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td style=" text-align: center;">
                                        <?php
                                        $bLaser = \app\models\Branchlaser::findOne(['ref' => $rs['ref']]);
                                        if ($rs['cnc_status'] == 1) {
                                            echo "<i class='fa fa-remove text-danger'></i>";
                                        } else if ($rs['cnc_status'] == 2) {
                                            //$useLaser = Profile::findOne(['user_id' => $bLaser['user_id']])['name'];
                                             echo "<i class='fa fa-check text-success'></i>";
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td style=" text-align: center;">
                                        <?php
                                        $bFacture = \app\models\Branchfacture::findOne(['ref' => $rs['ref']]);
                                        if ($rs['manufacture_status'] == 1) {
                                            echo "<i class='fa fa-remove text-danger'></i>";
                                        } else if ($rs['manufacture_status'] == 2) {
                                            //$useFacture = Profile::findOne(['user_id' => $bFacture['user_id']])['name'];
                                            echo "<i class='fa fa-check text-success'></i>";
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td style=" text-align: center;">
                                        <?php
                                        if ($rs['flag'] != 2) {
                                            if ($rs['approve'] == 0) {
                                                echo "<i class='fa fa-remove text-danger'></i>";
                                            } else {
                                                //$useApprove = Profile::findOne(['user_id' => $rs['userapprove']])['name'];
                                                echo "<i class='fa fa-check text-success'></i>";
                                            }
                                        }
                                        ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
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
            <div class="modal-body" id="box-popup">
                <div id="view-customer"></div>
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

<script>
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        var hTb = h - 240;
        if (w > 1024) {
            //$("#body-work").css({"height": h - 210});
            //$("#body-history").css({"height": h - 210});

            $("#tb-all").DataTable({
                "scrollY": hTb + "px",
                "scrollCollapse": true,
                "scrollX":true,
                "paging": false,
                "info": false,
                "oLanguage": {
                    "sSearch": "ค้นหา: ", // เปลี่ยน label คำว่า Search เป็น ค้นหา
                }
                
            });
        } else {
            $("#btn-export").hide();
            $(".mr-sm-2").css({"margin-top": "10px"});
            $(".search-btn").addClass("btn btn-block");
            $(".my-box-search").css({"background": "#111111", "margin-right": "10px"});
        }
    }



    function getViews(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/view']) ?>";
        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
        });
    }

    function getJob() {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/getjob']) ?>";
        var data = {};
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

</script>



