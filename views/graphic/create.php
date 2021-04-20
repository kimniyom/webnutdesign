<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Graphic */

$this->title = 'Create Graphic';
$this->params['breadcrumbs'][] = ['label' => 'Graphics', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="graphic-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
