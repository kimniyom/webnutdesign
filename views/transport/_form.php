<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/account.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
?>

<div class="transport-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-primary btn-rounded"><i class="fa fa-home"></i> Home</button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['transport/index']) ?>" style="text-decoration: none;">
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
                    <i class="fa fa-user"></i> ข้อมูลจัดส่ง
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <?= $form->field($model, 'ref')->textInput(['maxlength' => true]) ?>
                    <?= $form->field($model, 'address')->textarea(['rows' => 6]) ?>
                    <?= $form->field($model, 'tagnumber')->textInput() ?>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
