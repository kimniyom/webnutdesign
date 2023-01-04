<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/customer.css" rel="stylesheet">
<style type="text/css">
    .field-customer-transport{
        padding-bottom: -1px;
        margin-bottom: -1px;
    }
    .field-customer-setup{
        padding-bottom: -1px;
        margin-bottom: -1px;
    }
    .field-customer-quotation{
        padding-bottom: -1px;
        margin-bottom: -1px;
    }



</style>
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use app\models\Department;
use app\models\Typecustomer;
use kartik\widgets\DatePicker;
use kartik\widgets\TimePicker;
use kartik\widgets\FileInput;
use kartik\select2\Select2;
?>

<div class="customer-form" >
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px; font-family: skv;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                    <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-chevron-left text-info"></i> กลับ</button>
                </a>
                <div class="pull-right">

                    <?= Html::submitButton('บันทึกข้อมูล <i class="fa fa-save"></i>', ['class' => 'btn btn-dark btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; padding-top: 0px; font-family: skv;">
        <div class="col-md-6 col-lg-6" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left: 0px; border-bottom: 0px;">
                <div class="card-header" style=" background: #de93bc; border-radius: 0px; border-bottom: 0px;">
                    <i class="fa fa-user"></i> ข้อมูลลูกค้า
                </div>

                <div class="card-body" id="box-popup-left" style="overflow: auto; background: #eac0d6;">
                    <label style=" margin-bottom: 0px;"> ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง</label>
                    <div style="font-size:14px; color: #000000;">(ถ้าชื่อหน่วยงาน<font style='color:red'>ใส่ให้ถูกต้องเหมือนกันทุกครั้ง</font> ระวังเรื่องเคาะวรรค อักษรย่อ หรือเครื่องหมายอื่น ๆ)</div>
                    <?= $form->field($model, 'customer')->textInput(['maxlength' => true])->label(false) ?>
                    <?php
                    $TypeList = ArrayHelper::map(Typecustomer::find()->all(), 'id', 'typename');
                    echo $form->field($model, 'typecustomer')->widget(Select2::classname(), [
                        'data' => $TypeList,
                        'options' => ['placeholder' => '... เลือกปรเภทลูกค้า ...'],
                        'pluginOptions' => [
                            'allowClear' => true,
                            'multiple' => false
                        ],
                    ])->label("ประเภทลูกค้า");
                    ?>
                    <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>

                    <?=
                    $form->field($model, 'channel')->radioList([1 => "Line", 2 => "โทรศัพท์", 3 => "เข้ามาที่ร้าน", 4 => "อื่น ๆ"], [
                        'onChange' => 'setChannel()'
                    ])
                    ?>
                    <div id="ch_etc" style=" display: none;">
                        <?= $form->field($model, 'channel_etc')->textInput(['maxlength' => true]) ?>
                    </div>
                    <div id="ch_line" style=" display: none;">
                        <?= $form->field($model, 'lineid')->textInput(['maxlength' => true]) ?>
                    </div>
                    <?= $form->field($model, 'address')->textarea(['rows' => 5]) ?>

                    <?=
                    $form->field($model, 'payment')->radioList([1 => "ยังไม่ชำระเงิน", 2 => "วางมัดจำ", 3 => "ชำระ้งินแล้ว"]);
                    ?>

                    <hr/>
                    <div style=" text-align: center;">
                        <label style=" text-align: center;">ประเมินคิวงานที่มีก่อนกำหนดส่งมอบ</label>
                    </div>
                    <div id="queue"></div>
                </div>

            </div>
        </div>
        <div class="col-md-6 col-lg-6" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px; border-bottom: 0px;">
                <div class="card-content" >
                    <div class="card-header" style="background: #de93bc; border-radius: 0px; border-bottom: 0px;">
                        <i class="fa fa-briefcase"></i> รายละเอียดงานการคุยงาน
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto; background: #eac0d6;">
                        <label style=" margin-bottom: 0px;"> ชื่องาน</label>
                        <div style="font-size:14px; color: #000000;">ระบุสั้นๆ พอรู้ว่าคืองานอะไร เริ่มจากชื่อวัสดุ เช่น(ป้ายไวนิบข้าวมันไก่,พลาสวูดพิมพ์ยูวีรูปเด็ก เป็นต้น)</div>
                        <?= $form->field($model, 'project_name')->textInput(['maxlength' => true])->label(false) ?>
                        <?php $form->field($model, 'typework')->textInput() ?>

                        <?php //$form->field($model, 'detail')->textarea(['rows' => 6]) ?>
                        <label style=" margin-bottom: 0px;"> รายละเอียด</label>
                        <div style="font-size:14px; color: #000000;">ให้เขียนว่า งานชิ้นนี้ให้ทำอย่างไรบ้าง กรณี 1 ชุดคำสั่งมีหลายงานให้เขียนทีละงาน โดยใช้เครื่องหมาย -- คั่นบันทัดใหม่</div>
                        <?=
                        $form->field($model, 'detail')->widget(\yii\redactor\widgets\Redactor::className(), [
                            'clientOptions' => [
                                //'imageManagerJson' => ['/redactor/upload/image-json'],
                                //'imageUpload' => ['/redactor/upload/image'],
                                //'fileUpload' => ['/redactor/upload/file'],
                                'lang' => 'th',
                                'plugins' => ['fontcolor', 'fullscreen'], //'clips',
                                'buttonsHide' => ['deleted', 'image', 'file', 'html', 'format'], //'image'
                                'minHeight' => '300px'
                            ]
                        ])->label(false)
                        ?>

                        <?php ///$form->field($model, 'file')->textInput(['maxlength' => true])  ?>

                        <div class="form-group field-upload_files" >
                            <label class="control-label" for="upload_files[]" style=" margin-bottom: 0px; padding-bottom: 0px;"> แนบไฟล์หรือรูปภาพที่คุยกับลูกค้า </label>
                            <div style="font-size:14px; color: #000000;">ถ้ามีไฟล์รูปให้อัพโหลด ถ้าเขียนบนกระดาษให้ถ่ายภาพกระดาษลงได้เลย</div>
                            <div style=" padding-top:0px; background: #FFFFFF; border-radius: 5px; padding: 5px;">
                                <?= $form->field($model, 'ref')->hiddenInput(['maxlength' => 255])->label(false); ?>
                                <?=
                                FileInput::widget([
                                    'name' => 'upload_ajax[]',
                                    'options' => ['multiple' => true], //'accept' => 'image/*' หากต้องเฉพาะ image
                                    'pluginOptions' => [
                                        'overwriteInitial' => false,
                                        'showCaption' => true,
                                        'showUpload' => false,
                                        'showRemove' => false,
                                        'initialPreviewShowDelete' => true,
                                        'initialPreview' => $initialPreview,
                                        'initialPreviewConfig' => $initialPreviewConfig,
                                        'uploadUrl' => Url::to(['/customer/upload-ajax', 'ref' => $model->ref]),
                                        'uploadExtraData' => [
                                            'ref' => $model->ref,
                                        ],
                                        'maxFileCount' => 100
                                    ]
                                ]);
                                ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <?php //$form->field($model, 'date_getjob')->textInput() ?>
                                <?=
                                $form->field($model, 'date_getjob')->widget(DatePicker::ClassName(), [
                                    'name' => 'date_getjob',
                                    'language' => 'th',
                                    'options' => [
                                        'placeholder' => 'Select date ...',
                                        'readonly' => 'readonly',
                                        'value' => date("Y-m-d")
                                    ],
                                    'pluginOptions' => [
                                        'format' => 'yyyy-mm-dd',
                                        'todayHighlight' => true,
                                        'autoclose' => true,
                                    ],
                                    'pluginEvents' => [
                                        "changeDate" => "function(e) { getJobSend(); }",
                                    ]
                                ]);
                                ?>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <?php //$form->field($model, 'time_getjob')->textInput() ?>
                                <?=
                                $form->field($model, 'time_getjob')->widget(TimePicker::ClassName(), [
                                    'name' => 'time_getjob',
                                    'options' => ['placeholder' => 'Select date ...'],
                                    'pluginOptions' => [
                                        'showSeconds' => false,
                                        'showMeridian' => false,
                                        'minuteStep' => 1,
                                        'secondStep' => 5,
                                    ]
                                ]);
                                ?>
                            </div>
                        </div>
                        <div class="row" style=" margin: 0px;">
                            <div class="col-md-12 col-lg-12" style=" padding-bottom: 0px;">
                                <?=
                                $form->field($model, 'transport')->radioList(['0' => "รับหน้าร้าน", '1' => "จัดส่ง"])->label(false);
                                ?>
                            </div>
                            <div class="col-md-12 col-lg-12" style=" padding-bottom: 0px;">
                                <?=
                                $form->field($model, 'setup')->radioList(['0' => "ไม่ติดตั้ง", '1' => "ติดตั้ง"])->label(false);
                                ?>
                            </div>

                        </div>
                        <!--
                            ##### เมื่อมีการส่งไปยังแผนกอื่นจะไม่สามารถแก้ไขข้อมูลบ้างส่วนได้ ###########
                        -->
                        <?php if ($flag == "c") { ?>
                            <div class="row" style=" margin: 0px;">
                                <div class="col-md-12 col-lg-12">
                                    <?=
                                    $form->field($model, 'quotation')->radioList([0 => "ไม่ต้องออกใบเสนอราคา", 1 => "ต้องออกใบเสนอราคา"], [
                                        'onChange' => 'setQuotation()'
                                    ])->label(false);
                                    ?>

                                </div>
                            </div>


                            <div class="row" style=" margin: 0px;">
                                <div class="col-md-6 col-lg-4 col-6">
                                    <label class="dupcheckbox">กราฟิก
                                        <input type="checkbox" value="3" name="cur_dep[]">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="col-md-6 col-lg-4 col-6">
                                    <label class="dupcheckbox">งานพิมพ์
                                        <input type="checkbox" value="5" name="cur_dep[]">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="col-md-6 col-lg-4 col-6">
                                    <label class="dupcheckbox">CNC / Laser
                                        <input type="checkbox" value="6" name="cur_dep[]">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="col-md-6 col-lg-4 col-6">
                                    <label class="dupcheckbox">ผลิตทั่วไป
                                        <input type="checkbox" value="7" name="cur_dep[]">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                            <hr/>
                            <div class="row" style=" margin: 0px;">
                                <div class="col-md-12 col-lg-12">
                                    <?=
                                    $form->field($model, 'level')->radioList([1 => "Level 1", 2 => "Level 2", 3 => "Level 3", 4 => "Level 4", 5 => "Level 5"]);
                                    ?>
                                </div>
                            </div>
                            <div class="alert alert-danger" style=" display: none;">
                                !..หมายเหตุ<br/>
                                เมื่อยังไม่มีการยืนยันตกลงซื้อขายข้อมูลจะยังไม่ถูกส่งไปยังแผนกอื่น
                            </div>

                        <?php } ?>

                        <div class="col-md-4 col-lg-4" style=" display: none;">
                            <?=
                            $form->field($model, 'fast')->radioList(['0' => "ทั่วไป", '1' => "ด่วนสำคัญ"])
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>

<!-- Popup Detail -->
<div class="modal fade " tabindex="-1" role="dialog" id="popupdate" data-backdrop="static" >
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content  bg-dark" style="position: relative;">
            <div class="modal-header border-dark">
                <h5 class="modal-title text-white" style=" text-align: center; font-family: skv;">คิวงาน</h5>

            </div>
            <div class="modal-body" id="box-popup" style=" font-family: skv; ">
                <div id="queue-popup"></div>
            </div>
            <div class=" modal-footer border-dark">
                <button type="button" class="btn btn-danger btn-rounded btn-block"  data-dismiss="modal" aria-label="Close" id="btn-exit">ปิด</button>
            </div>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
            setChannelLoad();
            LoadgetJobSend();
        });
            ');
?>

<script type="text/javascript">

    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        $(".tab-bottom").css({"background": "#eac0d6", "border-top": "0px", "color": "#ffffff"});
        if (w > 1024) {
            $("#box-popup-left").css({"height": h - 193});
            $("#box-popup-right").css({"height": h - 193});
        } else {
            if (w > 768) {
                $("#box-popup-left").css({"height": h - 193});
                $("#box-popup-right").css({"height": h - 193});
                $(".text-head-mobile").show();
                $(".head-mobile").html("<font style='color:#ffffff'>รับงาน</font>");
            }
            $(".text-head-mobile").show();
            $(".head-mobile").html("<font style='color:#ffffff'>รับงาน</font>");
        }

        $("#menu1").addClass("active");
    }

    function setChannel() {
        var channel = $('input[name="Customer[channel]"]:checked').val();
        if (channel == 1) {
            $("#ch_line").show();
            $("#ch_etc").hide();
        } else if (channel == 4) {
            $("#ch_etc").show();
            $("#ch_line").hide();
        } else {
            $("#ch_etc").hide();
            $("#ch_line").hide();
        }
    }

    function setChannelLoad() {
        var channel = $('input[name="Customer[channel]"]:checked').val();
        if (channel == 1) {
            $("#ch_line").show();
            $("#ch_etc").hide();
        } else if (channel == 4) {
            $("#ch_etc").show();
            $("#ch_line").hide();
        } else {
            $("#ch_etc").hide();
            $("#ch_line").hide();
        }
    }

    function setQuotation() {
        var channel = $('input[name="Customer[quotation]"]:checked').val();
        if (channel == 1) {
            //$("#customer-cur_dep").select2("val", "4");
            //$("#customer-cur_dep").attr("readonly", "readonly");
            $("#showaccountalert").show();
        } else {
            //$("#customer-cur_dep").select2("val", "0");
            //$("#customer-cur_dep").prop("readonly", false);
            $("#showaccountalert").hide();
        }
    }

    function LoadgetJobSend() {
        var dateSend = $("#customer-date_getjob").val();
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/getqueue']) ?>";
        var data = {datesend: dateSend};
        $.post(url, data, function(res) {
            $("#queue").html(res);
        });
    }

    function getJobSend() {
        var dateSend = $("#customer-date_getjob").val();
        var url = "<?php echo Yii::$app->urlManager->createUrl(['customer/getqueue']) ?>";
        var data = {datesend: dateSend};
        $.post(url, data, function(res) {
            $("#popupdate").modal();
            $("#queue").html(res);
            $("#queue-popup").html(res);
        });
    }
</script>
