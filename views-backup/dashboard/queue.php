<?php

use app\models\ConfigWeb;

$ConfigWeb = new ConfigWeb();
?>
<div class="row" style=" margin: 0px; font-family: skv;">
    <div class="col-md-6 col-lg-6">
        <div class="card">
            <div class="card-content">
                <div class="card-body" style="height:400px;">
                    <div style="color: #ce297d;border-bottom: solid 2px #b1207b;">งานกำหนดส่งวันนี้(และงานค้าง)</div>
                    <div style="height: 350px; overflow: auto;">
                        <table style="width: 100%; font-size: 12px;" class="table">
                            <thead>
                            <th>ชื่องาน</th>
                            <th style="text-align: center;">สถานะ</th>
                            <th>ลูกค้า</th>
                            </thead>
                            <tbody>
                                <?php if ($jobToday) { ?>
                                    <?php foreach ($jobToday as $rs): ?>
                                        <tr onclick="getViews('<?php echo $rs['ref'] ?>')" style=" cursor: pointer;">
                                            <td style="padding: 2px;"><?php echo $rs['project_name'] ?></td>
                                            <td style="padding: 2px; text-align: center;"><?php echo ($rs['transport'] == '1') ? "จัดส่ง" : "รับเอง"; ?></td>
                                            <td style="padding: 2px; text-align: center;"><?php echo $rs['customer'] ?> </td>
                                        </tr>
                                    <?php endforeach; ?>

                                <?php } else { ?>
                                    <tr>
                                        <td colspan="3" style="text-align: center;">ไม่มีคิววันนี้</td>
                                    </tr>
                                <?php } ?>
                                <?php foreach ($jobBeforday as $rsbefor): ?>
                                    <tr class="table-warning" onclick="getViews('<?php echo $rsbefor['ref'] ?>')" style=" cursor: pointer;">
                                        <td style="padding: 2px;"><?php echo $rsbefor['project_name'] ?></td>
                                        <td style="padding: 2px; text-align: center;"><?php echo ($rsbefor['transport'] == '1') ? "จัดส่ง" : "รับเอง"; ?></td>
                                        <td style="padding: 2px; text-align: center;"><?php echo $rsbefor['customer'] ?> </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-6">
        <div class="card">
            <div class="card-content">
                <div class="card-body" style="height:400px;">
                    <div style="color: #ce297d;border-bottom: solid 2px #b1207b;">งานกำหนดรับพรุ่งนี้</div>
                    <div style="height: 350px; overflow: auto;">
                        <table style="width: 100%; font-size: 12px;" class="table">
                            <thead>
                            <th>ชื่องาน</th>
                            <th style="text-align: center;">สถานะ</th>
                            <th>ลูกค้า</th>
                            </thead>
                            <tbody>
                                <?php if ($jobTomorow) { ?>
                                    <?php foreach ($jobTomorow as $rss): ?>
                                        <tr onclick="getViews('<?php echo $rss['ref'] ?>')" style=" cursor: pointer;">
                                            <td style="padding: 2px;"><?php echo $rss['project_name'] ?></td>
                                            <td style="padding: 2px; text-align: center;"><?php echo ($rss['transport'] == '1') ? "รับเอง" : "จัดส่ง"; ?></td>
                                            <td style="padding: 2px; text-align: center;"><?php echo $rss['customer'] ?> </td>
                                        </tr>
                                    <?php endforeach; ?>

                                <?php } else { ?>
                                    <tr>
                                        <td colspan="3" style="text-align: center;">ไม่มีคิว</td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>