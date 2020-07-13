<?php


class ErrorController extends Controller
{
    public function action_index(){
        $this->view->render('error', 'template', null);
    }
}