<?php


class UserController extends Controller
{
    function __construct(){
        $this->view = new View();
        $this->model = new UserModel();
    }
    public function action_index(){

    }
    public function action_get_repeating_email(){
        $email_list = $this->model->get_repeating_email();
        if($email_list['error']){
            $response = ['error' => true, 'status' => 'something wrong'];
        }
        else{
            $response = $email_list;
        }
        echo json_encode($response);
    }
    public function action_get_user_without_order(){
        $login_list = $this->model->get_user_without_order();
        if($login_list['error']){
            $response = ['error' => true, 'status' => 'something wrong'];
        }
        else{
            $response = $login_list;
        }
        echo json_encode($response);
    }
    public function action_get_user_with_order(){
        $login_list = $this->model->get_user_with_order();
        if($login_list['error']){
            $response = ['error' => true, 'status' => 'something wrong'];
        }
        else{
            $response = $login_list;
        }
        echo json_encode($response);
    }
    public function action_get_profile(){
        $data = $this->model->get_user_data();
        $this->view->get_module('profile', $data);
    }
    public function action_update_user(){
        $update_status = $this->model->update_user($_POST);
        if($update_status['error']){
            $response = $update_status;
        }
        else{
            $response = ['error' => false, 'status' => 'success'];
        }
        echo json_encode($response);
    }
}