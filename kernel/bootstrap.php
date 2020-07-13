<?php
    require_once ROOT_KERNEL.'/config/database.php';
    require_once APP_KERNEL.'/App.php';

    $app = new App();
    $app->start();
