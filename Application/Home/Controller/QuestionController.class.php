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

    public function details($id)
    {
        G('b');
        $map['q.id'] = array('eq', $id);
        //dump($map);
        $q = M('question q')
            ->where($map)
            ->join('auth_user u on q.user_id= u.id')
            ->field('q.id,q.title,q.votes,q.content,q.answers,q.views,q.ct,u.username,q.user_id')
            ->select();
//        dump($q);
//        dump($q[0]['id']);
        if ($q) {
            $q = $q[0];
            $tags =
                M('tag t')
                    ->join('question_tags qt on t.id = qt.tag_id')
                    ->where('qt.question_id = ' . $q['id'])
                    ->select();
            $q['tags'] = $tags;

            $mapanswer['question_id'] = array('eq', $q['id']);
            $answers = M('question_answers qa')
                ->where($mapanswer)
                ->join(' auth_user u on qa.user_id = u.id')
                ->field('qa.id,qa.votes,qa.answer,qa.user_id,u.username,qa.ct')
                ->select();
            //dump($answers);
            $q['q_answers'] = $answers;
            G('e');
            echo G('b','e').'s';
            $this->assign('q', $q);
            $this->display();
        }
    }

    public function tagged()
    {
    }
}