<?php
    ini_set('display_errors', 1);

    define('ROOT', __DIR__);
    define('ROOT_KERNEL', ROOT.'/kernel');
    define('APP_KERNEL', ROOT_KERNEL.'/app_kernel');

    define('APP_CONTROLLER', ROOT.'/application/controller');
    define('APP_MODEL', ROOT.'/application/model');
    define('APP_VIEW', ROOT.'/application/view');

    define('TEMPLATE', APP_VIEW.'/template.php');

    require_once 'kernel\bootstrap.php';
