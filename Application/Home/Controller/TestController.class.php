<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.2
 * Time: 14:15
 */

namespace Home\Controller;


class TestController
{
    public function sendEmailTest()
    {
        echo 'begin send email.';
        $result = sendMail('849351660@qq.com', 'Welcom to qa!', 'slfjslfj');
        echo $result;

    }
}