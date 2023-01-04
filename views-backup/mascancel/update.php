<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Mascancel */

$this->title = 'แก้ไข: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Mascancels', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="mascancel-create container" style="margin-top: 10px;">
	<a href="<?php echo Yii::$app->urlManager->createUrl(['mascancel/index']) ?>" style=" text-decoration: none;">
    <button type="button" class="btn btn-rounded btn-dark btn-outline">
        <i class="fa fa-arrow-circle-left fa-2x"></i> กลับ
    </button></a>
    <hr/>
    <h1 class="text-success"><i class="fa fa-plus"></i> <?= Html::encode($this->title) ?></h1>
    <hr/>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
