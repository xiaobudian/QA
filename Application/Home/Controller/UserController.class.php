<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.1
 * Time: 18:09
 */

namespace Home\Controller;

class UserController extends BaseController {
    public function index() {
        echo 'User/index';
    }

    public function activity() {
        $this->checkAuth();
        $this->display();
    }

    public function profile() {

        $this->checkAuth();
        $map[ 'u.id' ] = array('eq', getUserId());
        $profile = M('auth_user u')
            ->join('left join profile p on p.user_id = u.id ')
            ->where($map)
            ->field('u.id,u.username,u.date_joined,p.pic,p.reputation')
            //->fetchSql(true)
            ->select();
        $this->assign('profile', $profile[ 0 ]);
        $this->display();
    }

    public function  edit() {
        $this->checkAuth();

        $this->display();
    }
}