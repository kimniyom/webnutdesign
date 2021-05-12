<?php

namespace app\models;

use Yii;

class Dashboard {

    function countCustomerToday(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE LEFT(c.create_date,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustomerNoApprove(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE c.flag = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustomerFast(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE c.flag = '0' AND c.fast = '1'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countCustomerCancel(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE c.flag = '2'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //Account
    function countAccountNopaper(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM account c
            WHERE c.approve = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

     function countOutside(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM customer c
            WHERE c.flag = '0' AND c.outside = '1'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //Graphic
    function countGraphicNopaper(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM graphic c
            WHERE c.approve = '0'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countGraphicApproveToday(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM graphic c
            WHERE c.approve = '1' AND LEFT(c.update_date,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

     //Print
    function countPrintNoapprove(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchprint c
            WHERE c.status != '4'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countPrintApproveToday(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchprint c
            WHERE c.status = '4' AND LEFT(c.confirm_date,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //Cnc/Laser
    function countLaserNoapprove(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchlaser c
            WHERE c.status != '4'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countLaserApproveToday(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchlaser c
            WHERE c.status = '4' AND LEFT(c.confirm_date,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //ผลิตทั่วไป
    function countFactureNoapprove(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchfacture c
            WHERE c.status != '4'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countFactureApproveToday(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM branchfacture c
            WHERE c.status = '4' AND LEFT(c.confirm_date,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //ติดตั้ง
    function countQueueNoapprove(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM queue c
            WHERE c.approve != '2'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countQueueApproveToday(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM queue c
            WHERE c.approve = '2' AND LEFT(c.queuedate,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    //จัดส่ง
    function countTransportNoapprove(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM transport c
            WHERE c.status != '1'";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

    function countTransportApproveToday(){
        $sql = "SELECT COUNT(*) AS TOTAL
            FROM transport c
            WHERE c.status = '2' AND LEFT(c.confirm_date,10) = DATE(NOW())";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        return $rs['TOTAL'];
    }

}
