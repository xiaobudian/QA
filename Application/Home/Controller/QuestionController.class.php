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
use Think\Exception;

class QuestionController extends Controller {

    public function index($p = 1) {

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
            $answers = M('answer a')
                ->where($mapanswer)
                ->order('votes desc')
                ->join(' auth_user u on a.user_id = u.id')
                ->field('a.id,a.votes,a.answer,a.user_id,u.username,a.ct')
                ->select();
//            $answer_count = count($answers);
//            for($i=0;$i<$answer_count;$i++){
//                $answers[$i]['answer'] = urldecode($answers[$i]['answer']);
//            }
            //dump($answers);
            $q[ 'q_answers' ] = $answers;


            G('e');
            echo G('b', 'e') . 's';
            $this->assign('q', $q);
            $this->display();
        }
    }

    public function tagged($id) {
    }

    public function answer() {
        if ($_POST) {
            $answer_str = $_POST[ 'answer' ];
            $answer_str = urldecode($answer_str);
            if (strlen($answer_str) > 0) {
                $answer = M('answer');
                try {
                    $answer->startTrans();
                    $answer->answer = $answer_str;
                    $answer->votes = 0;
                    $answer->ct = date('Y-m-d H:i:s');
                    $answer->question_id = $_POST[ 'question_id' ];
                    $user = $_SESSION[ 'user' ][ 0 ];
                    $answer->user_id = $user[ 'id' ];
                    $added = $answer->add();
                    $map[ 'id' ] = array('eq', $_POST[ 'question_id' ]);
                    $question = M('question');
                    $inced = $question->where($map)->setInc('answers', 1);
                    if ($added && $inced) {
                        $answer->commit();
                    } else {
                        $answer->rollback();
                    }
                } catch (Exception $ex) {
                    $answer->rollback();
                    echo $ex->getMessage();
                    die();
                }
            }else{
                echo '答案长度不符合要求';
                die();
            }
        }

        $this->redirect('/Home/Question/details/id/' . $_POST[ 'question_id' ]);
    }
}