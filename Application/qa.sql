#drop database if exists qa;
#create database if not exists qa default char set utf8;
use qa;

# drop constraints

#alter table question drop FOREIGN KEY question_ibfk_1;

#drop table if exists user;
create table if not exists user(
    id int auto_increment not null,
    name varchar(20) not null unique,
    nickname varchar(30) not null,
    email varchar(20) not null unique,
    pwd varchar(35) not null,
    pic varchar(60),
    ct datetime not null, # create time 
    llt datetime null, # last login time
    status int not null,
    primary key(id)
);

#drop table if exists question;
create table if not exists question(
    id int auto_increment not null,
    title nvarchar(150) not null,
    content text not null,
    ct datetime not null,
    uid int not null,
    foreign key(uid) references user(id),
    primary key(id)
);

#drop table if exists tag;
create table if not exists tag(
    id int auto_increment not null,
    name varchar(30) not null unique,
    description varchar(80),
    uid int not null,
    foreign key(uid) references user(id),
    primary key(id)
);

#drop table if exists question_tag;
create table if not exists question_tag(
	id int auto_increment,
	question_id int not null,   
    tag_id int not null,
    foreign key(question_id) references question(id),
    foreign key(tag_id) references tag(id),
    primary key(id)
);












