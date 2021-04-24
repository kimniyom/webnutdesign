<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Branchprint */

$this->title = 'Create Branchprint';
$this->params['breadcrumbs'][] = ['label' => 'Branchprints', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branchprint-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
