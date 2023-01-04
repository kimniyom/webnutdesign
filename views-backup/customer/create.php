<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Customer */

$this->title = 'บันทึกข้อมูลรับงาน';
//$this->params['breadcrumbs'][] = ['label' => 'Customers', 'url' => Yii::$app->urlManager->createUrl(['customer'])];
//$this->params['breadcrumbs'][] = $this->title;
?>

<div class="customer-create">

    <?=
    $this->render('_form', [
        'model' => $model,
        'initialPreview' => [],
        'initialPreviewConfig' => [],
        'flag' => "c"
    ])
    ?>
</div>

