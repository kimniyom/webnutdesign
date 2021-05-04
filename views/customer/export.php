<?php

//header("Content-Type: application/xls");
//header("Content-type: application/vnd.ms-excel");
//header("Content-Disposition: attachment; filename=งานทั้งหมด.xls");
//header("Pragma: no-cache");
//header("Expires: 0");
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ConfigWeb;
use app\models\Timeline;
use dektrium\user\models\Profile;

$ConfigWeb = new ConfigWeb();
$TimeLineModel = new Timeline();
$this->title = 'งานทั้งหมด';
?>

<div class="customer-viewall">
    <div class="row" style="margin-bottom: 0px; font-family: skv; font-size: 16px;">
        <div class="col-lg-12 col-md-12">
            <div id="body-work" style="margin-top: 10px; overflow: auto;">
                <div id="job" class=" table-responsive">
                    <table class="table table-striped" id="export">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>สถานะ</th>
                                <th>ลูกค้า</th>
                                <th>งาน</th>
                                <th>กำหนดส่ง</th>
                                <th>ผุ้รับงาน</th>
                                <th>แผนกล่าสุด</th>
                                <th>ความเร่งด่วน</th>
                                <th>งานพิมพ์</th>
                                <th>พนักงานพิมพ์</th>
                                <th>CNC/LASER</th>
                                <th>พนักงานCNC/LASER</th>
                                <th>ผลิตทั่วไป</th>
                                <th>พนักงานผลิตทั่วไป</th>
                                <th style="text-align: center">จัดส่ง</th>
                                <th>พนักงานจัดส่ง</th>
                                <th>ติดตั้ง</th>
                                <th>พนักงานติดตั้ง</th>
                                <th>ส่งมอบงาน</th>
                                <th>พนักงานส่งมอบ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 0;
                            foreach ($dataList as $rs): $i++;
                                if ($rs['flag'] == 2) {
                                    $tr = "table-danger";
                                } else if ($rs['flag'] == 1) {
                                    $tr = "table-success";
                                } else {
                                    $tr = "";
                                }
                                ?>
                                <tr class="<?php echo $tr ?>">
                                    <td><?php echo $i ?></td>
                                    <td style=" font-size: 18px;">
                                        <?php if ($rs['flag'] == 2) { ?>
                                            <label class="label label-danger" style=" margin: 0px; width: 100%;"><ion-icon name="close-outline"></ion-icon> ยกเลิก</label>
                                        <?php } else if ($rs['flag'] == 1) { ?>
                                            <label class="label label-success" style=" margin: 0px; width: 100%;"><ion-icon name="checkmark-outline"></ion-icon> สำเร็จ</label>
                                        <?php } else { ?>
                                            <label class="label label-warning" style=" margin: 0px; color: #ffffff;"><ion-icon name="cog-outline"></ion-icon> กำลังดำเนินงาน</label>
                                        <?php } ?>
                                    </td>
                                    <td><?php echo $rs['customer'] ?></td>
                                    <td><?php echo $rs['project_name'] ?></td>
                                    <td><?php echo $ConfigWeb->thaidate($rs['date_getjob']) ?></td>
                                    <td><?php echo Profile::findOne(['user_id' => $rs['user_id']])['name'] ?></td>
                                    <td>
                                        <?php echo $TimeLineModel->getLastTimeline($rs['ref']) ?>
                                    </td>

                                    <td><?php echo ($rs['fast'] == 0) ? "ทั่วไป" : "เร่งด่วน"; ?></td>
                                    <td>
                                        <?php
                                        if ($rs['print_status'] == 1) {
                                            echo "<font class='text-warning'>กำลังดำเนินการ</font>";
                                        } else if ($rs['print_status'] == 2) {
                                            echo "<font class='text-success'>ผลิตเสร็จ</font>";
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <?php
                                        $bPrint = \app\models\Branchprint::findOne(['ref' => $rs['ref']]);
                                        if ($rs['print_status'] == 2) {
                                            $usePrint = Profile::findOne(['user_id' => $bPrint['user_id']])['name'];
                                            echo $usePrint;
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <?php
                                        if ($rs['cnc_status'] == 1) {
                                            echo "<font class='text-warning'>กำลังดำเนินการ</font>";
                                        } else if ($rs['cnc_status'] == 2) {
                                            echo "<font class='text-success'>ผลิตเสร็จ</font>";
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <?php
                                        $bLaser = \app\models\Branchlaser::findOne(['ref' => $rs['ref']]);
                                        if ($rs['cnc_status'] == 2) {
                                            $useLaser = Profile::findOne(['user_id' => $bLaser['user_id']])['name'];
                                            echo $useLaser;
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <?php
                                        if ($rs['manufacture_status'] == 1) {
                                            echo "<font class='text-warning'>กำลังดำเนินการ</font>";
                                        } else if ($rs['manufacture_status'] == 2) {
                                            echo "<font class='text-success'>ผลิตเสร็จ</font>";
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <?php
                                        $bFacture = \app\models\Branchfacture::findOne(['ref' => $rs['ref']]);
                                        if ($rs['manufacture_status'] == 2) {
                                            $useFacture = Profile::findOne(['user_id' => $bFacture['user_id']])['name'];
                                            echo $useFacture;
                                        } else {
                                            echo "-";
                                        }
                                        ?>
                                    </td>
                                    <td style=" text-align: center;">
                                        <?php
                                        if ($rs['transport'] == 1) {
                                            $transport = app\models\Transport::findOne(['ref' => $rs['ref']]);
                                            if ($transport['status'] == 1) {
                                                echo "<font class='text-danger'>ยังไม่ส่ง</font>";
                                            } else {
                                                echo $transport['tagnumber'];
                                            }
                                            ?>
                                        <?php } else { ?>
                                            -
                                        <?php } ?>
                                    </td>
                                    <td>
                                        <?php
                                        if ($rs['transport'] == 1) {
                                            $transport = app\models\Transport::findOne(['ref' => $rs['ref']]);
                                            if ($transport['status'] != 1) {
                                                $useTransport = Profile::findOne(['user_id' => $transport['user_id']])['name'];
                                                echo $useTransport;
                                            }
                                            ?>
                                        <?php } else { ?>
                                            -
                                        <?php } ?>
                                    </td>
                                    <td style=" text-align: center">
                                        <?php
                                        if ($rs['setup'] == 1) {
                                            $setup = app\models\Queue::findOne(['ref' => $rs['ref']]);
                                            if ($setup['approve'] == 0) {
                                                echo "<font class='text-danger'>ยังไม่ติดตั้ง</font>";
                                            } else {
                                                echo "<font class='text-success'>ติดตั้งแล้ว</font>";
                                            }
                                            ?>
                                        <?php } else { ?>
                                            -
                                        <?php } ?>
                                    </td>
                                    <td style=" text-align: center">
                                        <?php
                                        if ($rs['setup'] == 1) {
                                            $setup = app\models\Queue::findOne(['ref' => $rs['ref']]);
                                            if ($setup['approve'] != 0) {
                                                $useSetup = Profile::findOne(['user_id' => $setup['usersetup']])['name'];
                                                echo $useSetup;
                                            }
                                            ?>
                                        <?php } else { ?>
                                            -
                                        <?php } ?>
                                    </td>
                                    <td>
                                        <?php
                                        if ($rs['flag'] != 2) {
                                            if ($rs['approve'] == 0) {
                                                echo "<font class='text-danger'>ยังไม่ส่งมอบ</font>";
                                            } else {
                                                $useApprove = Profile::findOne(['user_id' => $rs['userapprove']])['name'];
                                                echo "<font class='text-success'>ส่งมอบงานแล้ว</font>" . "<font style='font-size:12px;'><em>โดย::(" . $useApprove . ")</em></font>";
                                            }
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <?php
                                        if ($rs['flag'] != 2) {
                                            if ($rs['approve'] == 1) {
                                                $useApprove = Profile::findOne(['user_id' => $rs['userapprove']])['name'];
                                                echo$useApprove;
                                            }
                                        }
                                        ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- เรียกใช้ javascript สำหรับ export ไฟล์ excel  -->
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"  ></script>
<script src="https://unpkg.com/file-saver@1.3.3/FileSaver.js"  ></script>

<script>
    ExcelReport();
    function ExcelReport()//function สำหรับสร้าง ไฟล์ excel จากตาราง
    {
        var sheet_name = "ข้อมูลงาน";/* กำหหนดชื่อ sheet ให้กับ excel โดยต้องไม่เกิน 31 ตัวอักษร */
        var elt = document.getElementById('export');/*กำหนดสร้างไฟล์ excel จาก table element ที่มี id ชื่อว่า myTable*/

        /*------สร้างไฟล์ excel------*/
        var wb = XLSX.utils.table_to_book(elt, {sheet: sheet_name});
        XLSX.writeFile(wb, 'nutdesign-exportdata.xlsx');//Download ไฟล์ excel จากตาราง html โดยใช้ชื่อว่า report.xlsx

    }
</script>






