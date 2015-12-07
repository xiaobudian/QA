<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.2
 * Time: 10:11
 */

namespace Home\Controller;

use Think\Controller;

class AccountController extends Controller {
    public function register() {
        if ($_POST) {
            $user = M('auth_user')->where($_POST)->select();
            if ($user) {
                dump("email has registered.");
                die();
            }
            $user->startTrans();

            $user = M('auth_user');
            $user->username = $_POST[ 'email' ];
            $user->email = $_POST[ 'email' ];
            $password = md5($_POST[ 'email' ]);
            $user->password = $password;
            $user->is_superuser = 0;
            $user->first_name = '';
            $user->last_name = '';
            $user->is_staff = 1;
            $user->is_active = 0;
            $user->date_joined = date('Y-m-d H:i:s');
            $user_id = $user->add();
            $profile = M('profile');
            $profile->pic = 'default.jpg';
            $profile->reputation = 0;
            $profile->user_id = $user_id;
            $profile->add();
            $result = sendMail($_POST[ 'email' ], 'Welcom to qa!', '您的初始密码就是您的邮箱，请登录后及时修改密码！');

            $user->commit();
            //dump($result);
            $this->redirect("/");
            die();
        }
        $this->display();
    }

    public function login() {
        if ($_POST) {
            $user = M('auth_user')->where($_POST)->select();
            dump($user);
            if ($user) {
                $timeout = 30; // 3600 * 24 * 2
                setcookie("username", $_POST[ 'name' ], time() + $timeout);
                setcookie("password", $_POST[ 'password' ], time() + $timeout);
                $_SESSION[ 'user' ] = $user;
            } else {
                echo "invalid username or password !";
                die();
            }
            $this->redirect("/");
            die();
        }
        $this->display();
    }

    public function logout() {
        session_destroy();
        $this->redirect('login');
    }
}