<link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/account.css" rel="stylesheet">
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Account */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="account-form">
    <?php
    $form = ActiveForm::begin([
                'options' => ['enctype' => 'multipart/form-data']
    ]);
    ?>
    <div class="card" id="head-toolbar" style="border-radius: 0px; margin-bottom: 0px; border-right:0px; border-right: 0px; border-left: 0px;">
        <div class="card-content">
            <div class="card-body" style=" padding: 10px;">
                <a href="<?php echo Yii::$app->urlManager->createUrl(['site']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-home text-warning"></i></button>
                </a>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['account/index']) ?>" style="text-decoration: none;">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-chevron-left text-info"></i></button>
                </a>

                <div class="pull-right">
                    <?= Html::submitButton('บันทึกข้อมูล <i class="fa fa-save"></i>', ['class' => 'btn btn-dark btn-rounded']) ?>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; padding-top: 0px;">
        <div class="col-md-6 col-lg-6" style="padding-right: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px;">
                <div class="card-header">
                    <i class="fa fa-user"></i> แนบหรืออัพโหลดใบเสนอราคา
                </div>
                <div class="card-body" id="box-popup-left" style="overflow: auto;">
                    <?php if ($error) { ?>
                        <br/><div class="alert alert-danger"><?php echo $error ?></div>
                    <?php } ?>

                    <?php //$form->field($model, 'link')->textInput(['maxlength' => true]) ?>
                    <?php //$form->field($model, 'file')->fileInput()->label(false) ?>
                    <label for="">รายละเอียด / ใบเสนอราคา</label>
                    <em>
                        *วิธีแนบลิงค์ คลิกที่ icon <img src="<?php echo Url::to('@web/images/link-icon.jpg') ?>" alt="" style="width: 36px;">
                    </em>
                    <?=
                    $form->field($model, 'detail')->widget(\yii\redactor\widgets\Redactor::className(), [
                        'clientOptions' => [
                            //'imageManagerJson' => ['/redactor/upload/image-json'],
                            //'imageUpload' => ['/redactor/upload/image'],
                            //'fileUpload' => ['/redactor/upload/file'],
                            'lang' => 'th',
                            'plugins' => ['fontcolor', 'fullscreen'], //'clips',
                            'buttonsHide' => ['deleted', 'image', 'html', 'format'],
                            'minHeight' => '300px'
                        ]
                    ])->label(false)
                    ?>
                    <label>บันทึกข้อมูลโดย</label>
                    <?php echo dektrium\user\models\Profile::findOne(['user_id' => Yii::$app->user->id])['name'] ?>
                    <div class="alert alert-info">หมายเหตุ.. เมื่อท่านกดบันทึกข้อมูล ข้อมูลจะถูกส่งไปยังแผนกกราฟิกอัตโนมัติ</div>
                    <?= $form->field($model, 'ref')->HiddenInput(['maxlength' => true])->label(false) ?>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-6" style=" padding-left: 0px;">
            <div class="card" style="border-radius: 0px; border-top:0px; border-left:0px; border-right:0px;">
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
            $("#box-popup-left").css({"height": h - 193});
            $("#box-popup-right").css({"height": h - 193});
        }
        $("#menu4").addClass("active");
    }
</script>
