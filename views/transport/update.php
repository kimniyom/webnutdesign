<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Transport */

$this->title = 'Update Transport: ' . $model->id;
//$this->params['breadcrumbs'][] = ['label' => 'Transports', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="transport-update">
    <?=
    $this->render('_form', [
        'model' => $model,
    ])
    ?>

</div>
