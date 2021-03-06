<style>
    .meter {
        box-sizing: content-box;
        height: 15px; /* Can be anything */
        position: relative;
        margin: 0px 0 0px 0; /* Just for demo spacing */
        background: #d25fa0;
        border-radius: 25px;
        padding: 2px;
        box-shadow: inset 0 -1px 1px rgba(255, 255, 255, 0.3);
    }
    .meter > span {
        display: block;
        height: 100%;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        background-color: rgb(43, 194, 83);
        background-image: linear-gradient(
            center bottom,
            rgb(43, 194, 83) 37%,
            rgb(84, 240, 84) 69%
            );
        box-shadow: inset 0 2px 9px rgba(255, 255, 255, 0.3),
            inset 0 -2px 6px rgba(0, 0, 0, 0.4);
        position: relative;
        overflow: hidden;
    }
    .meter > span:after,
    .animate > span > span {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        background-image: linear-gradient(
            -45deg,
            rgba(255, 255, 255, 0.2) 25%,
            transparent 25%,
            transparent 50%,
            rgba(255, 255, 255, 0.2) 50%,
            rgba(255, 255, 255, 0.2) 75%,
            transparent 75%,
            transparent
            );
        z-index: 1;
        background-size: 50px 50px;
        animation: move 2s linear infinite;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        overflow: hidden;
    }
    .animate > span:after {
        display: none;
    }
    .orange > span {
        background-image: linear-gradient(#f1a165, #f36d0a);
    }

    .yellow > span {
        background-image: linear-gradient(#f8ea0d, #f8ea0d);
    }

    .red > span {
        background-image: linear-gradient(#ff0000, #f42323);
    }

    .nostripes > span > span,
    .nostripes > span::after {
        background-image: none;
    }

    @media screen and (max-device-width: 768px) {
        /* STYLES HERE */
        .text-gf-head{
            font-size: 20px;
        }

        .alert-heading{
            margin-top: -10px;
        }
    }

    @media screen and (min-device-width: 769px) and (max-device-width: 1024px) {
        /* STYLES HERE */
        .text-gf-head{
            font-size: 20px;
        }

        .alert-heading{
            margin-top: -10px;
        }
    }

    .active-false{
        background-image:linear-gradient(to right, #cf1b76, #666666);
    }

    .active-true{
        background-image:linear-gradient(to right, #ffff00, #cf1b76);
    }

</style>
<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;
use app\models\GraphicLog;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
//$this->title = '??????????????????';
//$this->params['breadcrumbs'][] = $this->title;
?>


<!--
?????????????????????????????????????????????????????????????????????????????????????????????????????????
-->
<input type="hidden" id="_ref"/>
<div class="row" style="margin: 0px; margin-top: 0px; margin-bottom: 10px; ">
    <?php if ($dataList) { ?>
        <?php
        foreach ($dataList as $rs):
            ?>
            <div class="col-md-6 col-lg-6" style=" padding: 0px;">
                <div class="alert alert-dark box-list-work" role="alert" style="background: #d25fa0; font-family: skv; margin: 10px; border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px; padding-bottom: 25px;">

                    <div>
                        <div style=" width: 80%; float: left;">
                            <div style="height: 45px; overflow: hidden; width: 100%; position: relative; padding-top: 5px;">
                                <div class="alert-heading" >
                                    <span class="text-gf-head"  style=" font-weight: bold; color: #FFFFFF; cursor: pointer; line-height: 35pt;" onclick="getViews('<?php echo $rs['ref'] ?>', '<?php echo $rs['status'] ?>')"><?php echo $rs['project_name'] ?></span>
                                </div>
                            </div>
                            <div style="height: 20px; overflow: hidden; clear: both; ">
                                <div class="text-tran-customer" style=" font-weight: bold; color:#FFFFFF;"><i class="far fa-user-circle"></i> <?php echo ($rs['customer']) ? $rs['customer'] : "-"; ?></div>
                            </div>
                        </div>

                        <div style="float: right; position: absolute; top: 5px; right: 15px;">
                            <!-- ?????????????????????????????????????????????????????? -->
                            <?php if ($rs['status'] == "2") { ?>
                                <?php if ($rs['status'] != "4") { ?>
                                    <a id="btn-list" class="btn btn-rounded btn-dark btn-sm pull-right active-false" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px;width: 100%;" onclick="popupConfirm('<?php echo $rs['ref'] ?>')">??????????????????????????? </a>
                                <?php } else { ?>
                                    <a class="btn btn-rounded btn-rounded btn-dark btn-sm pull-right active-true" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; width: 100%; height: 20px; cursor: default;">
                                        <span  style=" background: #cf1b76; border-radius: 10px; width: 30px; height: 20px; position: absolute; right: 0px; top: 0px;"></span>
                                    </a>
                                <?php } ?>
                            <?php } else { ?>
                                <a class="btn btn-rounded btn-rounded btn-dark btn-sm pull-right" id="btn-list" style=" font-weight: bold;letter-spacing: 0.5px; padding: 0px 5px; width: 100%; height: 20px; cursor: default;">
                                    ???????????????????????????
                                </a>
                            <?php } ?>
                        </div>
                    </div>

                    <div style=" clear: both; border-top: solid 3px #eac0d6; padding-top: 10px;">
                        <div style=" float: left; width: 55%;">
                            <?php
                            $statusBar = $ConfigWeb->statusBar($rs['D'], $rs['H'], $rs['INDAY'], $rs['date_getjob']);
                            ?>
                            <div class="meter <?php echo $statusBar['color'] ?> nostripes">
                                <span style="width: <?php echo $statusBar['percent'] ?>; font-size: 12px; color: #FFFFFF; text-align: center; letter-spacing: 1px;">
                                    <?php echo $statusBar['text'] ?>
                                </span>
                            </div>
                        </div>
                        <p class="mb-0 pull-right" style="text-align: center; color: #ffffff;">?????????: <?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?> <?php echo substr($rs['time_getjob'], 0, 5) ?></p>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php } else { ?>
        <div class="container">
            <div class="alert alert-primary" style="text-align: center">???????????????????????????????????????</div>
        </div>
    <?php } ?>
</div>

<!-- Popup EditWork -->
<div class="modal fade" tabindex="-1" role="dialog" id="popupeditwork" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="position: relative;">
            <div class="modal-header bg-danger">
                <h5 class="modal-title text-white">???????????????????????????????????????????????????????????????????????????</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn-exit">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <h3><i class="fa fa-info fa-2x"></i> ??????????????????????????????</h3>
                <input type="hidden" name="" id="ref_cancel">
                <ul class="list-group">
                    <?php foreach ($maseditwork as $cl): ?>
                        <li class="list-group-item" style="font-size: 18px;">
                            <input type="radio" name="typeedit" value="<?php echo $cl['id'] ?>" onclick="setVal()"> <?php echo $cl['name'] ?>
                        </li>
                    <?php endforeach; ?>
                    <li class="list-group-item" style="font-size: 18px;" onclick="setVal()">
                        <input type="radio" name="typeedit" value="99" > ???????????? ???
                        <textarea class="form-control" rows="5" placeholder="???????????????????????????????????????????????????????????????????????????..." style="display: none;" id="etc"></textarea>
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-block" onclick="confirmEdit()">???????????????????????????????????? <i class="far fa-arrow-alt-circle-right"></i></button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    setStatusWork();
    function setStatusWork() {
        var w = window.innerWidth;
        if (w < 768) {
            $(".status-work").removeClass('mb-0 pull-right');
            $(".status-work").css({"width": "100%", "margin-top": "10px"});
        }
    }

    function updateStatus() {
        var ref = $("#_ref").val();
        Swal.fire({
            icon: 'info',
            title: "??????????????????",
            showDenyButton: true,
            //showCancelButton: true,
            confirmButtonText: `????????????`,
            denyButtonText: `cancel`,
            allowOutsideClick: false
        }).then((result) => {
            if (result.isConfirmed) {
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchfacture/updatestatus']) ?>";
                var data = {status: 2, ref: ref};
                $.post(url, data, function(res) {
                    $("#popupaddwork").modal("hide");
                    getJob();
                });
            }
        });

    }

    function editWork(ref) {
        $("#ref_cancel").val(ref);
        $("#popupeditwork").modal();
    }

    function confirmEdit() {
        var ref = $("#ref_cancel").val();
        var type = $('input[name="typeedit"]:checked').val();
        //alert(type);
        var etc = $("#etc").val();
        if (type == 99) {
            if (etc == "") {
                Swal.fire('Warning!', '?????????????????????????????????????????????...', 'warning');
                return false;
            }
        }

        if (!type) {
            Swal.fire('Warning!', '?????????????????????????????????????????????...', 'warning');
            return false;
        }
        Swal.fire({
            icon: 'warning',
            title: '????????????????????????????????????...?',
            text: '?????????????????????????????????????????????????????????????????????????????????????????????????????????...?',
            showDenyButton: false,
            showCancelButton: true,
            confirmButtonText: `????????????`,
            //denyButtonText: `Don't save`,
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                //Swal.fire('Success!', '', 'success');
                var url = "<?php echo Yii::$app->urlManager->createUrl(['branchfacture/editwork']) ?>";
                var data = {
                    ref: ref,
                    type: type,
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

    function setVal() {
        var type = $('input[name="typeedit"]:checked').val();
        if (type == 99) {
            $("#etc").show();
        } else {
            $("#etc").hide();
        }
    }
</script>