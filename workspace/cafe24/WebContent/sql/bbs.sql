--Maria DB 기반

--bbs.sql

--답변형 게시판 테이블 생성
CREATE TABLE tb_bbs (
       bbsno        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
       ,wname       VARCHAR(20)   NOT NULL
       ,subject     VARCHAR(100)  NOT NULL
       ,content     TEXT          NOT NULL
       ,grpno       TINYINT       NOT NULL
       ,indent      TINYINT       DEFAULT 0    NOT NULL
	   ,ansnum      TINYINT       DEFAULT 0    NOT NULL
       ,regdt       DATETIME      NOT NULL
       ,passwd      VARCHAR(15)   NOT NULL
       ,readcnt     INT           DEFAULT 0    NOT NULL
       ,ip          VARCHAR(15)   NOT NULL
  );
  
 
 --행추가 테스트
insert into member(wname,subject,content,grpno,passwd,ip,regdt)
values('무궁화','대한민국','오필승코리아',(select ifnull(max(bbsno),0)+1 from tb_bbs as TB),'1234','127.0.0.1',now())