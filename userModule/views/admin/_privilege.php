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

<h4 style="border-bottom: #666666 solid 1px; padding-bottom: 15px;">ชื่อผู้ใช้งาน(<?php echo $profile->name ?>)</h4>
<div class="row">
    <div class="col-md-6 col-lg-6">
        <h4>สิทธิ์เข้าถึงเมนู</h4>
        <table class="table">
            <tbody>
                <?php foreach ($departments as $rs): ?>
                    <?php if($rs['active'] == 1) { ?>
                    <?php if ($rs['dep'] != "") { ?>
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
                <?php } else { ?>
                    <tr>
                            <td style="width: 20px; text-align: center; color: #eeeeee;"><input type="checkbox" disabled="disabled" /></td>
                            <td style="color: #eeeeee;"><?php echo $rs['department'] ?></td>
                        </tr>
                <?php } ?>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="col-md-6 col-lg-6">
        <h4>สิทธิ์การใช้งาน อื่น ๆ</h4>
        <table class="table">
            <tbody>
                <tr>
                    <td style="width: 20px; text-align: center;">
                        <?php if ($privilege['edit_project'] == 1) { ?>
                            <input type="checkbox" checked="checked" onclick="updatePrivilege('edit_project', 0)"/>
                        <?php } else { ?>
                            <input type="checkbox" onclick="updatePrivilege('edit_project', 1)"/>
                        <?php } ?>
                    </td>
                    <td>แก้ไขรายละเอียด</td>
                </tr>
                <tr>
                    <td style="width: 20px; text-align: center;">
                        <?php if ($privilege['notify_customer'] == 1) { ?>
                            <input type="checkbox" checked="checked" onclick="updatePrivilege('notify_customer', 0)"/>
                        <?php } else { ?>
                            <input type="checkbox" onclick="updatePrivilege('notify_customer', 1)"/>
                        <?php } ?>
                    </td>
                    <td>แจ้งลูกค้า</td>
                </tr>
                <tr>
                    <td style="width: 20px; text-align: center;">
                        <?php if ($privilege['edit_tranfer'] == 1) { ?>
                            <input type="checkbox" checked="checked" onclick="updatePrivilege('edit_tranfer', 0)"/>
                        <?php } else { ?>
                            <input type="checkbox" onclick="updatePrivilege('edit_tranfer', 1)"/>
                        <?php } ?>
                    </td>
                    <td>แก้ไขข้อมูลการจัดส่ง</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<?php $this->endContent() ?>

<script type="text/javascript">
    function addPrivilege(department) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['user/admin/saveprivilege']) ?>";
        var userId = "<?php echo $user->id ?>";
        var data = {
            user_id: userId,
            department: department
        }

        $.post(url, data, function(res) {
            window.location.reload();
        });
    }

    function delPrivilege(id) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['user/admin/deleteprivilege']) ?>";
        var data = {
            id: id
        }

        $.post(url, data, function(res) {
            window.location.reload();
        });
    }

    function updatePrivilege(field, val) {
        var url = "<?php echo Yii::$app->urlManager->createUrl(['user/admin/updateprivilege']) ?>";
        var userId = "<?php echo $user->id ?>";
        var data = {
            user_id: userId,
            field: field,
            privilege: val
        }

        $.post(url, data, function(res) {
            window.location.reload();
        });
    }
</script>
