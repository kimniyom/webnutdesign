<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Queue */

$this->title = 'Update Queue: ' . $model->id;
//$this->params['breadcrumbs'][] = ['label' => 'Queues', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="queue-update">
    <?= $this->render('_form', [
        'model' => $model,
        'modelCustomer' => $modelCustomer,
        'file' => $file
    ]) ?>

</div>
