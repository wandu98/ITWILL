CREATE TABLE sungjuk1(
	uname varchar(20)
	,kor int
	,eng int
	,mat int
	,aver int
);


SELECT * FROM sungjuk;

DELETE TABLE sungjuk1;

SELECT * FROM ALL_USERS 

////////////////
파일-> 데이터베이스계층->데이터베이스파일
저장경로 java202207 - DATABASE -20220819_01sql기초.SQL

● [수업 내용]
- 테이블 생성, 삭제
- CREATE, READ, Update, DELETE

////////////////////////////////////



[성적]
이름		국어		영어		수학		총점		평균
-------------------------------------------
홍길동	100		90		80		
진달래	85		75		60

CREATE TABLE 테이블(
	 칼럼명1	자료형  제약조건
	,칼럼명2	자료형  제약조건
	,칼럼명3	자료형  제약조건
	
);

--sungjuk테이블 생성
CREATE TABLE SUNGJUK(
	uname varchar(20)	--영문자 20글자 이내까지
   ,kor	  int			--정수
   ,eng	  int
   ,mat	  int
   ,tot   int
   ,aver  int
);


-- 칼럼의 순서는 의미가 없다
-- 실행 단축키 Ctrl + Enter

[테이블 삭제]
-- 형식) drop table 테이블명;
-- 주의) 테이블을 삭제하면 모든 데이터도 같이 삭제된다

--sungjuk 테이블 삭제
DROP TABLE sungjuk;

--SELECT * FROM SUNGJUK

[테이블 수정]
-- 형식) alter table 테이블명 수정사항


[관계형 DB에서 테이블의 핵심기능]
 - C  CREATE 생성  -> insert
 - R  READ   조회  -> select
 - U  UPDATE 수정  -> update
 - D  DELETE 삭제  -> DELETE
 
 [문자열 데이터]
 - 데이터베이스에서 문자열 데이터는 '   ' 로 감싼다

////////////////////////////////////////

[sungjuk 테이블 CRUD 작업]

1. 행추가
형식) insert into 테이블명(칼럼명1, 칼럼명2, 칼럼명3, ~~~)
	 valuse	(값1, 값2, 값3, ~~~);

insert into sungjuk(uname, kor, eng, mat)
values	('홍길동', 100, 90, 80);

insert into sungjuk(uname, kor, eng, mat)
values	('진달래', 85, 75, 60);


2. 조회 및 검색
형식) select 칼럼명1, 칼럼명2, 칼럼명3, ~~~
	 from 테이블명;

select uname, kor, eng, mat, tot, aver from sungjuk;

3. 행수정
형식) UPDATE 테이블명 SET 칼럼명1=값1, 칼럼명2=값2, 칼럼명3=값3, ~~~

UPDATE sungjuk SET tot=kor+eng+mat, aver=(kor+eng+mat)/3;

4. 행삭제
형식) DELETE FROM 테이블;

DELETE FROM SUNGJUK;

파일-> 데이터베이스계층->데이터베이스파일
저장경로 java202207 - DATABASE -20220819_02sql기초.SQL

///////////////////////////////////////////////////
[sungjuk 테이블 삭제]
DROP TABLE SUNGJUK;


[sungjuk 테이블 생성]
CREATE TABLE sungjuk(
	uname varchar(50) NOT NULL		--빈값을 허용하지 않음.
									--영문자 50글자 이내에서 입력
									--한글 16글자 이내 입

	,kor  int		 NOT NULL
	,eng  int		 NOT NULL
	,mat  int		 NOT NULL
	,tot  int		 NULL			--빈값 허
	,aver int						--NULL 생략가능
);

SELECT * FROM SUNGJUK

[샘플 데이터 행추가]

INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('홍길동', 70, 85, 100);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('무궁화', 30, 30, 40);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('진달래', 90, 90, 20);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('개나리', 100, 60, 30);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('라일락', 30, 80, 40);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('봉선화', 80, 80, 20);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('대한민국', 10, 65, 35);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('해바라기', 30, 80, 40);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('나팔꽃', 30, 80, 20);
INSERT INTO sungjuk(uname,kor,eng,mat) VALUES ('대한민국', 100, 100, 100);
////////////////////////////////////////////////////////////////////////

[전체 레코드 조회]
SELECT uname, kor, eng, mat, tot, aver FROM sungjuk;


[전체 행갯수 조회]
SELECT COUNT(*) FROM sungjuk;


[SELECT 조회 및 검색]
SELECT kor, eng, mat FROM sungjuk;
SELECT tot, aver FROM sungjuk;
SELECT * FROM  sungjuk;				--전체 모든 칼럼 조회


[as] --칼럼명을 임시 변경
SELECT kor AS 국어, eng AS 영어, mat AS 수학
FROM sungjuk;

--as는 생략가능 
SELECT kor korea, eng english, mat mate
FROM sungjuk;

SELECT uname AS 이름, kor AS 국어, eng AS 영어, mat AS 수학, tot 총점, aver 평균
FROM sungjuk;	-- 임시 한글 칼럼명은 일시적으로 분석해야 하는 경우만 추천!!

[count 함수] - 행 갯수 조회
SELECT COUNT(uname) FROM sungjuk;
SELECT count(kor) FROM sungjuk;
SELECT COUNT(eng) AS cnt_eng FROM sungjuk;
SELECT count(mat) 수학갯수 FROM sungjuk; --임시 칼럼명으로 한글 가

SELECT COUNT(tot) FROM sungjuk; --0
SELECT count(aver) FROM sungjuk; --0

--sungjuk 테이블의 전채 행의 갯수
SELECT COUNT(*) FROM SUNGJUK;
SELECT COUNT(*) AS 전체행갯수  FROM sungjuk;
SELECT COUNT(*) 전체행갯수 FROM sungjuk;
///////////////////////////

[명령어 완료와 취소]
-INSERT, UPDATE, delete
-COMMIT		: 명령어 완료
-ROLLBACK	: 명령어 취소

DELETE FROM SUNGJUK; --전체 레코드 삭
SELECT  * FROM sungjuk;

ROLLBACK;	--명령어 취소
COMMIT;		--명령어 완료


파일-> 데이터베이스계층->데이터베이스파일
저장경로 java202207 - DATABASE -20220819_03where.SQL

[WHERE 조건절]
- 조건을 만족하는 행들에 대해서
- 조건에 만족하는 레코드만 대상으로 조회(select), 수정(update), 삭제(delete)하기 위해서

SELECT * FROM sungjuk;

--문1) 국어점수가 50점이상 행을 조회하시오
SELECT uname, kor
FROM sungjuk
WHERE kor>=50;

--문2)영어 점수가 50점미만 행을 조회하시오
SELECT uname, eng
FROM SUNGJUK
WHERE eng<50;

--문3)이름이 대한민국 아닌 행을 조회하시오
SELECT uname, kor, eng, mat
FROM SUNGJUK
WHERE uname ='대한민국'; --좌우가 서로 같다

--문4)이름이 대한민국 아닌 행을 조회하시오
SELECT uname, kor, eng, mat
FROM SUNGJUK
WHERE uname <>'대한민국'; --좌우가 서로 같지 않다

--문5)국어,영어,수학 세과목의 점수가 모두 90이상 행을 조회하시오
SELECT uname, kor, eng, mat
FROM SUNGJUK
WHERE kor>=90 AND eng>=90 AND mat>=90;

--문6)국어,영어,수학 중에서 한과목이라도 40미만 행을 조회하시오
SELECT uname, kor, eng, mat
FROM SUNGJUK
WHERE kor<40 OR eng<40 OR mat<40;

--문7)국어점수가 80점 ~ 89점 사이 행을 조회하시오
SELECT uname, kor
FROM SUNGJUK
WHERE kor>=80 AND kor<90;

--문8) 이름이 무궁화, 봉선화를 조회하시오
SELECT uname
FROM SUNGJUK
WHERE uname = '무궁화' OR  uname = '봉선화';

////////////////////////////////////////////

[BETWEEN A AND B] 연산자 -A부터 B까지
--국어점수가 80 ~ 89점 사이 사이 행을 조회하시오
SELECT uname, kor
FROM SUNGJUK
WHERE kor BETWEEN 80 AND 89;

//////////////////////////////////////////////

[in] 연산자 - 목록에서 찾기 
-- 이름이 '무궁화','봉선화'를 조회하시
SELECT uname
FROM SUNGJUK
WHERE uname IN ('무궁화', '봉선화');

-- 국어점수 10, 30, 50점을 조회하시오
SELECT uname, kor
FROM sungjuk 
WHERE kor IN (10, 30, 50);

//////////////////////////////////

--문9)국, 영, 수 모두 100점 아닌 행을 조회하시오
SELECT uname, kor, eng, mat
FROM sungjuk
WHERE NOT (kor=100 AND eng=100 AND mat=100);

//////////////////////////////////////

[LIKE 연산자]
- 문자열 데이터에서 비슷한 유형을 검색할 때
- % 글자갯수와 상관없음
- _ 글자갯수까지 일치해야 함 

SELECT uname
FROM SUNGJUK
WHERE uname='대한민국';

--문1)이름에서 홍으로 시작하는 이름을 조회하시오
SELECT uname
FROM sungjuk
WHERE uname LIKE '홍%';

--문2) 이름에서 화로 끝나는 이름을 조회하시오
SELECT uname
FROM   sungjuk
WHERE  uname LIKE '%화';

--문3) 이름에 '나'글자 있는 이름을 조회하시오
SELECT uname
FROM sungjuk
WHERE uname LIKE '%나%';

--문4) 두글자 이름에서 화로 끝나느 이름을 조회하시오
SELECT uname
FROM sungjuk
WHERE uname LIKE '_화';
--문5) 이름 세글자 중에서 가운데 글자가 나 있는 행을 조회하시오

SELECT uname
FROM SUNGJUK
WHERE LIKE '_나_';

--문6) 제목+내용을 선택하고 검색어가 '파스파'일때
WHERE subject LIKE '%파스타%' OR content LIKE '%파스타%'

--문7) 국어 점수가 50점이상인 행에 대해서 총점(tot)과 평균(aver)를 구하시오

UPDATE sungjuk
SET tot=kor+eng+mat, aver=(kor+eng+mat)/3
WHERE kor>=50;

SELECT * FROM sungjuk;

[NULL] - 비어 있는 값
-- 총점에 null이 있는 행의 갯수를 구하시오
SELECT count(tot) FROM sungjuk; --NULL값은 카운트 되지 않

--총점에 null이 있는 행의 갯수를 구하시오
SELECT COUNT(*)  FROM sungjuk WHERE tot=NULL;	 --null값 확인 못함. 0

SELECT COUNT(*)  FROM sungjuk WHERE tot IS NULL; --null값 확인해야 하는 경우

--평균에 비어있지 않은 행의 갯수를 구하시오 (null이 아닌 값)
SELECT COUNT(*) FROM sungjuk WHERE aver IS NOT NULL;

--문8) 비어있는 총점과 평균을 모두 구하시오
UPDATE sungjuk
SET tot=kor+eng+mat, aver=(kor+eng+mat)/3
WHERE tot IS NULL OR aver IS NULL;

SELECT * FROM sungjuk;

COMMIT;

