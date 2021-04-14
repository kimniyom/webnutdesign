<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Customer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-6 col-lg-6">
            <div class="card">
                <div class="card-content">
                    <div class="card-header">
                        <i class="fa fa-user"></i> ข้อมูลลูกค้า
                    </div>
                    <div class="card-body" id="box-popup-left" style="overflow: auto;">
                        <?= $form->field($model, 'project_name')->textInput(['maxlength' => true]) ?>

                        <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>

                        <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>

                        <?= $form->field($model, 'channel')->textInput() ?>

                        <?= $form->field($model, 'channel_etc')->textInput(['maxlength' => true]) ?>

                        <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

                        <?= $form->field($model, 'typework')->textInput() ?>

                        <?= $form->field($model, 'detail')->textarea(['rows' => 6]) ?>

                        <?= $form->field($model, 'file')->textInput(['maxlength' => true]) ?>

                        <?= $form->field($model, 'date_getjob')->textInput() ?>

                        <?= $form->field($model, 'time_getjob')->textInput() ?>

                        <?= $form->field($model, 'cur_dep')->textInput() ?>

                        <?= $form->field($model, 'last_dep')->textInput() ?>

                        <?= $form->field($model, 'create_date')->textInput() ?>

                        <?= $form->field($model, 'user_id')->textInput() ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
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
        
        $("#box-popup-left").css({"height": h - 220});
        $("#box-popup-right").css({"height": h - 220});

        $(".box-popup-left").css({"height": h - 220});
        $(".box-popup-right").css({"height": h - 220});
    }
</script>
