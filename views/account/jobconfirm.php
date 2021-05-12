<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;

$ConfigWeb = new ConfigWeb();
?>

<ul class="list-group" style=" padding: 0px; margin: 0px; border-radius: 0px;">
    <?php foreach ($job as $jobs): ?>
        <li class="list-group-item account-list-group" style="border: none; border-bottom: solid 1px #eeeeee; cursor: pointer;" onclick="popupMenu('<?php echo $jobs['ref'] ?>')">
            <h4><?php echo $jobs['customer'] ?></h4>
            <p>กำหนดส่ง: <?php echo $ConfigWeb->thaidate($jobs['date_getjob']) ?></p>
        </li>
    <?php endforeach; ?>
</ul>