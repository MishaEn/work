<?php
    require_once ROOT_KERNEL.'/config/database.php';
    require_once ROOT_KERNEL.'/config/Validator.php';
    require_once APP_KERNEL.'/App.php';
    session_start();
    $app = new App();
    $app->start();
