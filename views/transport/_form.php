<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/transport.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;

use app\models\Customer;

$address = Customer::findOne(['ref' => $model->ref])['address'];
?>

<div class="transport-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-home text-warning"></i></button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['transport/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-chevron-left text-info"></i></button>
                </a>

                <div class="pull-right">
                    <?= Html::submitButton('บันทึกข้อมูล <i class="fa fa-save"></i>', ['class' => 'btn btn-outline-success btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-6 col-lg-6" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-bottom: 0px;">
                <div class="card-header" style="background: #FFFFFF; border-left: 0px;">
                    <ion-icon name="car-sport-outline" style="font-size: 16px; float: left;"></ion-icon>&nbsp;ข้อมูลจัดส่ง
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <?= $form->field($model, 'ref')->hiddenInput(['maxlength' => true])->label(false) ?>
                    <?= $form->field($model, 'address')->textarea(['rows' => 6,'value' => $address]) ?>
                    <?= $form->field($model, 'tagnumber')->textInput() ?>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-6" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;border-bottom: 0px;">
                <div class="card-content" >
                    <div class="card-header" style="background: #ffffff;">
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
            $("#box-popup-left").css({"height": h - 190});
            $("#box-popup-right").css({"height": h - 190});
        }
    }
</script>
