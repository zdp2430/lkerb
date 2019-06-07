<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Lke */

$this->title = 'Buat Beranda';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lke-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
