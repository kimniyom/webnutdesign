
<?php

use dektrium\user\widgets\Connect;
use dektrium\user\models\LoginForm;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = Yii::t('user', 'Sign in');
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V4</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/animate/animate.css">	
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/select2/select2.min.css">	
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/css/util.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/css/main.css">
</head>
<body>
	<?= $content ?>
	<div id="dropDownSelect1"></div>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/animsition/js/animsition.min.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/bootstrap/js/popper.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/select2/select2.min.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/daterangepicker/moment.min.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/vendor/countdowntime/countdowntime.js"></script>
	<script src="<?php echo Yii::$app->urlManager->baseUrl ?>/templatelogin/js/main.js"></script>
</body>
</html>