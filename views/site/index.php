<style>
    .site-index .card-body{
        border-radius: 10px;
        text-align: center;
        font-size: 24px;
        color:#FFFFFF;
    }

    .site-index .card{
        background: #d25fa0; font-family: skv;  border-radius: 10px; box-shadow: #343434 0px 5px 10px 0px;
        transition: box-shadow 0.3s;
    }

    .site-index .card:hover{
        box-shadow: 0px 5px 40px 10px #ffffff;
        border-radius: 10px;
    }


</style>
<?php
/* @var $this yii\web\View */

use app\models\ConfigWeb;

$configWeb = new ConfigWeb();
$menuList = $configWeb->getPrivilege();
$this->title = 'หจก.ณัฐดีไซน์ แอนด์ มีเดีย';
?>
<div class="site-index" style="margin-bottom: 30px; margin-top: 50px;">
    <div class="body-content">
        <div class=" container">
            <?php if ($menuList) { ?>
                <div class="row">
                    <?php
                    $count = count($menuList);
                    if ($count == 1) {
                        $col = "col-md-12 col-lg-12 col-sm-12";
                    } else if ($count == 2) {
                        $col = "col-md-6 col-lg-6 col-sm-6";
                    } else {
                        $col = "col-md-4 col-lg-4 col-sm-6";
                    }
                    foreach ($menuList as $rs):
                        $url = $rs['url'];
                        ?>
                        <div class="<?php echo $col ?>">
                            <a href="<?php echo Yii::$app->urlManager->createUrl([$url]) ?>" style=" text-decoration: none;">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <?php if ($rs['type'] == "fa") { ?>
                                                <i class="<?php echo $rs['icon'] ?>" style="font-size: 64px;"></i>
                                            <?php } else if ($rs['type'] == "ion") { ?>
                                                <ion-icon name="<?php echo $rs['icon'] ?>" style="font-size: 64px;"></ion-icon>
                                            <?php } else { ?>
                                                <span class="<?php echo $rs['icon'] ?>" style="font-size: 64px;"></span>
                                            <?php } ?>
                                            <br/>
                                            <?php echo $rs['department'] ?>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php } else { ?>
                <div class="alert alert-danger">ยังไม่ได้กำหนดสิทธิ์การใช้งานกกรุณาติดต่อ Admin ...!</div>
            <?php } ?>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        $(document).ready(function(){
            setScreens();
        });
            ');
?>

<script>
    function setScreens() {
        var w = window.innerWidth;
        if (w > 500 && w < 1024) {
            $("#title-head").hide();
            $(".text-head-mobile").show();
            $(".head-mobile").html("<font style='font-size:32px;color:#ffffff;'>NDSq</font>");
            $(".site-index .card").css({"height": 170});
        }
    }
</script>
