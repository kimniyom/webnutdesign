<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/graphic.css" rel="stylesheet">
<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\widgets\FileInput;
use kartik\editors\Summernote;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
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
    <?php $form = ActiveForm::begin(); ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px; border-bottom: 0px;">
            <div class="card-content">
                <div class="card-body" style=" padding: 10px;">
                    <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                        <button type="button" class="btn btn-primary btn-rounded"><i class="fa fa-home"></i> Home</button>
                    </a>
                    <a href="<?php echo Yii::$app->urlManager->createUrl(['graphic']) ?>" style="text-decoration: none;">
                        <button type="button" class="btn btn-info btn-rounded"><i class="fa fa-chevron-left"></i> กลับ</button>
                    </a>
                    <div class="pull-right">
                        <button type="button" class="btn btn-dark btn-rounded" onclick="getViews('<?php echo $model->ref ?>')"><i class="fa fa-eye"></i> ดูข้อมูล</button>
                        <?= Html::submitButton('บันทึกข้อมูล <i class="fa fa-save"></i>', ['class' => 'btn btn-success btn-rounded']) ?>
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
                    <?= $form->field($model, 'ref')->hiddenInput(['maxlength' => true])->label(false) ?>
                    <?php //$form->field($model, 'detail')->textarea(['rows' => 6]) ?>
                    <?php
                    // Usage with ActiveForm and model and default settings
                    echo $form->field($model, 'detail')->widget(Summernote::class, [
                        'options' => ['placeholder' => '...']
                    ]); 
                    ?>
                    <?=
                        $form->field($model, 'flagsend')->radioList([0 => "ยังไม่ส่งต่อตอนนี้", 1 => "ต้องการส่ง" ,2 => "สิ้นสุดงานที่นี้"])
                    ?>
                    <p class="text-danger">* เมื่อท่านเลือก "ต้องการส่งต่อ" ท่านจะไม่สามารถแก้ไขข้อมูลในส่วนนี้ได้และให้แน่ใจว่าได้รับอนุญาตจากผู้บริหารหรือผู้ตรวจสอบให้ผลิตแล้ว กรุณาตรวจสอบข้อมูลก่อนส่งไปยังแผนกอื่น</p>
                    <hr/>
                    <label>ผู้รับงาน</label>
                    <?php echo dektrium\user\models\Profile::findOne(['user_id' => Yii::$app->user->identity->id])['name'] ?>
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
                    <?= $form->field($model, 'link')->textInput(['maxlength' => true]) ?>
                    <div class="form-group field-upload_files">
                            <label class="control-label" for="upload_files[]" style=" margin-bottom: 0px; padding-bottom: 0px;"> แนบไฟล์รูปภาพ </label>
                            <div style=" padding-top:0px;">
                                <?= $form->field($model, 'ref_graphic')->textInput(['maxlength' => true])->label() ?>
                               <?php echo $model->ref_graphic ?>
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

    function getViews(ref) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/view']) ?>";
        var data = {ref: ref};
        $.post(url, data, function(res) {
            $("#view-customer").html(res);
            $("#popupaddwork").modal();
        });
    }
</script>
