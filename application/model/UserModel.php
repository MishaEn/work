<?php


class UserModel
{
    public function get_repeating_email(){
        $pdo = connect();
        $stm = $pdo->prepare('select email from users
                                        group by email
                                        having count(*)>1'
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
    public function get_user_data(){
        $pdo = connect();
        $stm = $pdo->prepare('SELECT last_name, first_name, middle_name FROM users
                                        WHERE login=:login'
        );
        $stm->bindValue(':login', $_SESSION['user']['login']);
        if($stm->execute()){
            $data = $stm->fetch();
            if(!$data){
                $response = ['error' => true, 'status' => 'user exist error'];
            }
            else{
                $response = ['error' => false, 'status' => 'success', 'data' => $data];
            }
        }
        else{
            $response = ['error' => true, 'status' => 'execute error'];
        }
        return $response;
    }
    public function update_user($data){
        $explode_full_name = explode(' ', $data['full_name']);
        $pdo = connect();
        $stm = $pdo->prepare('UPDATE `users` 
                                        SET `first_name`=:first_name,
                                            `middle_name`=:middle_name,
                                            `last_name`=:last_name,
                                            `password`=:password,
                                            `updated_at`=:updated_at
                                        WHERE login=:login'
        );
        $stm->bindValue(':first_name',  $explode_full_name[1]);
        $stm->bindValue(':middle_name', $explode_full_name[2]);
        $stm->bindValue(':last_name',  $explode_full_name[0]);
        $stm->bindValue(':password', password_hash( $data['password'], PASSWORD_ARGON2ID));
        $stm->bindValue(':updated_at', date('Y-m-d H:i:s'));
        $stm->bindValue(':login', $_SESSION['user']['login']);
        if($stm->execute()){
            $response = ['error' => false, 'status' => 'success'];
        }
        else{
            $response = ['error' => true, 'status' => 'execute error'];
        }
        return $response;
    }
}