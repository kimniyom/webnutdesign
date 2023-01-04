<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/graphic.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\widgets\FileInput;
use kartik\editors\Summernote;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use kartik\select2\Select2;
use kartik\editors\Summernote;
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
<div class="graphic-form">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px; border-bottom: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['graphic/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded text-info"><i class="fa fa-chevron-left"></i></button>
                </a>
                <button type="button" class="btn btn-dark btn-rounded" onclick="getViews('<?php echo $model->ref ?>')"><i class="fa fa-eye"></i> ดูข้อมูล</button>
                <div class="pull-right">

                    <?= Html::submitButton('บันทึกข้อมูล / สั่งผลิต <i class="fa fa-save"></i>', ['class' => 'btn btn-outline-success btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-6 col-lg-6" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px;border-left:0px;">
                <div class="card-header" style="border-radius: 0px;">
                    <i class="fas fa-pencil-ruler"></i> รายละเอียดใบสั่งงาน
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <label for="">รายละเอียดข้อมูลใบสั่งงาน</label>
                    <em>
                        *วิธีแนบลิงค์ คลิกที่ icon <img src="<?php echo Url::to('@web/images/link-icon.jpg') ?>" alt="" style="width: 36px;">
                    </em>
                    <?php //$form->field($model, 'detail')->textarea(['rows' => 6]) ?>
                    <?php
                    /*
                      echo $form->field($model, 'detail')->widget(Summernote::class, [
                      'options' => ['placeholder' => '...']
                      ]);
                     */
                    ?>
                    <?php
                    /*
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
                     * 
                     */
                    echo $form->field($model, 'detail')->widget(Summernote::class, [
                            'useKrajeePresets' => true,
                                // other widget settings
                        ])->label(false);
                    ?>
                    <?=
                    $form->field($model, 'flagsend')->radioList(
                            [1 => "ยังไม่ส่งต่อตอนนี้", 2 => "ต้องการส่ง", 3 => "สิ้นสุดงานที่นี้(ไม่มีการส่งผลิต)", 4 => "ส่งผลิตนอกร้าน"], [
                        'onChange' => 'setSendDep()'
                            ]
                    )
                    ?>
                    <?php
                    echo $form->field($model, 'todep')->widget(Select2::classname(), [
                        'language' => 'th',
                        'data' => ArrayHelper::map(app\models\Department::find()->where(['IN', 'id', ['5', '6', '7']])->all(), 'id', 'department'),
                        'options' => ['placeholder' => '... เลือกแผนกส่งต่อ ...'],
                        'pluginOptions' => [
                            'allowClear' => true,
                            'multiple' => true
                        ],
                    ])->label(false);
                    ?>
                    <p style=" display: none;" class="alert alert-danger" id="outside">
                        * เมื่อส่งผลิตนอกร้านก่อนส่งงานต้องได้รับการยืนยันจากลูกค้าแล้วเท่านั้น จะไม่สามารถแก้ไขภายหลังได้ ข้อมูลจะถูกส่งไปยังแผนกบัญชีเพื่อติดตามการผลิตอัตโนมัติ
                    </p>
                    <p class="text-danger">* เมื่อท่านเลือก "ต้องการส่งต่อ" ท่านจะไม่สามารถแก้ไขข้อมูลในส่วนนี้ได้และให้แน่ใจว่าได้รับอนุญาตจากผู้บริหารหรือผู้ตรวจสอบให้ผลิตแล้ว กรุณาตรวจสอบข้อมูลก่อนส่งไปยังแผนกอื่น</p>
                    <hr/>
                    <label>ผู้รับงาน</label>
                    <?php $useName = dektrium\user\models\Profile::findOne(['user_id' => Yii::$app->user->identity->id])['name'] ?>
                    <input type="text" class="form-control" value="<?php echo $useName ?>" readonly="readonly">
                    <?= $form->field($model, 'ref')->hiddenInput(['maxlength' => true])->label(false) ?>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-6" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;">
                <div class="card-content" >
                    <div class="card-header" style="border-radius: 0px;">
                        <i class="fas fa-paperclip"></i> ไฟล์ออกแบบ / ไฟล์ตัวอย่าง
                    </div>

                    <div class="card-body" id="box-popup-right" style="overflow: auto;">
                        <?php //$form->field($model, 'link')->textInput(['maxlength' => true])    ?>
                        <div class="form-group field-upload_files">
                            <label class="control-label" for="upload_files[]" style=" margin-bottom: 0px; padding-bottom: 0px;"> แนบไฟล์รูปภาพ </label>
                            <div style=" padding-top:0px;">

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
                        <?= $form->field($model, 'ref_graphic')->hiddenInput(['maxlength' => true])->label(false) ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>
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
            setLoad();
        });
            ');
?>

<script type="text/javascript">

    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if (w > 768) {
            $("#box-popup-left").css({"height": h - 189});
            $("#box-popup-right").css({"height": h - 189});
        }

        $("#menu3").addClass("active");
    }

    function getViews(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/view']) ?>";
        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
        });
    }

    function setSendDep() {
        var channel = $('input[name="Graphic[flagsend]"]:checked').val();
        if (channel != 2) {
            $("#graphic-todep").select2("val", "0");
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

    function setLoad() {
        var channel = "<?php echo $model->flagsend ?>";
        if (channel != 2) {
            $("#graphic-todep").select2("val", "0");
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
