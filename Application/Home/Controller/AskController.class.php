<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.1
 * Time: 18:11
 */

namespace Home\Controller;

use Home\Controller\BaseController;

class AskController extends BaseController {
    public function index() {
        $this->checkAuth();
        if ($_POST) {
            $q = M('question');
            $q->startTrans();
            $q->title = $_POST[ 'title' ];
            $q->content = $_POST[ 'post-text' ];
            echo $q->content;
            $q->ct = date('Y-m-d H:i:s');
            $user = $_SESSION[ 'user' ];
            $q->user_id = $user[ 0 ][ 'id' ];
            $result = $q->add();
            $tags = $_POST[ 'tag' ];
            foreach ($tags as $tag) {
                $qt = M('question_tags');
                $qt->question_id = $result;
                $qt->tag_id = $tag;
                $qt->add();
            }
            $q->commit();
            //$this->redirect("/");
        }
        $this->display();
    }

    public function tagsuggestion() {
        if (isset($_POST[ 'filter' ])) {
            $filter = $_POST[ 'filter' ];
            $ids = $_POST[ 'ids' ];

            $map[ 'name' ] = array('LIKE', '%'.$filter.'%');
            $map[ 'id' ] = array('not in', $ids);
            $tags = M('tag')
//                ->fetchSql(true)
                ->where($map, true)
                ->order('reputation desc')
                ->limit(C('TAGSUGGESTION'))
                ->select();
            //echo $tags;
            $html = '<div class="tag-suggestions" style = "position: absolute; left: 0px; top: 65px; width: 648px;" >';
            foreach ($tags as $t) {
                $html = $html.'<div tabindex = "103" style = "width: 206px;"
                                        onclick="selecttag('.$t[ 'id' ].',\''.$t[ 'name' ].'\')" >
                                    <span class="post-tag" >
                                        <span class="match" >'.$t[ 'name' ].'</span >
                                    </span >
                                    <span class="item-multiplier" > × &nbsp;'.$t[ 'reputation' ].' </span >
                                    <p >'.$t[ 'description' ].'</p >
                                    <p class="more-info" >
                                        <a href="/index.php/Home/Tag/details/id/'.$t[ 'id' ].'" target="_blank"> learn more </a>
                                    </p >
                                 </div >';
            }


            $html = $html.' </div><span class="edit-field-overlay">at least one tag such as (javascript forms image), max 5 tags    </span>';

            echo $html;
        }
    }
}