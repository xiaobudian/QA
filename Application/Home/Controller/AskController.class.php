<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.1
 * Time: 18:11
 */

namespace Home\Controller;

use Home\Controller\BaseController;

class AskController extends BaseController {
    public function index() {
        $this->checkAuth();
        if ($_POST) {
            $q = M('question');
            $q->title = $_POST[ 'title' ];
            $q->content = $_POST[ 'post-text' ];
            $q->ct = date('Y-m-d H:i:s');
            $q->votes = 0;
            $q->views = 0;
            $q->answers = 0;
            $user = $_SESSION[ 'user' ];

            $q->user_id = $user[0]['id'];
            $result = $q->add();

            $this->redirect("/");
        }
        $this->display();
    }
}