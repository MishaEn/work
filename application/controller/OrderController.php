<?php


class OrderController extends Controller
{
    function __construct(){
        $this->view = new View();
        $this->model = new OrderModel();
    }
    public function action_index(){
        $data = $this->model->get_data();
        var_dump($data);
        $this->view->render('order', 'template', $data);
    }


}