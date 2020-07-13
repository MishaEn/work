<?php


class OrderModel extends Model
{
    public function get_user_with_order(){
        $pdo = connect();
        $stm = $pdo->prepare('SELECT password FROM users WHERE login=:login');
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