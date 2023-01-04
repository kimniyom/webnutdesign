<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Branchlaser */

$this->title = 'Update Branchlaser: ' . $model->id;
//$this->params['breadcrumbs'][] = ['label' => 'Branchlasers', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="branchlaser-update">

    <?=
    $this->render('_form', [
        'model' => $model,
        'initialPreview' => $initialPreview,
        'initialPreviewConfig' => $initialPreviewConfig
    ])
    ?>

</div>
