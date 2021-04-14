<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CustomerSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'project_name') ?>

    <?= $form->field($model, 'customer') ?>

    <?= $form->field($model, 'tel') ?>

    <?= $form->field($model, 'channel') ?>

    <?php // echo $form->field($model, 'channel_etc') ?>

    <?php // echo $form->field($model, 'address') ?>

    <?php // echo $form->field($model, 'typework') ?>

    <?php // echo $form->field($model, 'detail') ?>

    <?php // echo $form->field($model, 'file') ?>

    <?php // echo $form->field($model, 'date_getjob') ?>

    <?php // echo $form->field($model, 'time_getjob') ?>

    <?php // echo $form->field($model, 'cur_dep') ?>

    <?php // echo $form->field($model, 'last_dep') ?>

    <?php // echo $form->field($model, 'create_date') ?>

    <?php // echo $form->field($model, 'user_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
