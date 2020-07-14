<?php


class MainController extends Controller{

    function __construct(){
        $this->view = new View();
        $this->model = new MainModel();
    }

    public function action_index(){

        $data = $this->model->get_data();
        $this->view->render('main', 'template');
    }
}