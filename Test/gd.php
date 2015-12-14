<?php
/**
 * gd function practice.
 * User: Administrator
 * Date: 2015.12.14
 * Time: 9:54
 */
//使用gd创建动态png图像
//header("Content-type:image/png");
//$str = $_GET[ 'text' ];
//$im = imagecreatefrompng('./2.png');
//$colored = imagecolorallocate($im, 220, 20, 60);
//$px = (imagesx($im) - 7.5 * (strlen($str))) / 2;
//imagestring($im, 9, $px, 9, $str, $colored);
//imagepng($im);
//
//imagedestroy($im);
//gd_info();
//getimagesize();
//var_dump(getimagesize('./2.png'));
//echo image_type_to_extension(IMAGETYPE_PNG);
$im = imagecreatefrompng('./2.png');
$type = exif_imagetype('./2.png');
//echo $type;
//header('Content-type:'.image_type_to_mime_type($type));
//image2wbmp($im,'test.png');
try {
//    (PHP 5 >= 5.5.0, PHP 7)
    $affine = imageaffine($im,
        array(10, 10, 10, 10, 10),
        array('x' => 10, 'y' => 10, 'width' => 10, 'height' => 10));
}catch(\Think\Exception $ex){
    echo $ex->getMessage();
}
var_dump($affine);
imagepng($affine);
imagedestroy($affine);
imagedestroy($im);
