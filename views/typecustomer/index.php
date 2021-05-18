<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\TypecustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ประเภทลูกค้า';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="typecustomer-index container" style=" margin-top: 50px;">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('<i class="fa fa-plus"></i> เพิ่มรายการ', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <table class="table table-striped">
        <thead>
            <tr>
                <th style="text-align: center; width: 50px;">#</th>
                <th>ชื่อประเภท</th>
                <th></th>
            </tr>
            <?php
            $i = 0;
            foreach ($listdata as $rs): $i++;
                ?>
                <tr>
                    <td style="text-align: center;"><?php echo $i ?></td>
                    <td><?php echo $rs['typename'] ?></td>
                    <td style="text-align: right;">
                        <a href="<?php echo Yii::$app->urlManager->createUrl(['typecustomer/update', 'id' => $rs['id']]) ?>"><i class="fa fa-edit"></i> แก้ไข</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </thead>
    </table>


</div>
