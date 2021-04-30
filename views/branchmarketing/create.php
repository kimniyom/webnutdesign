<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Branchmarketing */

$this->title = 'Create Branchmarketing';
$this->params['breadcrumbs'][] = ['label' => 'Branchmarketings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branchmarketing-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
