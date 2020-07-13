<?php


class UserController extends Controller
{
    function __construct(){
        $this->model = new UserModel();
    }
    public function action_index(){
        $this->view->render('user', 'template', $data);
    }

    public function action_get_user_without_order(){

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
}