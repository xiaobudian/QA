USE `qa`;
DROP procedure IF EXISTS `proc_question_tagged`;

DELIMITER $$
USE `qa`$$
CREATE PROCEDURE `proc_question_tagged` (
  in firstRow int, 
  in listRows int, 
  in tag_name varchar(30))
BEGIN

  set @tag_id = (select id from tag where name = tag_name limit 1);
  select qu.* ,u.username
  from (
       select q.id,q.title,q.votes,q.answers,q.views,q.ct,q.user_id
       from question q
           JOIN question_tags qt on q.id = qt.question_id
           join tag t on t.id = qt.tag_id
       WHERE t.id = @tag_id
       ORDER BY q.votes DESC 
     )qu
    JOIN auth_user u on u.id = qu.user_id;

END$$

DELIMITER ;
