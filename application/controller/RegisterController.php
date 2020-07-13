<?php


class RegisterController extends Controller
{
    function __construct(){
        $this->model = new RegisterModel();
    }
    public function action_index(){

    }

    public function get_register_module(){
        $this->view->get_module('register');
    }
}