<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Graphic */

$this->title = 'กราฟิก:รับงาน';
?>
<div class="graphic-update">
    <?= $this->render('_form', [
        'model' => $model,
        'initialPreview' => $initialPreview, 
        'initialPreviewConfig' => $initialPreviewConfig
    ]) ?>
</div>
