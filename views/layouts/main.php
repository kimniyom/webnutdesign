<?php
/* @var $this \yii\web\View */
/* @var $content string */

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
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
    </head>
    <body class="skin-default-dark fixed-layout">
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
            <header class="topbar">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-header" style=" border-right:none;">
                        <a class="navbar-brand" >
                            <b style="color: #cc0066;">
                                <img src="<?php echo Url::to('@web/images/logo-nat-design.png') ?>" alt="homepage" class="dark-logo" style="width:39px;"/>
                                <img src="<?php echo Url::to('@web/images/logo-nat-design.png') ?>" alt="homepage" class="light-logo" style="width:39px;"/>
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
                            <!-- This is  -->
                            <li class="nav-item hidden-sm-up">
                                <a class="nav-link nav-toggler waves-effect waves-light" href="javascript:void(0)"><i class="ti-menu"></i>
                                </a>
                            </li>
                            <li style="padding-top:10px;font-size:20px;" class="text-head">
                                <a class="nav-link"><span class="text-head"><b>หจก.ณัฐดีไซน์ แอนด์ มีเดีย</b></span></a>
                            </li>
                            <!-- ============================================================== -->
                            <!-- Search -->
                            <!-- ============================================================== -->
                            <li class="nav-item search-box">
                                <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="fa fa-search"></i></a>
                                <form class="app-search">
                                    <input type="text" class="form-control" placeholder="ค้นหาด้วยชื่อลูกค้า ..."> <a
                                        class="srh-btn"><i class="fa fa-times"></i></a>
                                </form>
                            </li>


                        </ul>
                        <ul class="navbar-nav my-lg-0">
                            <?php if (!Yii::$app->user->isGuest) { ?>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Report <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Report 1</a>
                                        <a class="dropdown-item" href="#">Report 2</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Report 3</a>
                                    </div>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Setting <i class="fa fa-cog" aria-hidden="true"></i>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="<?php echo Yii::$app->urlManager->createUrl(['/user/settings/account']) ?>">บัญชีผู้ใช้งาน</a>
                                        <?php if (Yii::$app->user->identity->status == "A") { ?>
                                            <a class="dropdown-item" href="<?php echo Yii::$app->urlManager->createUrl(['user/admin/index']) ?>">ผู้ใช้งาน</a>
                                            <div class="dropdown-divider"></div>
                                        <?php } ?>
                                    </div>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="<?php echo Yii::$app->urlManager->createUrl(['site/logout']) ?>">
                                        Log Out <i class="fa fa-sign-out"></i>
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
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href=""
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="<?php echo Url::to('@web/images/users/1.png') ?>" alt="user" class="img-circle" width="30">
                                </a>
                            </li>
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
            <aside class="left-sidebar">
                <div class="d-flex no-block nav-text-box align-items-center">
                    <span>
                        <img src="<?php echo Url::to('@web/images/logo-nat-design.png') ?>" alt="nutdesign" style="width:39px;">
                    </span>
                    <a class="waves-effect waves-dark ml-auto hidden-sm-down" href="javascript:void(0)">
                        <i class="ti-menu"></i>
                    </a>
                    <a class="nav-toggler waves-effect waves-dark ml-auto hidden-sm-up" href="javascript:void(0)">
                        <i class="ti-menu ti-close"></i>
                    </a>
                </div>
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                            <!--
                            <li>
                                <a class="waves-effect waves-dark" href="#" aria-expanded="false">
                                    <i class="fa fa-tachometer"></i>
                                    <span class="hide-menu">Dashboard</span>
                                </a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="index.html">Minimal </a></li>
                                    <li><a href="index2.html">Analytical</a></li>
                                    <li><a href="index3.html">Demographical</a></li>
                                    <li><a href="index4.html">Modern</a></li>
                                </ul>
                            </li>
                            -->
                            <li>
                                <a class="waves-effect waves-dark" href="index.html" aria-expanded="false">
                                    <i class="fas fa-tachometer-alt"></i><span class="hide-menu">Dashboard</span>
                                </a>
                            </li>
                            <?php
                            foreach ($menuList as $rs):
                                $url = $rs['url'];
                                ?>
                                <li>
                                    <a class="waves-effect waves-dark" href="<?php echo Yii::$app->urlManager->createUrl([$url]) ?>" aria-expanded="false">
                                        <i class="<?php echo $rs['icon'] ?>"></i><span class="hide-menu"><?php echo $rs['department'] ?></span>
                                    </a>
                                </li>
                            <?php endforeach; ?>
                            <!--
                            <li>
                                <a class="waves-effect waves-dark" href="home.html" aria-expanded="false">
                                    <i class="fa fa-users"></i><span class="hide-menu">รับงาน</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="marketing.html" aria-expanded="false">
                                    <i class="fa fa-tags"></i><span class="hide-menu">การตลาด</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="account.html" aria-expanded="false">
                                    <i class="fa fa-usd"></i><span class="hide-menu">บัญชี / ใบเสนอราคา</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="graphy.html" aria-expanded="false">
                                    <i class="fa fa-paint-brush"></i><span class="hide-menu">กราฟิก</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="menager.html" aria-expanded="false">
                                    <i class="fa fa-user-secret"></i><span class="hide-menu">ผู้อนุมัติสั่งผลิต / ตรวจสอบงาน</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="branch-print.html" aria-expanded="false">
                                    <i class="fa fa-print"></i><span class="hide-menu">งานพิมพ์</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="branch-cnc.html" aria-expanded="false">
                                    <i class="fa fa-magnet"></i><span class="hide-menu">งาน CNC</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="branch-manufacture.html" aria-expanded="false">
                                    <i class="fa fa-codepen"></i><span class="hide-menu">ผลิตทั่วไป</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="technician.html" aria-expanded="false">
                                    <i class="fa fa-wrench"></i><span class="hide-menu">ช่าง</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="transport.html" aria-expanded="false">
                                    <i class="fa fa-truck"></i><span class="hide-menu">ฝ่ายจัดส่ง</span>
                                </a>
                            </li>
                            <hr/>
                            <li>
                                <a class="waves-effect waves-warning" href="backend.html" aria-expanded="false">
                                    <i class="fa fa-cogs text-warning"></i>
                                    <span class="hide-menu text-warning">ตั้งค่า</span>
                                </a>
                            </li>
                            <li>
                                <a class="waves-effect waves-dark" href="login.html" aria-expanded="false">
                                    <i class="fa fa-sign-out text-danger"></i>
                                    <span class="hide-menu text-danger">Log Out</span>
                                </a>
                            </li>
                            -->
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>

            <div class="page-wrapper" style="padding-top:38px;background: #FFFFFF !important;">
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
<div style="width: 100%; height: 20px; position: fixed; bottom: 0px; left: 0px; text-align: center; color: #666666;">&copy;2021 หจก.ณัฐดีไซน์ แอนด์ มีเดีย</div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="<?php echo Yii::$app->urlManager->baseUrl ?>/theme/assets/jquery/jquery-3.2.1.min.js"></script>
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

        <!--
                <script src="<?php //echo Yii::$app->urlManager->baseUrl   ?>/theme/assets/gijgo/gijgo.min.js"></script>
                <link href="<?php //echo Yii::$app->urlManager->baseUrl   ?>/theme/assets/gijgo/gijgo.min.css" rel="stylesheet">
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
            function setScreen() {
                var w = window.innerWidth;
                if (w < 700) {
                    $(".text-head").hide();
                } else {
                    $(".text-head").show();
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
        </script>
    </body>
</html>
<?php $this->endPage() ?>
