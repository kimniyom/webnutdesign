<?php

use app\models\ConfigWeb;

$ConfigWeb = new ConfigWeb();
?>
<div class="row">
    <div class="col-md-6 col-lg-6 col-12">
        <b style="color: #ce297d;">งานที่รับวันที่ <?php echo $ConfigWeb->thaidate($dateselect) ?></b>
        <div style=" height: 350px; overflow: auto; background: #FFFFFF; border-radius: 10px;">
            <?php if ($jobToday) { ?>
                <div class="list-group" style=" border: 0px;">
                    <?php foreach ($jobToday as $rs): ?>
                        <div class="list-group-item" style="padding: 5px; color: #000000;">
                            <b><?php echo $rs['project_name'] ?></b><br/>
                            <?php echo $rs['customer'] ?>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php } else { ?>
                <br/>ไม่มีคิว
            <?php } ?>
        </div>
    </div>
    <div class="col-md-6 col-lg-6 col-12">
        <b style="color: #ce297d;">งานที่รับวันที่ <?php echo $ConfigWeb->thaidate($datetomorow) ?></b>
        <div style=" height: 350px; overflow: auto; background: #FFFFFF; border-radius: 10px;">
            <?php if ($jobTomorow) { ?>
                <div class="list-group" style=" border: 0px;">
                    <?php foreach ($jobTomorow as $rss): ?>
                        <div class="list-group-item" style="padding: 5px; color: #000000;">
                            <b><?php echo $rss['project_name'] ?></b><br/>
                            <?php echo $rss['customer'] ?>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php } else { ?>
                <center><br/>ไม่มีคิว</center>
            <?php } ?>
        </div>
    </div>
</div>