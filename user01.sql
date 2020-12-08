use user01;

insert into test values(2, 'name', now());

insert into test values(null, 'name2', now());

select * from test;

CREATE TABLE `test` (
  `num` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- CLOB -> TEXT

-- Notice Table
CREATE TABLE `notice` (
  `num` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `writer` varchar(45) NOT NULL,
  `contents` longtext,
  `regDate` date DEFAULT NULL,
  `hit` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 파일의 정보를 저장하는 table
CREATE TABLE `noticeFiles` (
  `fnum` int NOT NULL AUTO_INCREMENT,
  `num` int DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `oriName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fnum`),
  KEY `num_idx` (`num`),
  CONSTRAINT `num` FOREIGN KEY (`num`) REFERENCES `notice` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- qna 테이블
CREATE TABLE `qna` (
  `num` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `writer` varchar(45) NOT NULL,
  `contents` longtext NOT NULL,
  `regDate` varchar(45) DEFAULT NULL,
  `hit` int DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `step` int DEFAULT NULL,
  `depth` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- qna 파일의 정보를 저장하는 table
CREATE TABLE `qnaFiles` (
  `fnum` int NOT NULL,
  `num` int DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `oriName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fnum`),
  KEY `num_idx` (`num`),
  CONSTRAINT `qna_fk_num` FOREIGN KEY (`num`) REFERENCES `qna` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from qnaFiles;
insert into qnaFiles(num, fileName, oriName) values(1, 'fileName1', 'oriName1');

select * from notice;

insert into notice values(1, 'title','writer','contents', now(), 0);
insert into notice values(null, 'title2','writer2','contents2', now(), 0);
insert into notice values(null, 'title3','writer3','contents3', now(), 0);
insert into notice (title, writer, contents, regDate, hit) values('title4', 'writer4', 'contents4', now(), 0);

update notice set title='up title', writer='up writer', contents='up contents' where num = 1;
select * from notice where num = 1;
delete from notice where num = 4;

select * from notice order by num desc limit 10, 10;

select count(num) from notice;

-- member 테이블
CREATE TABLE `member` (
  `id` varchar(45) NOT NULL,
  `pw` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- memberFile 테이블
CREATE TABLE `memberFile` (
  `fnum` int NOT NULL AUTO_INCREMENT,
  `id` varchar(45) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `oriName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fnum`),
  KEY `mf_id_fk_idx` (`id`),
  CONSTRAINT `mf_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- member 파일의 정보 insert
insert into noticeFiles(num, fileName, oriName) values(105, 'fileName', 'oriName');
select * from noticeFiles;

-- join
select N.*, NF.*
from notice N left join noticeFiles NF
on N.num = NF.num
where N.num = 9;

select * from qna;
insert into qna (title, writer, contents, regDate, hit, ref, step, depth) values('title1', 'writer1', 'contents1', now(), 0, 0, 0, 0);
commit;

select * from member;
insert into member (id, pw, name, age, email) values('id1', 'pw1', 'name1', '25', 'asd@gmail.com');

select * from memberFile;
insert into memberFile (id, fileName, oriName) values('id1', 'fileName', 'oriName') 
