<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/setup.css" rel="stylesheet">

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\widgets\FileInput;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Branchlaser */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="branchlaser-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px; border-bottom: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['setup/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded text-info"><i class="fa fa-chevron-left"></i></button>
                </a>
                <div class="pull-right">
                    <?= Html::submitButton('บันทึกการติดตั้ง <i class="fa fa-save"></i>', ['class' => 'btn btn-outline-success btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-6 col-lg-6" style="padding-right: 0px; display: none;">
            <div class="card" style="border-radius: 0px; border-top:0px;border-left:0px;">
                <div class="card-header" style="border-radius: 0px;">
                    <i class="fas fa-pencil-ruler"></i> รายละเอียดการติดตั้ง
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <label for="">รายละเอียด</label>
                    <?= $form->field($model, 'ref')->textInput(['maxlength' => true]) ?>
                    <?= $form->field($model, 'user_id')->textInput() ?>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-12" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;">
                <div class="card-content" >
                    <div class="card-header" style="border-radius: 0px;">
                        <i class="fas fa-paperclip"></i> รูปภาพการติดตั้งงาน
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
                                        'uploadUrl' => Url::to(['/setup/upload-ajax', 'refsetup' => $model->refsetup]),
                                        'uploadExtraData' => [
                                            'refsetup' => $model->refsetup,
                                        ],
                                        'maxFileCount' => 100
                                    ]
                                ]);
                                ?>
                            </div>
                        </div>
                        <?= $form->field($model, 'refsetup')->hiddenInput(['maxlength' => true])->label(false) ?>
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
            $("#box-popup-left").css({"height": h - 189});
            $("#box-popup-right").css({"height": h - 189});
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

