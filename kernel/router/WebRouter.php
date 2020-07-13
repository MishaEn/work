<?php
    require_once APP_KERNEL.'/Controller.php';
    require_once APP_KERNEL.'/Model.php';
    require_once APP_KERNEL.'/View.php';

class WebRouter
{
    public function route(){
        $controller_name = 'Main';
        $action_name = 'index';

        $request = explode('/', $_SERVER['REQUEST_URI']);

        if($request[0] == ''){
            $controller_name = 'Main';
        }
        if(isset($request[1])){
            if($request[1] != ''){
                $controller_name = $request[1];
            }
        }

        if(isset($request[2])){
            $action_name = $request[2];
        }

        $model_name = strtoupper(substr($controller_name, 0, 1)).substr($controller_name, 1, strlen($controller_name)).'Model';
        $controller_name = strtoupper(substr($controller_name, 0, 1)).substr($controller_name, 1, strlen($controller_name)).'Controller';
        $action_name = 'action_'.$action_name;
        if(file_exists(APP_MODEL.'/'.$model_name.'.php')){
            require_once APP_MODEL.'/'.$model_name.'.php';
        }
        if(file_exists(APP_CONTROLLER.'/'.$controller_name.'.php')){
            require_once APP_CONTROLLER.'/'.$controller_name.'.php';
        }
        else{
            $this->error(404);
        }
        $controller = new $controller_name;
        $action = $action_name;
        if(method_exists($controller, $action)){
            $controller->$action();
        }
        else{
            $this->error(404);
        }
    }

    public function error($code){
        switch($code){
            case 404:
                $host = 'http://'.$_SERVER['HTTP_HOST'].'/';
                header('HTTP/1.1 404 Not Found');
                header("Status: 404 Not Found");
                header('Location:'.$host.'error');
                break;
        }
    }
}