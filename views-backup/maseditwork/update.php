<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Maseditwork */

$this->title = 'แก้ไข : ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Maseditworks', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="maseditwork-update container" style="margin-top: 10px;">
    <a href="<?php echo Yii::$app->urlManager->createUrl(['maseditwork/index']) ?>" style=" text-decoration: none;">
        <button type="button" class="btn btn-rounded btn-dark btn-outline">
            <i class="fa fa-arrow-circle-left fa-2x"></i> กลับ
        </button></a>
    <hr/>
    <h1><?= Html::encode($this->title) ?></h1>

    <?=
    $this->render('_form', [
        'model' => $model,
    ])
    ?>

</div>
