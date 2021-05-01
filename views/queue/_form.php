<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/queue.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\widgets\DatePicker;
use kartik\widgets\TimePicker;
?>

<div class="queue-form">

    <?php $form = ActiveForm::begin(); ?>
<div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>">
                    <button type="button" class="btn btn-dark btn-rounded text-warning"><i class="fa fa-home"></i></button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['queue/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-chevron-left"></i> กลับ</button>
                </a>
                <div class="pull-right">

                    <?= Html::submitButton('บันทึกข้อมูล <i class="fa fa-save"></i>', ['class' => 'btn btn-success btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-6 col-lg-6" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-bottom: none; border-top:0px;">
                <div class="card-header" style="border-left: 0px;">
                    <i class="fa fa-user"></i> ลงคิวงานติดตั้ง
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <?= $form->field($model, 'ref')->hiddenInput(['maxlength' => true])->label(false) ?>
                    <?=
                                $form->field($model, 'queuedate')->widget(DatePicker::ClassName(), [
                                    'name' => 'queuedate',
                                    'type' => DatePicker::TYPE_COMPONENT_APPEND,
                                    'language' => 'th',

                                    'options' => [
                                        'placeholder' => 'Select date ...',
                                        'readonly' => 'readonly'
                                    ],
                                    'pluginOptions' => [
                                        'format' => 'yyyy-mm-dd',
                                        'todayHighlight' => true,
                                        'autoclose' => true
                                    ]
                                ]);
                                ?>
                    <?=
                                $form->field($model, 'timesetup')->widget(TimePicker::ClassName(), [
                                    'name' => 'timesetup',
                                    'options' => ['placeholder' => 'Select date ...'],
                                    'pluginOptions' => [
                                        'showSeconds' => false,
                                        'showMeridian' => false,
                                        'minuteStep' => 1,
                                        'secondStep' => 5,
                                    ]
                                ]);
                                ?>

                                <?= $form->field($model, 'detail')->textArea(['maxlength' => true,'rows' => 4]) ?>
                    
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-6" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px; border-bottom: 0px;">
                <div class="card-content" >
                    <div class="card-header">
                        <i class="fa fa-briefcase"></i> รายละเอียด
                    </div>
                    <div class="card-body" id="box-popup-right" style="overflow: auto; padding: 0px;">
                        <?php
                        echo $this->render('//customer/viewpage', [
                            'model' => $modelCustomer,
                            'filelist' => $file
                        ]);
                        ?>
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
        var w = window.innerWidth;
        if (w > 768) {
            $("#box-popup-left").css({"height": h - 188,"border-bottom": "none"});
            $("#box-popup-right").css({"height": h - 188});
        }
    }

</script>

