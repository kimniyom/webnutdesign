<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\BranchlaserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Branchlasers';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branchlaser-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Branchlaser', ['create'], ['class' => 'btn btn-success']) ?>
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
