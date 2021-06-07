<?php

namespace app\models;

use Yii;

class Dashboard {

    function countCustomerToday() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE LEFT(c.create_date,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustomerNoApprove() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c WHERE c.flag = '0' AND c.approve = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustomerFast() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE c.flag = '0' AND c.level = '5'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustomerCancel() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE c.flag = '2'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //Account
    function countAccountNopaper() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM account c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.approve = '0' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countOutside() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.flag = '0' AND c.outside = '1' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //Graphic
    function countGraphicNopaper() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM graphic c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.approve = '0' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countGraphicApproveToday() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM graphic c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.approve = '1' AND LEFT(c.update_date,10) = DATE(NOW()) AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //Print
    function countPrintNoapprove() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchprint c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status != '4' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countPrintApproveToday() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchprint c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status = '4' AND LEFT(c.confirm_date,10) = DATE(NOW()) AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //Cnc/Laser
    function countLaserNoapprove() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchlaser c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status != '4' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countLaserApproveToday() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchlaser c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status = '4' AND LEFT(c.confirm_date,10) = DATE(NOW()) AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //ผลิตทั่วไป
    function countFactureNoapprove() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchfacture c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status != '4' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countFactureApproveToday() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchfacture c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status = '4' AND LEFT(c.confirm_date,10) = DATE(NOW()) AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //ติดตั้ง
    function countQueueNoapprove() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM queue c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.approve != '2' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countQueueApproveToday() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM queue c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.approve = '2' AND LEFT(c.queuedate,10) = DATE(NOW()) AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //จัดส่ง
    function countTransportNoapprove() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM transport c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status != '1' AND m.flag = '0' AND m.approve = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countTransportApproveToday() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM transport c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status = '2' AND LEFT(c.confirm_date,10) = DATE(NOW())  AND m.flag = '0' ";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function chartMonth($month) {
        $sql = "SELECT DAY(c.create_date) AS DAY,COUNT(*) AS total
                FROM customer c
                WHERE LEFT(c.create_date,4) = YEAR(CURDATE())
                AND SUBSTR(c.create_date,6,2) = '$month'
                GROUP BY LEFT(c.create_date,10)
                ORDER BY DAY(c.create_date) ASC";
        $rs = Yii::$app->db->createCommand($sql)->queryAll();
        return $rs;
    }

    function countAccountNopaperAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM account c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status = '0' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countGraphicNoapproveAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM graphic c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.approve = '0' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countPrintNoapproveAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchprint c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status != '4' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countLaserNoapproveAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchlaser c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status != '4' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countFactureNoapproveAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchfacture c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status != '4' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countSetupNoapproveAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM queue c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.approve != '2' AND m.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countTransportNoapproveAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM transport c INNER JOIN customer m ON c.ref = m.ref
            WHERE c.status = '1' AND m.flag = '0' AND m.approve = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countNoTransportNoapproveAll() {
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer m
            WHERE m.transport = '0' AND m.flag = '0' AND m.approve = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countLevel($level) {
        $sql = "SELECT COUNT(*) AS TOTAL
FROM customer c INNER JOIN graphic g ON c.ref = g.ref
WHERE c.flag = '0' AND c.`level` = '$level' AND g.approve = '0' ";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustomerType($type = "") {
        if ($type == '1') {
            $where = " c.`channel` = '1'";
        } else {
            $where = " c.`channel` != '1'";
        }
        $sql = "SELECT COUNT(*) AS TOTAL
                FROM customer c
                WHERE $where";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustotmerCat() {
        $sql = "SELECT t.typename,IFNULL(Q.total,0) AS total
                    FROM typecustomer t
                    LEFT JOIN (
                    SELECT c.typecustomer,COUNT(*) AS total
                    FROM customer c
                    GROUP BY c.typecustomer
                    ) AS Q ON t.id = Q.typecustomer ";
        $rs = Yii::$app->db->createCommand($sql)->queryAll();
        return $rs;
    }

    function searchJob($project = "") {
        if ($project) {
            $sql = "select c.* from customer c WHERE c.project_name LIKE '%" . $project . "%'";
        } else {
            $sql = "select c.* from customer c WHERE c.id = ''";
        }
        return Yii::$app->db->createCommand($sql)->queryAll();
        //return $sql;
    }

}
