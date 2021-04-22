<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Graphics', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="graphic-view">
    <div class="container text-success" style=" text-align: center; margin-top: 10%;">
        <i class="fa fa-check-circle fa-5x"></i><br/>
        <h1>บันทึกข้อมูลสำเร็จ</h1>

        <p style=" display: none;">
            <?= Html::a('Update', ['update', 'ref' => $model->ref], ['class' => 'btn btn-primary']) ?>
            <?=
            Html::a('Delete', ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => 'Are you sure you want to delete this item?',
                    'method' => 'post',
                ],
            ])
            ?>


            <?php
            /*
            DetailView::widget([
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
            ])
             * 
             */
            ?>

        </p>
    </div>
</div>
