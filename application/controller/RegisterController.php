<?php


class RegisterController extends Controller
{
    function __construct(){
        $this->view = new View();
        $this->model = new RegisterModel();
    }
    public function action_index(){

    }
    public function action_add_user(){
        $response = ['error' => false, 'status' => 'success'];
        $validator = new Validator();
        $fields = [
            'first_name' => ['field' => $_POST['first_name'], 'option' => ['min_length' => 3, 'max_length' => 55, 'reg' => '']],
            'middle_name' => ['field' => $_POST['middle_name'], 'option' => ['min_length' => 3, 'max_length' => 55, 'reg' => '']],
            'last_name' => ['field' => $_POST['last_name'], 'option' => ['min_length' => 3, 'max_length' => 55, 'reg' => '']],
            'email' => ['field' => $_POST['email'], 'option' => ['min_length' => 3, 'max_length' => 55, 'reg' => '']],
            'login' => ['field' => $_POST['login'], 'option' => ['min_length' => 3, 'max_length' => 55, 'reg' => '']],
            'password' => ['field' => $_POST['password'], 'option' => ['min_length' => 3, 'max_length' => 55, 'reg' => '']],
        ];
        $valid_fields = $validator->mass_validate($fields);
        if($valid_fields['error']){
            echo json_encode($valid_fields);
        }
        else{
            $add_status = $this->model->add_user($_POST);
            if($add_status['error']){
                $response = $add_status;
            }
        }
        echo json_encode($response);
    }
    public function action_get_register_module(){
        $this->view->get_module('register');
    }
}