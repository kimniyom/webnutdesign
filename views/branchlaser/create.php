<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Branchlaser */

$this->title = 'Create Branchlaser';
$this->params['breadcrumbs'][] = ['label' => 'Branchlasers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branchlaser-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
