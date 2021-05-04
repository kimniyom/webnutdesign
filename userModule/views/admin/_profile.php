<?php

/*
 * This file is part of the Dektrium project
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use app\models\Department;

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\User $user
 * @var dektrium\user\models\Profile $profile
 */
?>

<style>
    .select2-selection{
        height: 40px !important;
        padding: 5px;
        font-size: 14px;
        border:solid #eeeeee 1px;
        border-radius: 15px;
    }
</style>

<?php $this->beginContent('@dektrium/user/views/admin/update.php', ['user' => $user]) ?>

<?php $form = ActiveForm::begin([
    'layout' => 'horizontal',
    'enableAjaxValidation' => true,
    'enableClientValidation' => false,
    'fieldConfig' => [
        'horizontalCssClasses' => [
            'wrapper' => 'col-sm-9',
        ],
    ],
]); ?>

<?= $form->field($profile, 'name') ?>
<?= $form->field($profile, 'nickname') ?>
<?php //$form->field($profile, 'public_email') ?>
<?php //$form->field($profile, 'website') ?>
<?php //$form->field($profile, 'location') ?>
<?php //$form->field($profile, 'gravatar_email') ?>
<?php
    $departmentList = ArrayHelper::map(Department::find()->where(['isshow' => 1])->all(), 'id', 'department');
                                        echo $form->field($profile, 'department')->widget(Select2::classname(), [
                                            'language' => 'th',
                                            'data' => $departmentList,
                                            'options' => ['placeholder' => '... เลือกแผนก ...'],
                                            'pluginOptions' => [
                                                'allowClear' => true,
                                                'multiple' => false
                                            ],
                                        ])->label();
                                        ?>
<?= $form->field($profile, 'tel') ?>

<?= $form->field($profile, 'bio')->textarea() ?>

<div class="form-group">
    <div class="col-lg-offset-3 col-lg-9">
        <?= Html::submitButton(Yii::t('user', 'Update'), ['class' => 'btn btn-block btn-success']) ?>
    </div>
</div>

<?php ActiveForm::end(); ?>

<?php $this->endContent() ?>
