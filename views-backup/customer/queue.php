<?php
use app\models\ConfigWeb;
$ConfigWeb = new ConfigWeb();
?>
<style type="text/css">
    .status-transport{
        width: 50px; position: absolute; right: 5px; top: 5px; text-align: right; color: #ce297d
    }
</style>
<div class="row">
    <div class="col-md-6 col-lg-6 col-12">
        <div style=" text-align: center;">
            <b style="color: #ce297d; ">งานที่รับวันที่ <?php echo $ConfigWeb->thaidate($dateselect) ?></b>
        </div>
        <div style=" height: 350px; overflow: auto; background: #FFFFFF; border-radius: 10px;">
            <?php if (isset($jobToday)) { ?>
                <div class="list-group" style=" border: 0px;">
                    <?php foreach ($jobToday as $rs): ?>
                        <div class="list-group-item" style="padding: 5px; color: #000000; position: relative;">
                            <div style=" width: 85%; float: left;">
                                <b><?php echo $rs['project_name'] ?></b><br/>
                                <?php echo $rs['customer'] ?>
                            </div>
                            <div class="status-transport">
                                <?php echo ($rs['transport'] == "0") ? "รับเอง" : "จัดส่ง"; ?>
                                <br/>
                                <?php echo substr($rs['time_getjob'],0,5) ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php } else { ?>
                <center><br/>ไม่มีคิว</center>
            <?php } ?>
        </div>
    </div>
    <div class="col-md-6 col-lg-6 col-12">
        <div style=" text-align: center;">
            <b style="color: #ce297d;">งานที่รับวันที่ <?php echo $ConfigWeb->thaidate($datetomorow) ?></b>
        </div>
        <div style=" height: 350px; overflow: auto; background: #FFFFFF; border-radius: 10px;">
            <?php if (isset($jobTomorow)) { ?>
                <div class="list-group" style=" border: 0px;">
                    <?php foreach ($jobTomorow as $rss): ?>
                        <div class="list-group-item" style="padding: 5px; color: #000000; position: relative;">
                            <div style=" width: 85%; float: left;">
                                <b><?php echo $rss['project_name'] ?></b><br/>
                                <?php echo $rss['customer'] ?>
                            </div>
                            <div class="status-transport">
                                <?php echo ($rss['transport'] == "0") ? "รับเอง" : "จัดส่ง"; ?><br/>
                                <?php echo substr($rss['time_getjob'],0,5) ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php } else { ?>
                <center><br/>ไม่มีคิว</center>
            <?php } ?>
        </div>
    </div>
</div>