<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.11.30
 * Time: 16:33
 */

namespace Home\Controller;

use Think\Cache\Driver\Memcached;
use Think\Controller;

class QuestionController extends Controller {

    public function index($p=1) {
        
        echo memory_get_usage() . '<br />';
        G('begin');
        $question = M('question');
        $count = $question->count();
        $page = new \Think\Page($count, C('PAGESIZE'));
        $show = $page->show();
        $key = 'question:' . 'newest' . $p;
        $mem = Memcached::getInstance();
        $questions = $mem->get($key);

        if (!$questions) {
            echo 'refreshing' . '<br />';

            $questions =
                M('question q')
                    ->order('q.id desc')
                    ->join('auth_user u on q.user_id= u.id')
                    ->limit($page->firstRow . ',' . $page->listRows)
                    ->field('q.id,q.title,q.votes,q.answers,q.views,q.ct,u.username,q.user_id,null as tags')
                    ->select();
            $count = count($questions);
            for ($i = 0; $i < $count; $i++) {

                $tags =
                    M('tag t')
                        ->join('question_tags qt on t.id = qt.tag_id')
                        ->where('qt.question_id = ' . $questions[ $i ][ 'id' ])
                        ->select();

                $questions[ $i ][ 'tags' ] = $tags;
//                dump($question);
                //array_push($question,$tags);
                //dump($question);
            }
//            $mem->clear();
            $mem->set($key, $questions);
        } else {
            echo 'cached' . '<br />';
        }


        //dump($questions);
        G('end');
        echo memory_get_usage() . '<br />';
        echo G('begin', 'end') . 's';
        $this->assign('page', $show);
        $this->assign('questions', $questions);
        $this->display();

    }

    public function details($id) {
        G('b');
        $map[ 'q.id' ] = array('eq', $id);
        //dump($map);
        $q = M('question q')
            ->where($map)
            ->join('auth_user u on q.user_id= u.id')
            ->field('q.id,q.title,q.votes,q.content,q.answers,q.views,q.ct,u.username,q.user_id')
            ->select();
//        dump($q);
//        dump($q[0]['id']);
        if ($q) {
            $q = $q[ 0 ];
            $tags =
                M('tag t')
                    ->join('question_tags qt on t.id = qt.tag_id')
                    ->where('qt.question_id = ' . $q[ 'id' ])
                    ->select();
            $q[ 'tags' ] = $tags;

            $mapanswer[ 'question_id' ] = array('eq', $q[ 'id' ]);
            $answers = M('question_answers qa')
                ->where($mapanswer)
                ->join(' auth_user u on qa.user_id = u.id')
                ->field('qa.id,qa.votes,qa.answer,qa.user_id,u.username,qa.ct')
                ->select();
            //dump($answers);
            $q[ 'q_answers' ] = $answers;


            G('e');
            echo G('b', 'e') . 's';
            $this->assign('q', $q);
            $this->display();
        }
    }

    public function tagged() {
    }
}