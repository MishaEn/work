<?php


class RegisterModel extends Model
{
    public function add_user($data){
        $pdo = connect();
        $stm = $pdo->prepare('INSERT INTO `users`(`first_name`, `middle_name`, `last_name`, `email`, `login`, `password`) 
                                        VALUES (:first_name, :middle_name, :last_name, :email, :login, :password)'
        );
        $stm->bindValue(':first_name', $data['first_name']);
        $stm->bindValue(':middle_name', $data['middle_name']);
        $stm->bindValue(':last_name', $data['last_name']);
        $stm->bindValue(':email', $data['email']);
        $stm->bindValue(':login', $data['login']);
        $stm->bindValue(':password', password_hash($data['password'], PASSWORD_ARGON2ID));

        if($stm->execute()){
            $response = ['error' => false, 'status' => 'success'];
        }
        else{
            $response = ['error' => true, 'status' => 'execute error'];
        }
        return $response;
    }
}