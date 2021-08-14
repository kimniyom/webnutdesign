<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "branchfacture".
 *
 * @property int $id
 * @property string|null $ref รหัสอ้างอิง
 * @property int|null $user_id ผู้รับงาน
 * @property int|null $status สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว
 * @property int|null $flag 0 = NoApprove 1 = Approve 2 =  Cancel
 */
class Branchfacture extends \yii\db\ActiveRecord {

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'branchfacture';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['user_id', 'status', 'flag'], 'integer'],
            [['ref'], 'string', 'max' => 50],
            [['comment'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'ref' => 'รหัสอ้างอิง',
            'user_id' => 'ผู้รับงาน',
            'status' => 'สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว',
            'flag' => '0 = NoApprove 1 = Approve 2 =  Cancel',
        ];
    }

    function getJob($type, $customer, $job) {
        if (!Yii::$app->user->isGuest) {
            $status = Yii::$app->user->identity->status;
        } else {
            $status = "";
        }

        if ($customer != "" && $job != "") {
            $searchWhere = " and c.customer like '%$customer%' or c.project_name like '%$job%'";
        } else if ($customer != "" && $job == "") {
            $searchWhere = " and c.customer like '%$customer%'";
        } else if ($customer == "" && $job != "") {
            $searchWhere = " and c.project_name like '%$job%'";
        } else {
            $searchWhere = "";
        }

        if ($type == 1) {
            $order = "ORDER BY D,H";
        } else if ($type == 2) {
            $order = "order by c.date_getjob asc";
        } else {
            $order = "order by c.create_date desc";
        }

        if ($status == "A" || $status == "M") {
            $sql = "select c.*,g.status,
                    TIMESTAMPDIFF(day,CURDATE(),c.date_getjob) AS D,
                    TIMESTAMPDIFF(HOUR,NOW(),CONCAT(c.date_getjob,' ',c.time_getjob)) AS H,
                    TIMESTAMPDIFF(HOUR,c.`create_date`,CONCAT(c.date_getjob,' ',c.time_getjob)) AS INDAY
                from branchfacture g INNER JOIN customer c ON g.ref = c.ref
                    where g.flag = '0' and g.status in('1','2') and c.flag = '0' $searchWhere $order";
        } else {
            $sql = "select c.*,g.status,TIMESTAMPDIFF(day,CURDATE(),c.date_getjob) AS D,
                    TIMESTAMPDIFF(HOUR,NOW(),CONCAT(c.date_getjob,' ',c.time_getjob)) AS H,
                    TIMESTAMPDIFF(HOUR,c.`create_date`,CONCAT(c.date_getjob,' ',c.time_getjob)) AS INDAY
                from branchfacture g INNER JOIN customer c ON g.ref = c.ref
                    where g.flag = '0' and g.status in('1','2') and c.flag = '0' $searchWhere $order";
        }

        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    function getJobForUser() {
        if (!Yii::$app->user->isGuest) {
            $user_id = Yii::$app->user->identity->id;
        } else {
            $user_id = "";
        }
        $sql = "select c.*,g.status,TIMESTAMPDIFF(day,CURDATE(),c.date_getjob) AS D,
                    TIMESTAMPDIFF(HOUR,NOW(),CONCAT(c.date_getjob,' ',c.time_getjob)) AS H,
                    TIMESTAMPDIFF(HOUR,c.`create_date`,CONCAT(c.date_getjob,' ',c.time_getjob)) AS INDAY
            from branchfacture g INNER JOIN customer c ON g.ref = c.ref
                    where g.flag = '0' and g.user_id = '$user_id' and g.status in('2','3') and c.flag = '0'";
        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    function searchJob($customer = "", $project = "") {
        $where = "";
        if ($customer != "" && $project == "") {
            $where .= "and c.customer LIKE '%" . $customer . "%'";
        } else if ($customer == "" && $project != "") {
            $where .= "and c.project_name LIKE '%" . $project . "%'";
        } else if ($customer != "" && $project != "") {
            $where .= "and c.customer LIKE '%" . $customer . "%' AND c.project_name LIKE '%" . $project . "%'";
        }

        $sql = "select c.*,g.status from branchfacture g INNER JOIN customer c ON g.ref = c.ref WHERE c.flag = '0' $where";

        return Yii::$app->db->createCommand($sql)->queryAll();
        //return $sql;
    }

}
