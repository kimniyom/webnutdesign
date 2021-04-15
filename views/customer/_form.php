<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/customer.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Department;
use kartik\widgets\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Customer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-form">
    <?php $form = ActiveForm::begin(); ?>
    <div class="card" id="head-toolbar">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <button type="button" class="btn btn-info btn-rounded"><i class="fa fa-chevron-left"></i> กลับ</button>
                <div class="pull-right">
                    <button type="button" class="btn btn-danger btn-rounded"><i class="fa fa-remove"></i> ยกเลิก</button>
                    <?= Html::submitButton('บันทึกข้อมูล <i class="fa fa-save"></i>', ['class' => 'btn btn-success btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-lg-6">
            <div class="card">
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
        <div class="col-md-6 col-lg-6">
            <div class="card">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fa fa-briefcase"></i> รายละเอียดงาน
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto;">
                        <?= $form->field($model, 'project_name')->textInput(['maxlength' => true]) ?>
                        <?= $form->field($model, 'typework')->textInput() ?>

                        <?= $form->field($model, 'detail')->textarea(['rows' => 6]) ?>

                        <?= $form->field($model, 'file')->textInput(['maxlength' => true]) ?>

                        <?php //$form->field($model, 'date_getjob')->textInput() ?>
                        <?=
                        $form->field($model, 'date_getjob')->widget(DatePicker::ClassName(), [
                            'name' => 'date_getjob',
                            'options' => ['placeholder' => 'Select date ...'],
                            'pluginOptions' => [
                                'format' => 'dd/mm/yyyy',
                                'todayHighlight' => true,
                                'autoclose' => true
                            ]
                        ]);
                        ?>

                        <?= $form->field($model, 'time_getjob')->textInput() ?>
                        <div class="card" style=" border-radius: 5px;">
                            <div class="card-content">
                                <div class=" card-header">ส่งต่อแผนก</div>
                                <div class="card-body bg-white" style=" border-radius: 5px; padding-bottom: 5px;">
                                    <?php //$form->field($model, 'cur_dep')->textInput() ?>
                                    <?php
                                    $departmentList = ArrayHelper::map(Department::find()->where(['active' => 1])->all(), 'id', 'department');
                                    echo $form->field($model, 'cur_dep')->checkboxList($departmentList)->label(false);
                                    ?>
                                </div>
                            </div>
                        </div>
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
        });
            ');
?>

<script type="text/javascript">

    function setScreens() {
        var h = window.innerHeight;
        var boxH = ((h / 2) - 109);

        $("#box-popup-left").css({"height": h - 245});
        $("#box-popup-right").css({"height": h - 245});

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
</script>
