<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Branchfacture */

$this->title = 'Create Branchfacture';
$this->params['breadcrumbs'][] = ['label' => 'Branchfactures', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branchfacture-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
