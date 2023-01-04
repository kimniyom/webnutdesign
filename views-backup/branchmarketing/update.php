<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Branchmarketing */

$this->title = 'Update Branchmarketing: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Branchmarketings', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="branchmarketing-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
