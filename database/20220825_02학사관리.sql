DROP TABLE tb;

1. 테이블 생성
--------------------------- 학생테이블
CREATE  TABLE tb_student(
	hakno 	char(5) 	NOT NULL		--학번
   ,uname 	varchar(20)	NOT NULL		--이름
   ,email 	varchar(20) UNIQUE			--이메일
   ,address varchar(20) NOT NULL		--주소
   ,phone 	varchar(20)					--전화번호
   ,regdt 	DATE 		DEFAULT sysdate	--등록
   ,PRIMARY KEY(hakno)					--기본키
   );
  
  -------------------------- 과목테이블
CREATE  TABLE tb_gwamok(
	gcode 	char(4) 	NOT NULL		--과목코드 (P:프로그램교과목, D:디자인교과목)
   ,gname 	varchar(20)	NOT NULL		--과목이름
   ,ghakjum number(2)   DEFAULT 1		--학점
   ,regdt   DATE		DEFAULT sysdate	--등록일
   ,PRIMARY KEY(gcode)					--기본키
   );
  
  ------------------------- 수강테이블
 CREATE TABLE tb_sugang(
 	sno 	number(3) NOT NULL		--일련번호
   ,hakno 	char(5)	  NOT NULL		--학번
   ,gcode   char(4)   NOT NULL		--과목코드
   ,PRIMARY KEY(sno)				--기본키
   );
 

  
2. 수강테이블 시퀀스 생성
CREATE SEQUENCE sugang_seq;

3. 행추가

insert into tb_student(hakno,uname,address,phone,email)
values('g1001','홍길동','서울','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','홍길동','제주','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','개나리','서울','554-9632','77@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1004','홍길동','부산','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','진달래','서울','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','개나리','제주','777-1000','66@naver.com');

----------------------------------------------------------------

insert into tb_gwamok(gcode,gname,ghakjum) values('p001','JAVA',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p002','Oracle',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p003','JSP',2);
insert into tb_gwamok(gcode,gname,ghakjum) values('d001','HTML',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('d002','포토샵',5);
insert into tb_gwamok(gcode,gname,ghakjum) values('d003','일러스트',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('d004','CSS',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('p004','Python',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p005','AJAX',2);
---------------------------------------------------------------------

insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p004');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1006','p001');

COMMIT;

-- tb_student 테이블 전체 레코드 갯수
SELECT count(*) FROM tb_student;	--6

-- tb_gwamok 테이블 전체 레코드 갯수
SELECT count(*) FROM tb_gwamok;		--9

-- tb_sugang 테이블 전체 레코드 갯수
SELECT count(*) FROM tb_sugang;		--13

////////////////////////////////////////////

● [참조 무결성 제약조건]
- FOREIGN KEY 제약조건
- 동일한 테이블 또는 다른 테이블에서 기본키 또는 고유키를 참조하는 제약 조건
- ON DELETE CASCADE 부모테이블의 행이 삭제되는 경우 자식테이블의 종속행을 삭제
- ON DELETE SET NULL 부모테이블의 행이 삭제되는 경우 종속 왜리키 값을 NULL로 변환
- 부모: PRIMARY KEY  기본키  <---> 자식 : FOREIGN KEY 외래키

예) 수강테이블 제약조건
CREATE TABLE tb_sugang(
	sno		NUMBER(3)	NOT NULL
   ,hakno	char(5)		NOT NULL
   ,gcode	char(4)		NOT NULL
   ,PRIMARY KEY(sno)									--sno칼럼 기본
   ,FOREIGN KEY(hakno)	REFERENCES tb_student(hakno)	--hakno칼럼은 부모테이블(학생)의 hakno 참조
   ,FOREIGN key(gcode)	REFERENCES tb_gwamok(gcode)		--gcode칼럼은 부모테이블(과목)의 gcode 참조
    ON UPDATE CASCADE									--부모테이블의 값이 수정되면 자식테이블 값도 같이 수정
    ON DELETE NO ACTION									--부모테이블의 행이 삭제되더라도 자식테이블은 삭제되지 않음
  );

 //////////////////////////////////////////////////////////////

문1)학생테이블에서 지역별 인원수를 인원수 순으로 조회하시오

SELECT address FROM tb_student;
SELECT DISTINCT(address) FROM tb_student;
SELECT address, count(*) FROM tb_student GROUP BY address;
SELECT address, count(*) FROM tb_student GROUP BY address ORDER BY count(*) DESC;

-- 내 풀이

SELECT address, count(*)
FROM tb_student
GROUP BY address
ORDER BY count(*);
	 
문2)학생테이블에서 동명이인이 각 몇명인지 조회하시오

SELECT uname FROM tb_student;
SELECT DISTINCT(uname) FROM tb_student;
SELECT uname, count(*) FROM tb_student GROUP BY uname;
SELECT uname, count(*) FROM tb_student GROUP BY uname ORDER BY count(*);

--내 풀이
 SELECT uname, count(*)
 FROM TB_STUDENT 
 GROUP BY uname
 HAVING count(*)>1;

문3)학생테이블의 학번, 이름, 주소를 조회하시오	(주소는 영문으로 출력)
SELECT hakno, uname, address, CASE WHEN address='서울' THEN 'SEOUL'
								   WHEN address='제주' THEN 'JEJU'
								   WHEN address='부산' THEN 'BUSAN'
							  END AS juso
FROM tb_student;

--내풀이 (미완)
SELECT hakno, uname, to_char(address,'language=english')
FROM tb_student;

문4)학생테이블에서 주소별 인원수가 3명미만 행을 조회하시오

SELECT address, count(*)
FROM tb_student
GROUP BY address
HAVING count(*)<3;

 
문5)과목테이블에서 프로그램 교과목만 조회하시오
SELECT *
FROM TB_GWAMOK
WHERE gcode LIKE 'p%';  --프로그램 교과목

SELECT *
FROM TB_GWAMOK 
WHERE gcode LIKE 'd%';	--디자인 교과목 

문6)과목테이블에서 디자인 교과목중에서 3학점만 조회하시오

SELECT * FROM tb_gwamok WHERE gcode LIKE 'd%' AND ghakjum=3;

문7)과목테이블에서 프로그램 교과목의 학점 평균보다 낮은 교과목을 조회하시오
 
--프로그램 교과목의 학점 평균 구하
SELECT AVG(ghakjum) 
FROM tb_gwamok
WHERE gcode LIKE 'p%';		-- 2.6

--프로그램 교과목의 학점 평균보다 낮은 교과목을 조회
SELECT gcode, ghakjum
FROM TB_GWAMOK 
WHERE ghakjum<(SELECT AVG(ghakjum) FROM tb_gwamok WHERE gcode LIKE 'p%');


--프로그램 교과목의 학점 평균보다 낮은 프로그램 교과목을 조회
SELECT gcode, ghakjum
FROM TB_GWAMOK 
WHERE ghakjum<(SELECT AVG(ghakjum) FROM tb_gwamok WHERE gcode LIKE 'p%')
AND gcode LIKE 'p%';





