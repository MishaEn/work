<?php


class LoginModel extends Model
{
    public function authenticate($login, $password){
        $pdo = connect();
        $stm = $pdo->prepare('SELECT password FROM users WHERE login=:login');
        $stm->bindValue(':login', $login);
        if($stm->execute()){
            $data = $stm->fetchColumn();
            if(!$data){
                $response = ['error' => true, 'status' => 'user exist error'];
            }
            else{
                $response = ['error' => false, 'status' => 'success', 'password' => $data];
            }
        }
        else{
            $response = ['error' => true, 'status' => 'execute error'];
        }
        return $response;
    }
}