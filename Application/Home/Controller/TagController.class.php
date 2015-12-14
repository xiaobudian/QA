<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.1
 * Time: 18:08
 */

namespace Home\Controller;

use Think\Page;
use Think\Controller;

class TagController extends Controller {
    public function index($p = 1) {
        $tag = M('tag');
        $count = $tag->count();
        $page = new Page($count, C('TAGPAGESIZE'));
        $show = $page->show();
        $tags = $tag->order('reputation desc')
            ->limit($page->firstRow . ',' . $page->listRows)
            ->select();
        $this->assign('page', $show);
        $this->assign('tags', $tags);
        $this->display();
    }

    public function create(){
        if($_POST){
            $name = $_POST['tagfilter'];
            //check 以后完善

            $tag = M('tag');
            $tag->name=$name;
            $tag->desc = $name;
            $tag->ct = date('Y-m-d H:i:s');
            $tag->reputation = 0;
            $tag->user_id = $_SESSION['user'][0]['id'];
            $tag->add();

        }
        $this->redirect('index');
    }

    public function filter() {
        if (isset($_POST[ 'filter' ])) {
            $filter = $_POST[ 'filter' ];
            $map[ 'name' ] = array('LIKE', '%' . $filter . '%');
            $tags = M('tag')
                //->fetchSql(true)
                ->where($map, true)
                ->order('reputation desc')
                ->limit(C('TAGPAGESIZE'))
                ->select();

            if(count($tags)==0) {
                echo 'notfound';
                die();
            }
            $html = '<table id="tags-browser"><tbody>';

            $tr = 1;
            foreach ($tags as $t) {
                if (($tr - 1) % 4 == 0) {
                    $html = $html . "<tr>";
                }
                $html = $html . '<td class="tag-cell">
                        <a href="/index.php/Home/Question/tagged/id/' . $t[ 'id' ] . '"class="post-tag"
                                   title="show questions tagged ' . $t[ 'name' ] . ' rel="tag">' . $t[ 'name' ] . '</a>
                                <span
                                    class="item-multiplier">
                                    <span class="item-multiplier-x">×</span>&nbsp;
                                    <span class="item-multiplier-count">' . $t[ 'reputation' ] . '</span>
                                </span>
                                <div class="excerpt">
                                    ' . $t[ 'desc' ] . '
                                </div>
                                <!--<div>-->
                                    <!--<div class="stats-row fl"><a-->
                                            <!--href="/questions/tagged/javascript?sort=newest&amp;days=1"-->
                                            <!--title="1082 questions tagged javascript in the last 24 hours">1082-->
                                        <!--asked today</a>, <a href="/questions/tagged/javascript?sort=newest&amp;days=7"-->
                                                            <!--title="6204 questions tagged javascript in the last 7 days">6204-->
                                        <!--this week</a></div>-->
                                    <!--<div class="cbt"></div>-->
                                <!--</div>-->
                            </td>';
                if ($tr % 4 == 0) {
                    $html = $html . "</tr>";
                }
                $tr++;
            }
            $html = $html . '</tbody >            </table >';
            echo $html;
        }
    }
}