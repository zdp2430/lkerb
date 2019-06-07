<?php
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ListView;
use yii\helpers\Url;
use yii\bootstrap\Carousel;

?>
<ul class="sidebar-menu" data-widget="tree">
            <li class="header">NAVIGASI UTAMA</li>
            <li><a href="index.php?r=pengumuman"><i class="fa fa-files-o"></i> <span>Pengumuman</span></a></li>
            <li><a href="index.php?r=forum"><i class="fa fa-laptop"></i> <span>Forum</span></a></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>Manajemen LKE</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?r=lke"><i class="fa fa-circle-o"></i> LKE</a></li>
                    <li><a href="index.php?r=bab"><i class="fa fa-circle-o"></i> Bab</a></li>
                    <li><a href="index.php?r=kriteria"><i class="fa fa-circle-o"></i> Kriteria</a></li>
                    <li><a href="index.php?r=subkriteria"><i class="fa fa-circle-o"></i> Subkriteria</a></li>
                    <li><a href="index.php?r=item"><i class="fa fa-circle-o"></i> Item</a></li>
                    <li><a href="index.php?r=bobot"><i class="fa fa-circle-o"></i> Bobot Nilai</a></li>
                    <li><a href="index.php?r=pengaturan"><i class="fa fa-circle-o"></i> Pengaturan LKE</a></li>
                </ul>
            </li>
            <li><a href="index.php?r=users"><i class="fa fa-circle-o"></i> Pengguna</a></li>
</ul>