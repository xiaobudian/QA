<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015.12.11
 * Time: 14:08
 */
namespace test;
class Person {
    public $name;
    public $age;

    public function __construct($name, $age) {\
        error_log('test log');
        $this->name = $name;
        $this->age = $age;
    }
}

$p = new Person('liushuai', 23);
$j = json_encode($p);
var_dump(json_decode($j));
$ser = serialize($p);
var_dump($ser);
var_dump(unserialize($ser));

var_dump(function_exists('imagecreatefrompng'));
