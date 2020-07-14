<?php


class LoginController extends Controller
{
    function __construct(){
        $this->view = new View();
        $this->model = new LoginModel();
    }
    public function action_index(){
        $this->view->render('login', 'template', null);
    }
    public function action_get_login_module(){
        $this->view->get_module('login');
    }
    public function action_authenticate(){


        $validator = new Validator();

        $login = $_POST['login'];
        $password = $_POST['password'];

        $login_validate = $validator->validate($login, ['min' => 3, 'max' => 55, 'reg' => '']);
        $password_validate = $validator->validate($password, ['min' => 3, 'max' => 55, 'reg' => '']);
        if(!$login_validate['error'] and !$password_validate['error']){
            $auth = $this->model->authenticate($login, $password);
            if($auth['error']){
                $response = ['error' => true, 'status' => 'Пользователя с таким паролем или логином не существует'];
            }
            else {
                if(password_verify($password, $auth['password'])){
                    $_SESSION['user']['login'] = $login;
                    $response = ['error' => false, 'status' => 'success'];
                }
                else{
                    $response = ['error' => true, 'status' => 'Неверный пароль'];
                }
            }
        }
        else{
            if($login_validate['error']){
                $response = $login_validate;
            }
        }


        echo json_encode($response);
    }
    public function action_logout(){
        session_unset();
        echo json_encode(['login']);
    }
}