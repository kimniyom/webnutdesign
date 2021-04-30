<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\BranchmarketingSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Branchmarketings';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branchmarketing-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Branchmarketing', ['create'], ['class' => 'btn btn-success']) ?>
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
