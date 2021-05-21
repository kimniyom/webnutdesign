<?php
/* @var $this yii\web\View */

use yii\helpers\Html;

$this->title = 'ตั้งค่า';
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    /* The container */
    .setting-page {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 12px;
        cursor: pointer;
        font-size: 22px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* Hide the browser's default radio button */
    .setting-page input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }

    /* Create a custom radio button */
    .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        background-color: #eee;
        border-radius: 50%;
    }

    /* On mouse-over, add a grey background color */
    .setting-page:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the radio button is checked, add a blue background */
    .setting-page input:checked ~ .checkmark {
        background-color: #2196F3;
    }

    /* Create the indicator (the dot/circle - hidden when not checked) */
    .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }

    /* Show the indicator (dot/circle) when checked */
    .setting-page input:checked ~ .checkmark:after {
        display: block;
    }

    /* Style the indicator (dot/circle) */
    .setting-page .checkmark:after {
        top: 9px;
        left: 9px;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: white;
    }
</style>
<div class="site-setting container" style=" font-family: skv; background: #FFFFFF; padding: 20px; border-radius: 10px; margin-bottom: 30px;">
    <h4><i class="fa fa-cogs"></i> ตั้งค่า</h4>
    <hr/>
    <div class="row" style=" margin: 0px;">
        <div class="col-md-6 col-lg-6">
            <p style=" font-family: skv;">บัญชีผู้ใช้งาน</p>
            <div style=" font-size: 20px;">
                ชื่อ: <?php echo $profile['name'] ?><br/>
                ชื่อเล่น: <?php echo ($profile['nickname']) ? $profile['nickname'] : "-"; ?><br/>
                โทรศัพท์: <?php echo $profile['tel'] ?><br/>
                แผนก: <?php echo ($profile['departmentname']) ? $profile['departmentname'] : "-"; ?><br/>
                <hr/>
                <a href="<?php echo Yii::$app->urlManager->createUrl(['user/settings/account']) ?>">
                    <button type="button" class="btn btn-dark btn-rounded"><i class="fa fa-pencil-square-o"></i> แก้ไขรหัสผ่าน</button></a>
            </div>
        </div>
        <div class="col-md-6 col-lg-6">
            <p style=" font-family: skv;">ตั้งเป็นหน้าแรก</p>
            <?php foreach ($privilege as $rs): ?>
                <label class="setting-page"><?php echo $rs['department'] ?>
                    <input type="radio" <?php echo($activepage == $rs['id']) ? "checked" : ""; ?> name="radio" onclick="setPage('<?php echo $rs['id'] ?>', '<?php echo $rs['url'] ?>')">
                    <span class="checkmark"></span>
                </label>
            <?php endforeach; ?>
            <hr/>
        </div>
    </div>
</div>

<script type="text/javascript">
    function setPage(id, link) {
        var data = {id: id, link: link};
        var url = "<?php echo Yii::$app->urlManager->createUrl(['site/setpage']) ?>";
        $.post(url, data, function(res) {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'ตั้งค่าสำเร็จ',
                showConfirmButton: false,
                timer: 1500
            });
        });
    }
</script>
