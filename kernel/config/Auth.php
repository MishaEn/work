<?php

class Auth
{
    public function check_auth(){
        if(isset($_SESSION['user'])){
            return true;
        }
        else{
            return false;
        }
    }

}