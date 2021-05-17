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

        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/c3-master/c3.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/template.css" rel="stylesheet">
        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/css/style.css" rel="stylesheet">
        <!-- Dashboard 1 Page CSS -->
        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/css/pages/dashboard1.css" rel="stylesheet">
        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/css/timeline.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
        
        <!-- Datatable -->
        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/DataTables/DataTables-1.10.24/css/jquery.dataTables.css" rel="stylesheet">

        <!-- screen Mobile -->
        <link href="<?php echo Yii::$app->urlManager->baseUrl ?>/css/screen-mobile.css" rel="stylesheet">
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
            #sidebarnav .active{
                border-right: #ffbc34 solid 0px;
                color: #ffcc00;

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

            .topbar{
                background-image: linear-gradient(to top, #cd1c77, #d56fa1);
                box-shadow:#242424 0px 0px 10px 0px;
            }

            @media (min-width: 1024px) {
                .left-sidebar{
                    left:0px;
                    border-left:0px;
                    width:200px;
                }

                .page-wrapper{
                    padding-left:140px;
                }

                .topbar{
                    background-image: linear-gradient(to top, #cd1c77, #d56fa1);
                    padding-left:230px;
                    box-shadow:#242424 0px 0px 10px 0px;
                }
            }
            .line-menu{
                width: 100%;
                height: 3px;
                background-image: linear-gradient(to right, #cd1c77,#d56fa1);
                position: absolute;
                margin-bottom:0px;
            }

            #head-toolbar{
                background-image: linear-gradient(to right, #cd1c77,#d56fa1);
            }
        </style>
    </head>
    <body class="skin-default-dark fixed-layout" style=" background: #eac0d6;">
        <?php $this->beginBody() ?>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">Loading ...</p>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar" style="z-index: 1000;">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->

                    <div class="navbar-header" style=" border-right:none;" id="logo-home">
                        <a class="navbar-brand" >
                            <b style="color: #cc0066;">
                                <img src="<?php echo Url::to('@web/images/logo-icon-new.png') ?>" alt="homepage" class="dark-logo" style="width:39px;"/>
                                <img src="<?php echo Url::to('@web/images/logo-icon-new.png') ?>" alt="homepage" class="light-logo" style="width:39px;"/>

                            </b>
                        </a>

                    </div>

                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse">
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav mr-auto">
                            <!-- This is  nav-item hidden-sm-up-->
                            <li class="nav-item" id="menu-ham" style=" padding-left: 0px;">
                                <a class="nav-link nav-toggler waves-effect waves-light" href="javascript:void(0)" id="icon-menu-ham" style=" color: #FFFFFF;"><i class="ti-menu"></i>
                                </a>
                            </li>
                            <li style="padding-top:10px;font-size:30px;  font-family: skv; padding-left: 20px; font-weight: bold; display: none;" class="text-head-mobile">
                                <div class="head-mobile"></div>
                            </li>
                            <li style="padding-top:10px;font-size:20px;" class="text-head">
                                <a class="nav-link">
                                    <span class="text-head">
                                        <b style=" font-family: skv; font-size: 22px; color: #0e0e0e">
                                            Nutdesign System Queue
                                        </b>
                                    </span>
                                </a>
                            </li>
                            <!-- ============================================================== -->
                            <!-- Search -->
                            <!-- ============================================================== -->

                        </ul>
                        <ul class="navbar-nav my-lg-0">
                            <?php if (!Yii::$app->user->isGuest) { ?>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: #FFFFFF;">
                                        รายงาน <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Report 1</a>
                                        <a class="dropdown-item" href="#">Report 2</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Report 3</a>
                                    </div>
                                </li>
                                <?php if (Yii::$app->user->identity->status == "A") { ?>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: #FFFFFF;">
                                            <i class="fa fa-cog" aria-hidden="true"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="<?php echo Yii::$app->urlManager->createUrl(['/user/settings/account']) ?>">Acount</a>
                                            <a class="dropdown-item" href="<?php echo Yii::$app->urlManager->createUrl(['user/admin/index']) ?>">จัดการผู้ใช้งาน</a>
                                            <a class="dropdown-item" href="<?php echo Yii::$app->urlManager->createUrl(['mascancel/index']) ?>">ตั้งค่าสาเหตุยกเลิกงาน</a>
                                            <a class="dropdown-item" href="<?php echo Yii::$app->urlManager->createUrl(['maseditwork/index']) ?>">ตั้งค่าสาเหตุส่งกลับแก้ไข</a>
                                        </div>
                                    </li>
                                <?php } else { ?>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link text-info" href="<?php echo Yii::$app->urlManager->createUrl(['/user/settings/account']) ?>" style=" color: #FFFFFF;">
                                            <?php echo Yii::$app->user->identity->username ?> <i class="fas fa-cog"></i>
                                        </a>
                                    </li>
                                <?php } ?>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="<?php echo Yii::$app->urlManager->createUrl(['site/logout']) ?>" style=" color: #FFFFFF;">
                                        Sign Out <i class="fas fa-sign-out-alt"></i>
                                    </a>
                                </li>

                            <?php } else { ?>
                                <li class="nav-item">
                                    <a class="nav-link" href="<?php echo Yii::$app->urlManager->createUrl(['user/security/login']) ?>"><i class="fa fa-sign-in"></i> Sign In</a>
                                </li>
                            <?php } ?>
                            <!-- ============================================================== -->
                            <!-- User profile and search -->
                            <!-- ============================================================== -->
                            <!--
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href=""
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="<?php //echo Url::to('@web/images/users/1.png')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ?>" alt="user" class="img-circle" width="30">
                                </a>
                            </li>
                            -->
                            <!-- ============================================================== -->
                            <!-- User profile and search -->
                            <!-- ============================================================== -->
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <aside class="left-sidebar" style="z-index: 1000; box-shadow: none; background:#d25fa0">
                <div class="d-flex no-block nav-text-box align-items-center" style="border-bottom: 0px;background:#d25fa0">
                    <span style=" text-align: center; padding-left: 50px; " id="logo-head-sidebar">
                        <img src="<?php echo Url::to('@web/images/logo-icon-new.png') ?>" alt="nutdesign" style="height:64px;">
                    </span>

                    <a class="waves-effect waves-dark ml-auto hidden-sm-down" href="javascript:void(0)" style=" display: none;">
                        <i class="ti-menu text-danger"></i>
                    </a>
                    <a class="nav-toggler waves-effect waves-dark ml-auto hidden-lg" href="javascript:void(0)" id="menu-toggle-sidebar">
                        <i class="ti-menu ti-close"></i>
                    </a>
                </div>

                <!-- Sidebar scroll-->
                <div class="scroll-sidebar" style=" background:#d25fa0; margin-top: 10px;">
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                            <span class="line-menu"></span>
                            <?php
                            if ($menuList) {
                                foreach ($menuList as $rs):
                                    $url = $rs['url'];
                                    $menu = \Yii::$app->session->get('menu');

                                    if ($rs['id'] == $menu) {
                                        $class = "active";
                                    } else {
                                        $class = "";
                                    }
                                    ?>
                                    <li onclick="setMenu('<?php echo $rs['id'] ?>')" style=" font-weight: bold; border-bottom: #d25fa0 solid 2px;">
                                        <a id="menu<?php echo $rs['id'] ?>" class="waves-effect waves-dark" href="<?php echo Yii::$app->urlManager->createUrl([$url]) ?>" aria-expanded="false" style="font-family: skvb;">
                                            <?php if ($rs['type'] == "lnr") { ?>
                                                <span class="<?php echo $rs['icon'] ?> pull-right" style="margin-right: 5px; font-size: 24px;"></span>
                                            <?php } else if ($rs['type'] == "ion") { ?>
                                                <ion-icon name="<?php echo $rs['icon'] ?>" class="pull-right" style="margin-right: 5px; font-size: 24px;"></ion-icon>
                                            <?php } else { ?>
                                                <i class="<?php echo $rs['icon'] ?>" style="font-size: 20px;"></i>
                                            <?php } ?>
                                            <span class="hide-menu" style=" font-weight: bold;"><?php echo $rs['department'] ?></span>
                                        </a>
                                        <span class="line-menu"></span>
                                    </li>
                                <?php endforeach; ?>
                            <?php } else { ?>
                                <li style=" text-align: center;">
                                    ยังไม่ได้กำหนดสิทธิ์กรุณาติดต่อ Admin
                                </li>
                            <?php } ?>
                            <br/>
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>

            <div class="page-wrapper" style="padding-top:35px; background: #eac0d6">
                <div class="container-fluid" style="padding-bottom: 0px; padding-top:0px;">
                    <div class="row page-titles" style="margin-bottom: 0px; padding-top: 0px;">
                        <div class="col-md-12 align-self-center text-right">
                            <div class="d-flex justify-content-end align-items-center">

                                <?php
                                echo Breadcrumbs::widget([
                                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                                ])
                                ?>
                            </div>
                        </div>
                    </div>


                </div>
                <?php echo Alert::widget() ?>
                <?php echo $content ?>
            </div>

        </div>
        <div class="tab-bottom" style="width: 100%; height: 20px; position: fixed; bottom: 0px; left: 0px; text-align: center; color: #666666; background: #eac0d6; border-top:solid 0px #eeeeee;">&copy;2021 หจก.ณัฐดีไซน์ แอนด์ มีเดีย</div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/jquery/jquery-3.2.1.min.js"></script>
        <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
        <script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
        
        <!---->
        <?php $this->endBody() ?>

        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/js/sweetalert2.js"></script>
        <!-- Bootstrap popper Core JavaScript -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/popper/popper.min.js"></script>
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- slimscrollbar scrollbar JavaScript -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/js/perfect-scrollbar.jquery.min.js"></script>
        <!--Wave Effects -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/js/waves.js"></script>
        <!--Menu sidebar -->

        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/js/sidebarmenu.js"></script>

        <!--Custom JavaScript -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/js/custom.min.js"></script>
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->
        <!--morris JavaScript -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/raphael/raphael-min.js"></script>
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/morrisjs/morris.min.js"></script>
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
        <!--c3 JavaScript -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/d3/d3.min.js"></script>
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/c3-master/c3.min.js"></script>
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/DataTables/DataTables-1.10.24/js/jquery.dataTables.js"></script>

        <!--
                <script src="<?php //echo Yii::$app->urlManager->baseUrl                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ?>/theme/assets/gijgo/gijgo.min.js"></script>
                <link href="<?php //echo Yii::$app->urlManager->baseUrl                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ?>/theme/assets/gijgo/gijgo.min.css" rel="stylesheet">
        -->
        <?php
        $this->registerJs('
            $(document).ready(function(){
                setScreen();
                checkLogin();
            });
         ');
        ?>
        <script>
                                        window.onscroll = function() {
                                            fixheader();
                                        };

                                        //var header = document.getElementById("head-toolbar");
                                        //var sticky = header.offsetTop;



                                        function fixheader() {

                                            var w = window.innerWidth;
                                            if (w <= 1024) {
                                                if (window.pageYOffset > 20) {
                                                    $("#head-toolbar").css({"position": "fixed", "width": "100%", "margin-top": "0px", "z-index": "100"});
                                                } else {
                                                    $("#head-toolbar").css({"position": "relative", "width": "100%", "margin-top": "0px"});
                                                }
                                            }
                                        }

                                        function setScreen() {
                                            var w = window.innerWidth;
                                            if (w < 1023) {
                                                $(".page-wrapper").css({"padding-left": "0px"});
                                                $(".page-wrapper").css({"margin-left": "0px"});
                                                $(".text-head").hide();
                                                $(".navbar-header").show();
                                                $("#logo-head-sidebar").css({"margin-left": "20px"});
                                                $("#logo-home").hide();
                                            } else {
                                                //$(".left-sidebar").css({"left": "0px"});

                                                //$(".page-wrapper").css({"padding-left": "250px"});
                                                $("#menu-ham").hide();
                                                $("#menu-toggle-sidebar").hide();
                                                $(".text-head").show();
                                                $(".navbar-header").hide();
                                            }

                                            $(".breadcrumb li").addClass("breadcrumb-item");
                                        }

                                        function logOut() {
                                            var r = confirm("Are you sure ...");
                                            if (r == true) {
                                                var url = "<?php echo Yii::$app->urlManager->createUrl(['user/security/logout']) ?>";
                                                $.post(url, {}, function(res) {
                                                    window.location = "<?php echo Yii::$app->urlManager->createUrl(['site']) ?>";
                                                });
                                            }
                                        }

                                        function checkLogin() {
                                            var user = "<?php echo Yii::$app->user->isGuest ?>";
                                            var url = "<?php echo Yii::$app->urlManager->createUrl(['user/security/login']) ?>";
                                            if (user) {
                                                window.location = url;
                                            }
                                        }

                                        function setMenu(menuId) {
                                            var url = "<?php echo Yii::$app->urlManager->createUrl(['site/setmenu']) ?>";
                                            var data = {menuId: menuId};
                                            $.post(url, data, function(res) {

                                            });
                                        }
        </script>
    </body>
</html>
<?php $this->endPage() ?>
