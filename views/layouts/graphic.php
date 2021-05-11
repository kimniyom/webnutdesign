<?php

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use yii\helpers\Url;
use app\models\ConfigWeb;

//use app\assets\AppAsset;
//AppAsset::register($this);
$configWeb = new ConfigWeb();
$menuList = $configWeb->getPrivilege();
$rule = $configWeb->getRule();
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" type="image/png" sizes="16x16" href="<?php echo Yii::$app->urlManager->baseUrl ?>/images/logo-icon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
        <?php $this->registerCsrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
        <!--c3 plugins CSS -->

        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/css/style.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <style>
            /* Works on Firefox */
            * {
                scrollbar-width: thin;
                scrollbar-color: #eeeeee white;
            }

            /* Works on Chrome, Edge, and Safari */
            *::-webkit-scrollbar {
                width: 10px;
            }

            *::-webkit-scrollbar-track {
                background: none;
            }

            *::-webkit-scrollbar-thumb {
                width: 10px;
                background-color: #999999;
                border-radius: 20px;
                border: 2px solid #999999;
            }
            @font-face {
                font-family: skvl;
                src: url('<?php echo Yii::$app->urlManager->baseUrl ?>/css/sukhumvit/SukhumvitSet-Light.ttf');
            }
            @font-face {
                font-family: skv;
                src: url('<?php echo Yii::$app->urlManager->baseUrl ?>/css/sukhumvit/SukhumvitSet-Medium.ttf');
            }

            @font-face {
                font-family: skvb;
                src: url('<?php echo Yii::$app->urlManager->baseUrl ?>/css/sukhumvit/SukhumvitSet-Bold.ttf');
            }

            @font-face {
                font-family: sarabun;
                src: url('<?php echo Yii::$app->urlManager->baseUrl ?>/css/sarabun/THSarabun Bold.ttf');
            }
        </style>
    </head>
    <body style=" background: #111111;">
        <?php $this->beginBody() ?>
        <div class="wrap" style=" background: #ffffff;">
            <div class="container">
                <?= Alert::widget() ?>
                <?= $content ?>
            </div>
        </div>
        <?php $this->endBody() ?>

    </body>
    <!-- Bootstrap popper Core JavaScript -->
    <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/popper/popper.min.js"></script>
    <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/bootstrap/dist/js/bootstrap.min.js"></script>

</html>
<?php $this->endPage() ?>
