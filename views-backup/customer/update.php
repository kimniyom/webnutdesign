<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Customer */

$this->title = 'Update Customer: ' . $model->id;
//$this->params['breadcrumbs'][] = ['label' => 'Customers', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer-update">
    <?php
    /*
      $this->render('_form', [
      'model' => $model,
      'initialPreview' => [],
      'initialPreviewConfig' => []
      ])
     */
    ?>

    <?= $this->render('_form', ['model' => $model, 'initialPreview' => $initialPreview, 'initialPreviewConfig' => $initialPreviewConfig, "flag" => "u"]) ?>

</div>
