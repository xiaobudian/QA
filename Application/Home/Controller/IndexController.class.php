<?php
namespace Home\Controller;

use Think\Controller;
use Think\Cache\Driver\Memcached;

class IndexController extends Controller
{
    public function index()
    {
        echo memory_get_usage() . '<br />';
        G('begin');
        $key = 'question:' . 'newest';
        $mem = Memcached::getInstance();
        $questions = $mem->get($key);

        if (!$questions) {
            echo 'refreshing'. '<br />';
            $questions =
                M('question q')
                    ->order('q.id desc')
                    ->join('auth_user u on q.user_id= u.id')
                    ->limit(10)
                    ->field('q.id,q.title,q.votes,q.answers,q.views,q.ct,u.username,q.user_id,null as tags')
                    ->select();
            $count = count($questions);
            for ($i=0; $i<$count;$i++) {

                $tags =
                    M('tag t')
                        ->join('question_tags qt on t.id = qt.tag_id')
                        ->where('qt.question_id = ' . $questions[$i]['id'])
                        ->select();

                $questions[$i]['tags'] = $tags;
//                dump($question);
                //array_push($question,$tags);
                //dump($question);
            }
            $mem->clear();
            $mem->set($key, $questions);
        }else{
            echo 'cached'. '<br />';
        }

        //dump($questions);
        G('end');
        echo memory_get_usage() . '<br />';
        echo G('begin','end').'s';
        $this->assign('questions', $questions);
        $this->display();

    }

    public function mem()
    {
        $mem = Memcached::getInstance();
        $tags = $mem->get('tags');
        dump($tags);
        if (!$tags) {
            $mem->set('tags', M('tag')->select());
        }
        dump($mem->get('tags'));
//        $mem = Memcached::getInstance();
//        $mem->set('ls', 'liushuai');
//        echo $mem->get('ls');
//        dump($mem);
//        $Cache = Cache::getInstance('memcache');
//////或者:
////        $options = array('host' => '127.0.0.1', 'port' => 11211, 'timeout' => 10,
////            'persistent' => false);
////        $Cache = Cache::getInstance('memcache', $options);
//        $Cache->set('name','ThinkPHP'); // 缓存name数据
//        $value = $Cache->get('name'); // 获取缓存的name数据
//        $Cache->close();
//        echo $value;


    }

    public function phpinfo()
    {

        echo phpinfo();
    }

}