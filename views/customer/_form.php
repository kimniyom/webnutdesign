<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/customer.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use app\models\Department;
use kartik\widgets\DatePicker;
use kartik\widgets\TimePicker;
use kartik\widgets\FileInput;
use kartik\select2\Select2;
?>

<div class="customer-form">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-primary btn-rounded"><i class="fa fa-home"></i> Home</button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['customer/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-info btn-rounded"><i class="fa fa-chevron-left"></i> กลับ</button>
                </a>
                <div class="pull-right">
                    
                    <?= Html::submitButton('บันทึกข้อมูล <i class="fa fa-save"></i>', ['class' => 'btn btn-success btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-6 col-lg-6" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px;">
                <div class="card-header">
                    <i class="fa fa-user"></i> ข้อมูลลูกค้า
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>
                    <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>
                    <?=
                    $form->field($model, 'channel')->radioList([1 => "Line", 2 => "โทรศัพท์", 3 => "เข้ามาที่ร้าน", 4 => "อื่น ๆ"], [
                        'onChange' => 'setChannel()'
                    ])
                    ?>
                    <div id="ch_etc" style=" display: none;">
                        <?= $form->field($model, 'channel_etc')->textInput(['maxlength' => true]) ?>
                    </div>
                    <?= $form->field($model, 'address')->textarea(['rows' => 5]) ?>
                </div>

            </div>
        </div>
        <div class="col-md-6 col-lg-6" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;">
                <div class="card-content" >
                    <div class="card-header">
                        <i class="fa fa-briefcase"></i> รายละเอียดงานการคุยงาน
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto;">
                        <?= $form->field($model, 'project_name')->textInput(['maxlength' => true]) ?>
                        <?php $form->field($model, 'typework')->textInput() ?>

                        <?php //$form->field($model, 'detail')->textarea(['rows' => 6]) ?>
                            <label for="">รายละเอียดข้อมูลใบสั่งงาน</label>
                        <?=
                            $form->field($model, 'detail')->widget(\yii\redactor\widgets\Redactor::className(), [
                                'clientOptions' => [
                                            //'imageManagerJson' => ['/redactor/upload/image-json'],
                                            //'imageUpload' => ['/redactor/upload/image'],
                                            //'fileUpload' => ['/redactor/upload/file'],
                                            'lang' => 'th',
                                            'plugins' => ['fontcolor', 'fullscreen'], //'clips',
                                            'buttonsHide' => ['deleted', 'image', 'file', 'html', 'format'],
                                            'minHeight' => '300px'
                                        ]
                                    ])->label(false)
                                    ?>

                        <?php ///$form->field($model, 'file')->textInput(['maxlength' => true])  ?>

                        <div class="form-group field-upload_files">
                            <label class="control-label" for="upload_files[]" style=" margin-bottom: 0px; padding-bottom: 0px;"> แนบไฟล์หรือรูปภาพที่คุยกับลูกค้า </label>
                            <div style=" padding-top:0px;">
                                <?= $form->field($model, 'ref')->hiddenInput(['maxlength' => 255])->label(false); ?>
                                <?=
                                FileInput::widget([
                                    'name' => 'upload_ajax[]',
                                    'options' => ['multiple' => true], //'accept' => 'image/*' หากต้องเฉพาะ image
                                    'pluginOptions' => [
                                        'overwriteInitial' => false,
                                        'showCaption' => true,
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
                                    'options' => ['placeholder' => 'Select date ...'],
                                    'pluginOptions' => [
                                        'format' => 'yyyy-mm-dd',
                                        'todayHighlight' => true,
                                        'autoclose' => true
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
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <?=
                                $form->field($model, 'transport')->radioList([0 => "ไม่ต้องจัดส่ง", 1 => "ต้องจัดส่ง"])
                                ?>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <?=
                                $form->field($model, 'setup')->radioList([0 => "ไม่ติดตั้ง", 1 => "ติดตั้ง"])
                                ?>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <?=
                                $form->field($model, 'fast')->radioList([0 => "ทั่วไป", 1 => "เร่งด่วน"])
                                ?>
                            </div>
                        </div>

                        <!--
                            ##### เมื่อมีการส่งไปยังแผนกอื่นจะไม่สามารถแก้ไขข้อมูลบ้างส่วนได้ ###########
                        -->
                        <?php if($model->confirm == "0" || empty($model->confirm)){ ?>
                        <hr/>
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <label>ใบเสนอราคา(* เมื่อต้องออกใบเสนอราคาระบบจะบังคับส่งไปยังแผนกบัญชีอัตโนมัติ)</label>
                                <?=
                                $form->field($model, 'quotation')->radioList([0 => "ไม่ต้องออกใบเสนอราคา", 1 => "ต้องออกใบเสนอราคา"], [
                                    'onChange' => 'setQuotation()'
                                ])->label(false);
                                ?>

                            </div>
                        </div>

                        <div class="card" style=" border-radius: 5px;">
                            <div class="card-content">
                                <div class=" card-header">ส่งต่อแผนก(เลือกได้มากกว่า 1)</div>
                                <div class="card-body bg-white" style=" border-radius: 5px; padding-bottom: 5px;">
                                    <?php
//echo $form->field($model, 'cur_dep')->textInput()
                                    $departmentList = ArrayHelper::map(Department::find()->where(['active' => 1])->andWhere(["IN", "id", ['2', '3', '4']])->all(), 'id', 'department');
                                    echo $form->field($model, 'cur_dep')->widget(Select2::classname(), [
                                        'language' => 'th',
                                        'data' => $departmentList,
                                        'options' => ['placeholder' => '... เลือกแผนกส่งต่อ ...'],
                                        'pluginOptions' => [
                                            'allowClear' => true,
                                            'multiple' => true
                                        ],
                                    ])->label(false);
                                    ?>
                                    <?php
                                    /*
                                      $departmentList = ArrayHelper::map(Department::find()->where(['active' => 1])->all(), 'id', 'department');
                                      echo $form->field($model, 'cur_dep')->checkboxList($departmentList)->label(false);
                                     *
                                     */
                                    ?>
                                    <div class="alert alert-warning" id="showaccountalert" style="display: none;">ต้องส่งแผนกบัญชีด้วยทุกครั้ง</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <?=
                                $form->field($model, 'confirm')->radioList([0 => "ยังไม่ตกลงซื้อ", 1 => "ตกลงซื้อ"])
                                ?>
                            </div>
                        </div>
                        <div class="alert alert-danger">
                            !..หมายเหตุ<br/>
                            เมื่อยังไม่มีการยืนยันตกลงซื้อขายข้อมูลจะยังไม่ถูกส่งไปยังแผนกอื่น
                        </div>

                    <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
            setChannelLoad();
        });
            ');
?>

<script type="text/javascript">

    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            $("#box-popup-left").css({"height": h - 193});
            $("#box-popup-right").css({"height": h - 193});
        }
    }

    function setChannel() {
        var channel = $('input[name="Customer[channel]"]:checked').val();
        if (channel == 1 || channel == 4) {
            $("#customer-channel_etc").val("");
            $("#ch_etc").show();
        } else {
            $("#ch_etc").hide();
            $("#customer-channel_etc").val("-");
        }
    }

    function setChannelLoad() {
        var channel = $('input[name="Customer[channel]"]:checked').val();
        if (channel == 1 || channel == 4) {
            $("#ch_etc").show();
        } else {
            $("#ch_etc").hide();
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
        }
    }
</script>
