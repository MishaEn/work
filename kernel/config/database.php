<?php
    function connect(){
        $host = 'localhost';
        $user = 'work';
        $password = '12345';
        $db = 'work';
        $dsn ='mysql:host='.$host.';dbname='.$db;
        $opt = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        return new PDO($dsn, $user, $password, $opt);
    }