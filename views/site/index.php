<style>
    .site-index .card-body{
        border-radius: 10px;
        text-align: center;
        font-size: 24px;
        color: rgb(184, 0, 153);
    }
    .site-index .card{
        box-shadow: 0px 5px 40px 10px #cccccc;
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
<div class="site-index">
    <div class="jumbotron">
        <h1 style=" text-align: center">หจก.ณัฐดีไซน์ แอนด์ มีเดีย</h1>
    </div>

    <div class="body-content">
        <div class=" container">
            <?php if ($menuList) { ?>
                <div class="row">
                    <?php
                    foreach ($menuList as $rs):
                        $url = $rs['url'];
                        ?>
                        <div class="col-md-4 col-lg-4 col-sm-6">
                            <a href="<?php echo Yii::$app->urlManager->createUrl([$url]) ?>" style=" text-decoration: none;">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-body bg-white">
                                            <i class="<?php echo $rs['icon'] ?> fa-2x"></i><br/>
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
            $(".site-index .card").css({"height": 170});
        }
    }
</script>
