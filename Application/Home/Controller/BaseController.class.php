<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.2
 * Time: 10:04
 */

namespace Home\Controller;
use Think\Controller;


class BaseController extends Controller
{
    public function checkAuth(){
        if (! isset($_SESSION['user']) || empty($_SESSION['user'])) {
            $this->redirect("/Home/Account/login");
            die();
        }
    }
}