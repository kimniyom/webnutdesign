<?php

/*
 * This file is part of the Dektrium project
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
/**
 * @var yii\web\View $this
 * @var dektrium\user\models\User $user
 * @var dektrium\user\models\Profile $profile
 */
?>

<?php $this->beginContent('@dektrium/user/views/admin/update.php', ['user' => $user]) ?>

<h4>กำหนดสิทธิ์การใช้งาน(<?php echo $profile->name?>)</h4>
<div class="row">
    <div class="col-md-12 col-lg-12">
        <table class="table">
            <tbody>
                <?php foreach($department as $rs): ?>
                <?php if($rs['dep'] != ""){ ?>
                    <tr>
                        <td style="width: 20px; text-align: center;"><input type="checkbox" checked="checked" onclick="delPrivilege('<?php echo $rs['rule_id'] ?>')"/></td>
                        <td><?php echo $rs['department'] ?></td>
                    </tr>
                <?php } else { ?>
                    <tr>
                        <td style="width: 20px; text-align: center;"><input type="checkbox" onclick="addPrivilege('<?php echo $rs['id'] ?>')" /></td>
                        <td><?php echo $rs['department'] ?></td>
                    </tr>
                <?php } ?>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="col-md-6 col-lg-6">
        
    </div>
</div>
<?php $this->endContent() ?>

<script type="text/javascript">
    function addPrivilege(department){
        var url = "<?php echo Yii::$app->urlManager->createUrl(['user/admin/saveprivilege']) ?>";
        var userId = "<?php echo $user->id ?>";
        var data = {
            user_id: userId,
            department: department
        }

        $.post(url,data,function(res){
            window.location.reload();
        });
    }

    function delPrivilege(id){
        var url = "<?php echo Yii::$app->urlManager->createUrl(['user/admin/deleteprivilege']) ?>";
        var data = {
            id: id
        }

        $.post(url,data,function(res){
            window.location.reload();
        });
    }
</script>
