<?php

/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main application asset bundle.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle {

    public $basePath = '@webroot';
    public $baseUrl = '@web/web';
    public $css = [
            //'css/site.css',
            //"theme/assets/node_modules/morrisjs/morris.css",
            //"theme/assets/node_modules/c3-master/c3.min.css",
            //"theme/css/style.css",
            //"theme/css/pages/dashboard1.css",
            //"theme/css/timeline.css"
    ];
    public $js = [
            /*
              "theme/dist/js/sweetalert2.js",
              "theme/assets/node_modules/jquery/jquery-3.2.1.min.js",
              "theme/assets/node_modules/popper/popper.min.js",
              "theme/assets/node_modules/bootstrap/dist/js/bootstrap.min.js",
              "theme/js/perfect-scrollbar.jquery.min.js",
              "theme/js/waves.js",
              "theme/js/sidebarmenu.js",
              "theme/js/custom.min.js",
              "theme/assets/node_modules/raphael/raphael-min.js",
              "theme/assets/node_modules/morrisjs/morris.min.js",
              "theme/assets/node_modules/jquery-sparkline/jquery.sparkline.min.js",
              "theme/assets/node_modules/d3/d3.min.js",
              "theme/assets/node_modules/c3-master/c3.min.js",
              "theme/js/dashboard1.js"
             */
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];

}
