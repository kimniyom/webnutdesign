<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\TransportSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Transports';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transport-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Transport', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'ref',
            'user_id',
            'status',
            'flag',
            //'create_date',
            //'confirm_date',
            //'address:ntext',
            //'tagnumber',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
