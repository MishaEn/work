<?php

require_once ROOT_KERNEL.'/router/WebRouter.php';

class App
{
    public function start(){
        $router = new WebRouter();

        $router->route();
    }
}