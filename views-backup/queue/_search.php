<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\QueueSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="queue-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'ref') ?>

    <?= $form->field($model, 'uset_id') ?>

    <?= $form->field($model, 'queuedate') ?>

    <?= $form->field($model, 'timesetup') ?>

    <?php // echo $form->field($model, 'approve') ?>

    <?php // echo $form->field($model, 'confirm') ?>

    <?php // echo $form->field($model, 'dupdate') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
