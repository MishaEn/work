<?php


class UserModel
{
    public function get_user_with_order(){
        $pdo = connect();
        $stm = $pdo->prepare('SELECT login FROM users u
                                        INNER JOIN orders o on u.id = o.user_id
                                        GROUP BY o.user_id
                                        HAVING COUNT(o.id) > 2'
        );
        if($stm->execute()){
            $data = $stm->fetchAll();
            if(!$data){
                $response = ['error' => true, 'status' => 'user exist error'];
            }
            else{
                $response = ['error' => false, 'status' => 'success', 'list' => $data];
            }
        }
        else{
            $response = ['error' => true, 'status' => 'execute error'];
        }
        return $response;
    }
    public function get_user_without_order(){
        $pdo = connect();
        $stm = $pdo->prepare('SELECT login FROM users u
                                        LEFT JOIN orders o on u.id = o.user_id
                                        WHERE o.user_id is NULL'
        );
        if($stm->execute()){
            $data = $stm->fetchAll();
            if(!$data){
                $response = ['error' => true, 'status' => 'user exist error'];
            }
            else{
                $response = ['error' => false, 'status' => 'success', 'list' => $data];
            }
        }
        else{
            $response = ['error' => true, 'status' => 'execute error'];
        }
        return $response;
    }
}