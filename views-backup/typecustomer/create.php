<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Typecustomer */

$this->title = 'เพิ่มประเภทลูกค้า';
$this->params['breadcrumbs'][] = ['label' => 'Typecustomers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="typecustomer-create container" style=" margin-top: 10px;">
    <a href="<?php echo Yii::$app->urlManager->createUrl(['typecustomer/index']) ?>" style=" text-decoration: none;">
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
