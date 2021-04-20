<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Graphic */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Graphics', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="jumbotron" style=" text-align: center;">
    <h1>
        <i class="fa fa-info fa-3x"></i> <br/>
        อยู่ระหว่างขั้นตอนการพัฒนา
    </h1>
    </div>
<div class="graphic-view" style=" display: none;">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'ref' => $model->ref], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'ref',
            'customer_id',
            'detail:ntext',
            'link',
            'ref_graphic',
            'user_id',
            'last_dep',
            'status',
            'approve',
            'create_date',
            'update_date',
        ],
    ]) ?>

     รูปภาพแนบ
                                <?= dosamigos\gallery\Gallery::widget(['items' => $model->getThumbnails($model->ref_graphic, 'แบบงาน / ตัวอย่างงาน')]); ?>

</div>
