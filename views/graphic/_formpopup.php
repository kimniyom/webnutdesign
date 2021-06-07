<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\ConfigWeb;
use yii\widgets\ActiveForm;
use kartik\widgets\FileInput;
use dosamigos\ckeditor\CKEditor;

$configWeb = new ConfigWeb();
?>
<style type="text/css" media="screen">
    .dupcheckbox {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 12px;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* Hide the browser's default checkbox */
    .dupcheckbox input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
        height: 0;
        width: 0;
    }

    /* Create a custom checkbox */
    .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        background-color: #ffffff;
        border: solid #cccccc 1px;
        border-radius: 5px;
    }

    /* On mouse-over, add a grey background color */
    .dupcheckbox:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the checkbox is checked, add a blue background */
    .dupcheckbox input:checked ~ .checkmark {
        background-color: #2196F3;
    }

    /* Create the checkmark/indicator (hidden when not checked) */
    .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }

    /* Show the checkmark when checked */
    .dupcheckbox input:checked ~ .checkmark:after {
        display: block;
    }

    /* Style the checkmark/indicator */
    .dupcheckbox .checkmark:after {
        left: 9px;
        top: 5px;
        width: 5px;
        height: 10px;
        border: solid white;
        border-width: 0 3px 3px 0;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
    }

    .help-block{
        color: #ffcc00;
    }
</style>
<!-- Popup Detail -->

<div class="modal fade" tabindex="-1" role="dialog" id="popupOrder" data-backdrop="static">
    <div class="modal-dialog modal-dialog-scrollable" role="document">

        <?php $form = ActiveForm::begin(['action' => ['graphic/update', 'ref' => $model->ref], 'options' => ['enctype' => 'multipart/form-data']]); ?>
        <div class="modal-content" style="position: relative;background-image: linear-gradient( 135deg, #db7daf 10%, #cc1c77 100%); border-radius: 20px;">
            <div class="modal-header" style="border:none;">
                <h4 class="modal-title" style=" font-family: skv; text-align: center; color: #FFFFFF;">สั่งงาน</h4>
                <a href="<?php echo Url::to(['graphic/index']) ?>" class=" pull-right">
                    <div class="btn btn-danger" style=" border-radius: 15px;"><i class="fa fa-remove fa-2x"></i></div></a>
            </div>
            <div class="modal-body" id="box-popup">
                <div class="graphic-form-1" style=" padding: 0px; font-family: skv; font-size: 18px;">

                    <label for="" style=" font-family: skv; color: #ffffff;">รายละเอียดข้อมูลใบสั่งงาน</label>
                    <?php
                    /*
                      $form->field($model, 'detail')->widget(CKEditor::className(), [
                      'options' => ['rows' => 6],
                      'preset' => 'basic'
                      ])->label(false);
                     */
                    ?>

                    <?=
                    $form->field($model, 'detail')->widget(\yii\redactor\widgets\Redactor::className(), [
                        'clientOptions' => [
                            //'imageManagerJson' => ['/redactor/upload/image-json'],
                            //'imageUpload' => ['/redactor/upload/image'],
                            //'fileUpload' => ['/redactor/upload/file'],
                            'lang' => 'th',
                            'plugins' => ['fontcolor', 'fullscreen'], //'clips',
                            'buttonsHide' => ['deleted', 'file', 'html', 'format'], //'image'
                            'minHeight' => '300px'
                        ]
                    ])->label(false)
                    ?>
                    <?= $form->field($model, 'ref')->hiddenInput(['maxlength' => true])->label(false) ?>
                    <?php //$form->field($model, 'link')->textInput(['maxlength' => true])       ?>
                    <div class="form-group field-upload_files">
                        <label class="control-label" for="upload_files[]" style=" margin-bottom: 0px; padding-bottom: 0px; color: #ffffff;"> แนบไฟล์รูปภาพ </label>
                        <div style=" padding-top:0px; background: #FFFFFF; border-radius: 5px; padding: 5px;">

                            <?=
                            FileInput::widget([
                                'name' => 'upload_ajax[]',
                                'options' => [
                                    'multiple' => true,
                                ], //'accept' => 'image/*' หากต้องเฉพาะ image
                                'pluginOptions' => [
                                    'overwriteInitial' => false,
                                    'showCaption' => true,
                                    'showRemove' => false,
                                    'showUpload' => false,
                                    'initialPreviewShowDelete' => true,
                                    //'initialPreview' => $initialPreview,
                                    'initialPreviewConfig' => $initialPreviewConfig,
                                    'uploadUrl' => Url::to(['/graphic/upload-ajax', 'ref_graphic' => $model->ref_graphic]),
                                    'uploadExtraData' => [
                                        'ref_graphic' => $model->ref_graphic,
                                    ],
                                    'maxFileCount' => 100
                                ]
                            ]);
                            ?>
                        </div>
                    </div>
                    <div id="content" style=" font-family: skv; color: #FFFFFF;">
                        <?php
                        //1 => "ยังไม่ส่งต่อตอนนี้",
                        echo $form->field($model, 'flagsend')->radioList(
                                [2 => "ส่งต่อแผนกอื่น", 3 => "สิ้นสุดงานที่นี้(ไม่มีการส่งผลิต)", 4 => "ส่งผลิตนอกร้าน"], [
                            'onChange' => 'setSendDep()'
                                ]
                        )->label(false);
                        ?>
                        <div class="row" id="todep-gf">
                            <div class="col-md-4 col-lg-4 col-6">
                                <label class="dupcheckbox">งานพิมพ์
                                    <input type="checkbox" value="5" name="todep[]" onclick="setSendDep()">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="col-md-4 col-lg-4 col-6">
                                <label class="dupcheckbox">CNC / Laser
                                    <input type="checkbox" value="6" name="todep[]" onclick="setSendDep()">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="col-md-4 col-lg-4 col-6">
                                <label class="dupcheckbox">ผลิตทั่วไป
                                    <input type="checkbox" value="7" name="todep[]" onclick="setSendDep()">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="col-md-4 col-lg-4 col-6">
                                <label class="dupcheckbox">ช่าง
                                    <input type="checkbox" value="8" name="todep[]" onclick="setSendDep()">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <?= $form->field($model, 'ref_graphic')->hiddenInput(['maxlength' => true])->label(false) ?>
                </div>
            </div>
            <div class="modal-footer" style=" border:none;">
                <div style="text-align: center; width: 100%;" id="btn-save-gf">
                    <?= Html::submitButton('ส่งผลิต <i class="fa fa-save"></i>', ['class' => 'btn btn-dark btn-rounded btn-lg btn-block']) ?>
                </div>
            </div>
        </div>
        <?php ActiveForm::end(); ?>
    </div>
</div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
            setLoad();
            setSendDep();
$("#popupOrder").modal();
        });
            ');
?>

<script type="text/javascript">
    function setScreens() {

        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            //$("#box-popup-left").css({"height": h - 189});
            //$("#box-popup-right").css({"height": h - 189});
        }

        $('input[name="todep[]"]').each(function() {
            this.checked = false;
        });
    }
    function setSendDep() {
        var channel = $('input[name="Graphic[flagsend]"]:checked').val();
        var count = $('input[name="todep[]"]:checked').length;

        if (channel == 2) {
            //$('input:checkbox').removeAttr('checked');
            $("#todep-gf").show();
            if (count == 0) {
                $("#btn-save-gf").hide();
            } else {
                $("#btn-save-gf").show();
            }
        } else {
            $('input[name="todep[]"]').each(function() {
                this.checked = false;
            });
            $("#btn-save-gf").show();
            $("#todep-gf").hide();
            //$('#graphic-todep').prop('disabled', false);
        }

        if (channel == 4) {
            $("#outside").show();
        } else {
            $("#outside").hide();
        }
    }

    function setLoad() {
        var channel = "<?php echo $model->flagsend ?>";
        if (channel != 2) {
            //$("#graphic-todep").select2("val", "0");
            $('#graphic-todep').prop('disabled', 'disabled');

        } else {
            $('#graphic-todep').prop('disabled', false);

        }

        if (channel == 4) {
            $("#outside").show();
        } else {
            $("#outside").hide();
        }
    }
</script>

