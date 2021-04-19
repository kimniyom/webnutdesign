<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Account */

$this->title = 'Create Account';
$this->params['breadcrumbs'][] = ['label' => 'Accounts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="account-create">
	<?php if($error){ ?>
		<div class="container">
			<div class="alert alert-danger"><?php echo $error ?></div>
		</div>
	<?php } ?>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
