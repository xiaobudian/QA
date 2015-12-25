<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.2
 * Time: 10:04
 */

namespace Home\Controller;

use Think\Controller;


class BaseController extends Controller {
    public function checkAuth() {
        if (!isset($_SESSION[ 'user' ]) || empty($_SESSION[ 'user' ])) {
            $returnUrl = '/'.MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
            $query_string = $_SERVER[ 'QUERY_STRING' ];
            if ($query_string && isset($query_string)) {
                $returnUrl = $returnUrl.'?'.$query_string;
            }
            $_SESSION[ 'returnUrl' ] = $returnUrl;
            $this->redirect("/Home/Account/login");
            die();
        }
    }
}