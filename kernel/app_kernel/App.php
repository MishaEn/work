<?php

require_once ROOT_KERNEL.'/router/WebRouter.php';
require_once ROOT_KERNEL.'/config/Auth.php';

class App
{
    public function start(){
        $router = new WebRouter();
        $auth = new Auth();
        $request = explode('/', $_SERVER['REQUEST_URI']);
        if(!$auth->check_auth()){
            if($request[1] !== 'login'){
                if($request[1] !== 'register'){
                    header('Location: /login');
                }
            }
        }
        $router->route();
    }
}