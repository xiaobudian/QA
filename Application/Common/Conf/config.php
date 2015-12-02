<?php
return array(
    //'配置项'=>'配置值'
    // Url pattern
    'URL_MODEL' => 3, // 路由模式 - 兼容模式

    'DB_TYPE' => 'mysql', // 数据库类型
    'DB_HOST' => '127.0.0.1', // 服务器地址127.0.0.1
    'DB_NAME' => 'qa', // 数据库名称
    'DB_USER' => 'root', // 数据库登陆名称
    'DB_PWD' => 'root', // 登陆密码
    'DB_PORT' => '3306', // 数据库端口
    'DB_CHARSET' => 'utf8', // 字符集

    'DATA_CACHE_TIME' => 60, // 缓存过期时间  单位：秒
    // layout
    'LAYOUT_ON' => true, // 使用模板
    'LAYOUT_NAME' => 'layout', // 模板名称

    // 'ACTION_SUFFIX' => 'Action', // 操作方法后缀

    //邮件配置
    'MAIL_HOST' => 'smtp.163.com',//smtp服务器的名称
    'MAIL_SMTPAUTH' => TRUE, //启用smtp认证
    'MAIL_USERNAME' => 'olayule@163.com',//发件人的邮箱名
    'MAIL_PASSWORD' => '/.b0303nabColayl',//163邮箱发件人授权密码
    'MAIL_FROM' => 'olayule@163.com',//发件人邮箱地址
    'MAIL_FROMNAME' => '刘帅',//发件人姓名
    'MAIL_CHARSET' => 'utf-8',//设置邮件编码
    'MAIL_ISHTML' => TRUE, // 是否HTML格式邮件
);