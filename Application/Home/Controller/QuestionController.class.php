<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.11.30
 * Time: 16:33
 */

namespace Home\Controller;


use Think\Controller;

class QuestionController extends Controller
{

    public function details($id){
        dump(M('question')->find($id));
    }

    public function tagged(){}
}