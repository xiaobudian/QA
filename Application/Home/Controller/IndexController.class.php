<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $questions = M('question')->select();
//        dump($questions);
        $this->assign('questions',$questions);
        $this->display();

    }
}