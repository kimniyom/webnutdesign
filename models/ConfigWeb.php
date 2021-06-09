<?php

namespace app\models;

use Yii;
use app\models\Customer;

class ConfigWeb {

    function getPrivilege() {
        if (!Yii::$app->user->isGuest) {
            $userId = Yii::$app->user->identity->id;
        } else {
            $userId = "";
        }
        $sql = "select *
            from rule r inner join department m on r.department_id = m.id
            where r.user_id = '$userId'
            and m.active = 1
            order by m.seq asc";
        $result = Yii::$app->db->createCommand($sql)->queryAll();
        return $result;
    }

    function getRule() {
        if (!Yii::$app->user->isGuest) {
            $userId = Yii::$app->user->identity->id;
        } else {
            $userId = "";
        }

        $sql = "select * from privilege where user_id = '$userId' ";
        return Yii::$app->db->createCommand($sql)->queryOne();
    }

    function thaidate($dateformat = "") {
        $year = substr($dateformat, 0, 4);
        $month = substr($dateformat, 5, 2);
        $day = substr($dateformat, 8, 2);
        $thai = Array("", "ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค.");

        if (strlen($dateformat) <= 10) {
            return $thaidate = (int) $day . " " . $thai[(int) $month] . " " . ((int) $year + 543);
        } else {
            return $thaidate = (int) $day . " " . $thai[(int) $month] . " " . ((int) $year + 543) . " " . substr($dateformat, 10);
        }
    }

    function thaidateFull($dateformat = "") {
        $year = substr($dateformat, 0, 4);
        $month = substr($dateformat, 5, 2);
        $day = substr($dateformat, 8, 2);
        $thai = Array("", "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");

        if (strlen($dateformat) <= 10) {
            return $thaidate = (int) $day . " " . $thai[(int) $month] . " " . ($year + 543);
        } else {
            return $thaidate = (int) $day . " " . $thai[(int) $month] . " " . ($year + 543) . " " . substr($dateformat, 10);
        }
    }

    function thaidatemonth($dateformat = "") {
        $year = substr($dateformat, 0, 4);
        $month = substr($dateformat, 5, 2);
        //$day = substr($dateformat, 8, 2);
        $thai = Array("", "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");

        if (strlen($dateformat) <= 10) {
            return $thaidate = $thai[(int) $month] . " " . ($year + 543);
        } else {
            return $thaidate = $thai[(int) $month] . " " . ($year + 543) . " " . substr($dateformat, 10);
        }
    }

    function month_full() {
        $thai_month = array("มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");
        return $thai_month;
    }

    function getMonth($key) {
        $thai_month = array("", "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");
        return $thai_month[(int) $key];
    }

    function month_shot() {
        $thai_month = Array(
            "01" => "ม.ค.",
            "02" => "ก.พ.",
            "03" => "มี.ค.",
            "04" => "เม.ย.",
            "05" => "พ.ค.",
            "06" => "มิ.ย.",
            "07" => "ก.ค.",
            "08" => "ส.ค.",
            "09" => "ก.ย.",
            "10" => "ต.ค.",
            "11" => "พ.ย.",
            "12" => "ธ.ค.",
        );
        return $thai_month;
    }

    function getNextId($table, $field, $number) {
        $sql = "select $field from $table order by id desc  limit 1";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        if ($rs) {
            $digit = explode("IC", $rs[$field]);
            $lastDigit = ((int) $digit); // เปลี่ยน string เป็น integer สำหรับคำนวณ +1
            $lastDigit++; //เพิ่ม 1
            $lastDigit = str_pad($lastDigit, $number, '0', STR_PAD_LEFT); //ใส่ 0 ข้างหน้าหน่อย
        } else {
            $lastDigit = '00001';
        }

        return "IC" . $lastDigit;
    }

    function getCustomerCode($table, $field, $number) {
        $sql = "select $field from $table order by id desc limit 1";
        $rs = Yii::$app->db->createCommand($sql)->queryOne();
        if ($rs) {
            $digit = explode("C", $rs[$field]);
            $lastDigit = ((int) $digit); // เปลี่ยน string เป็น integer สำหรับคำนวณ +1
            $lastDigit++; //เพิ่ม 1
            $lastDigit = str_pad($lastDigit, $number, '0', STR_PAD_LEFT); //ใส่ 0 ข้างหน้าหน่อย
        } else {
            $lastDigit = '00001';
        }

        return "C" . $lastDigit;
    }

    function dayInweek($day) {
        $dayInweek = array(
            '0' => 'จันทร์',
            '1' => 'อังคาร',
            '2' => 'พุธ',
            '3' => 'พฤหัสบดี',
            '4' => 'วันศุกร์',
            '5' => 'วันเสาร์',
            '6' => 'วันอาทิตย์',
        );

        return $dayInweek[$day];
    }

    function dayInweekKeyFull($day) {
        $dayInweek = array(
            'Monday' => 'จันทร์',
            'Tuesday' => 'อังคาร',
            'Wednesday' => 'พุธ',
            'Thursday' => 'พฤหัสบดี',
            'Friday' => 'วันศุกร์',
            'Saturday' => 'วันเสาร์',
            'Sunday' => 'วันอาทิตย์',
        );

        return $dayInweek[$day];
    }

    function Convert($amount_number = "") {
        $amount_number = number_format($amount_number, 2, ".", "");
        $pt = strpos($amount_number, ".");
        $number = $fraction = "";
        if ($pt === false) {
            $number = $amount_number;
        } else {
            $number = substr($amount_number, 0, $pt);
            $fraction = substr($amount_number, $pt + 1);
        }

        $ret = "";
        $baht = $this->ReadNumber($number);
        if ($baht != "") {
            $ret .= $baht . "บาท";
        }

        $satang = $this->ReadNumber($fraction);
        if ($satang != "") {
            $ret .= $satang . "สตางค์";
        } else {
            $ret .= "ถ้วน";
        }

        if ($ret == "ถ้วน") {
            $ret = "ศูนย์บาทถ้วน";
        }

        return $ret;
    }

    function ReadNumber($number) {
        $position_call = array("แสน", "หมื่น", "พัน", "ร้อย", "สิบ", "");
        $number_call = array("", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า");
        $number = $number + 0;
        $ret = "";
        if ($number == 0) {
            return $ret;
        }

        if ($number > 1000000) {
            $ret .= ReadNumber(intval($number / 1000000)) . "ล้าน";
            $number = intval(fmod($number, 1000000));
        }

        $divider = 100000;
        $pos = 0;
        while ($number > 0) {
            $d = intval($number / $divider);
            $ret .= (($divider == 10) && ($d == 2)) ? "ยี่" :
                    ((($divider == 10) && ($d == 1)) ? "" :
                    ((($divider == 1) && ($d == 1) && ($ret != "")) ? "เอ็ด" : $number_call[$d]));
            $ret .= ($d ? $position_call[$pos] : "");
            $number = $number % $divider;
            $divider = $divider / 10;
            $pos++;
        }
        return $ret;
    }

    function getChannel($value) {
        //1 => "Line", 2 => "โทรศัพท์", 3 => "เข้ามาที่ร้าน", 4 => "อื่น ๆ"
        if ($value == 1) {
            $str = "Line";
        } else if ($value == 2) {
            $str = "โทรศัพท์";
        } else if ($value == 3) {
            $str = "เข้ามาที่ร้าน";
        } else {
            $str = "อื่น ๆ";
        }

        return $str;
    }

    //สาเหตุการส่งแก้ไข
    function getReturnWork() {
        $str = array(
            "1" => "งานไม่ถูกต้อง"
        );
    }

    function statusBar($day,$h,$inday,$datejob) {
        $CustomerM = new Customer();    
        $Tomorow = $CustomerM->getTomorow(date('Y-m-d'));
        if ($day < 0) {
            $text = "เลยกำหนดส่งแล้วนะ ให้ไวเลย!!!";
            $color = "red";
            $percent = "100%";
        } else if ($day == 0 && ($inday < 4)) {
            if ($h < 4) {
                $text = "ส่งมอบวันนี้";
                $color = "orange";
                $percent = "100%";
            } else {
                $text = "ส่งมอบ 1 - 3 ชั่วโมง";
                $color = "red";
                $percent = "100%";
            }
        } else if ($day == 0 && $inday > 4) {
            $text = "ส่งมอบวันนี้";
            $color = "orange";
            $percent = "100%";
        } else if ($datejob == $Tomorow) {
            $text = "ส่งมอบพรุ่งนี้";
            $color = "yellow";
            $percent = "100%";
        } else if ($day > 0 && $day < 3) {
            $text = "ส่งมอบภายใน 2 วัน";
            $color = "green";
            $percent = "100%";
        } else {
             $text = "ส่งมอบภายใน 2 วันขึ้นไป";
            $color = "green";
            $percent = "100%";
        }
        
        $datas = array(
            "text" => $text,
            "color" => $color,
            "percent" => $percent
        );
        
        return $datas;
    }

}
