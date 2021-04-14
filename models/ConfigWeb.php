<?php

namespace app\models;

use Yii;


class ConfigWeb {
    function getPrivilege(){
    	if(!Yii::$app->user->isGuest){
	    	$userId = Yii::$app->user->identity->id;
	    } else {
	    	$userId = "";
	    }
        $sql = "select * from rule r inner join department m on r.department_id = m.id where r.user_id = '$userId'";
        $result = Yii::$app->db->createCommand($sql)->queryAll();
        return $result;
    }
}
