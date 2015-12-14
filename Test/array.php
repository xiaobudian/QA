<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.10
 * Time: 17:58
 */

//shuffle($pai);
//foreach ($pai as &$p) {
//    $p= $p.'a';
//}
//var_dump($pai);
//strtolower($pai);
//var_dump(wordwrap('1 2 34 5k sl',5));

//function walk(&$item) {
//    $item = $item.'walked';
//}
//
//array_walk($pai, walk);
//
//var_dump($pai);

//$kv = array('a' => 'c','b'=>'d');
//$k = array_keys($kv);
//$v = array_values($kv);
//
//var_dump($k);
//var_dump($v);
//
//$nkv = array_combine($k,$v);
//var_dump($nkv);
//echo gettype(array_key_exists('a',$nkv));
//$city = 'beijing';
//$province = 'henan';
//$compact = array('city');
//$compact = compact(province,$compact);
//var_dump($compact);
//echo current($compact);
//echo each($compact);
//reset($compact);
//echo current($compact);
$arr = array(
    'name' => 'liushuai',
    'age' => 23,
    'profile' => array(
        'pic' => 'default.png',
        'email' => '849351660@qq.com',
    ),
);
//echo count($arr, COUNT_RECURSIVE);
//end($arr);
//var_dump(current($arr));
//list($name, $age, $profile) = $arr;
//echo $name;
//var_dump($profile);
//
//$obj = (object)$arr;
//var_dump($obj);
//var_dump($obj->profile);
$json = json_encode($arr);
$obj = json_decode($json);
var_dump($obj->profile);
