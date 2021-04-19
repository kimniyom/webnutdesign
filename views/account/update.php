<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Account */

$this->title = 'Update';

?>
<div class="account-update">
    <?= $this->render('_form', [
        'model' => $model,
        'error' => $error,
        'modelCustomer' => $modelCustomer,
        'file' => $file
    ]) ?>
</div>
