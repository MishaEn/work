<?php


class View
{
    public  function render($content, $template, $data = null){
        require_once APP_VIEW.'/'.$template.'.php';
    }
    public function get_module($module, $data = null){
        require_once APP_VIEW.'/'.$module.'.php';
    }
}