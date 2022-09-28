● [테이블 조인]
- 여러 테이블을 하나의 테이블처럼 사용하는 조인
- 두개이상의 테이블을 결합하여 데이터를 추출하는 기법
- 두테이블의 공통값을 이용하여 컬럼을 조합하는 수단


형식)
	SELECT 칼럼
	FROM 테이블1 join 테이블2
	ON 조건절;				--ANSI (표준) SQL문
	
	
	SELECT 칼럼명
	FROM 테이블1, 테이블2
	ON 조건절;				--Oracle DB SQL문
	
	

	SELECT T1.*, T2.*
	FROM T1 JOIN T2
	ON T1.x=T2.x;			--테이블명.칼럼명
	
	
	SELECT T1.*, T2.*, T3.*
	FROM T1 JOIN T2
	ON T1.x=T2.x JOIN T3	--3개 테이블 조
	ON T1.y=T3.y
	
	
	
	SELECT T1.*, T2.*, T3.*, T4.*
	FROM T1 JOIN T2
	ON T1.x=T2.x JOIN T3	
	ON T1.y=T3.y JOIN T4	--4개 테이블 조인
	ON T1.z=T4.z
	
	
	
● 조건절 : WHERE 조건절, HAVING 조건절, ON 조건절


● 물리적 테이블과 논리적 테이블은 서로 동등한 관계이다
	- 물리적 테이블 : 실제 CREATE TABLE한 테이블
	- 논리적 테이블 : SQL문에 의해 가공된 테이블
	
	
SELECT * FROM tb_student;
SELECT count(*) FROM tb_student;
////////////////////////////////////////

● INNER JOIN 연습

-- 학번을 기준으로 수강테이블과 학생테이블 조인

SELECT tb_sugang.*, tb_student.*
FROM TB_SUGANG JOIN TB_STUDENT 
ON tb_sugang.hakno = tb_student.hakno;

-- 두테이블간의 교집합 조인. inner 생략가능 가장 기본

SELECT tb_sugang.*, tb_student.*
FROM TB_SUGANG JOIN TB_STUDENT 
ON tb_sugang.hakno = tb_student.hakno;

-- 수강신청한 학생들의 학번, 과목코드, 이름, 이메일 조회하시오
SELECT tb_sugang.*, tb_student.uname, tb_student.email
FROM tb_sugang INNER JOIN TB_STUDENT 
ON tb_sugang.hakno = tb_student.hakno;


--과목코드를 기준으로 수강테이블과 과목테이블 조인
SELECT tb_sugang.*, tb_gwamok.gname, tb_gwamok.GHAKJUM 
FROM TB_SUGANG INNER JOIN TB_GWAMOK 
ON tb_sugang.gcode = tb_gwamok.gcode;


--3개 테이블 조인 : 수강테이블 + 학생테이블(이름) + 과목테이(과목명)
SELECT tb_sugang.*, tb_student.uname, tb_gwamok.GNAME 
FROM tb_sugang JOIN TB_STUDENT
ON tb_sugang.hakno = tb_student.hakno JOIN tb_gwamok
ON tb_sugang.gcode = tb_gwamok.gcode;



--테이블명의 alias(별칭)도 가능하다
SELECT SU.*, ST.uname, ST.email
FROM tb_sugang SU JOIN tb_student st
ON SU.hakno=ST.hakno;


SELECT SU.*, GW.gname, Gw.ghakjum
FROM tb_sugang SU JOIN tb_gwamok gw
ON SU.gcode=GW.gcode;


--DROP SEQUENCE sugang_seq;

SELECT SU.*, ST.uname, ST.email, GW.gname, GW.ghakjum
FROM TB_SUGANG SU JOIN tb_student ST 
ON SU.hakno=ST.hakno JOIN tb_gwamok Gw
ON SU.GCODE=gw.gcode;


--조회시 테이블간에 중복되지 않은 칼럼명은 테이블명을 생략할 수 있다
SELECT SU.*, uname, email, gname, ghakjum
FROM TB_SUGANG SU JOIN tb_student ST 
ON SU.hakno=ST.hakno JOIN tb_gwamok Gw
ON SU.GCODE=gw.gcode;

--중복되는 칼럼명은 소속 테이블명을 정확히 명시해야 한다



--------------------------------------------------
문1)수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오

--수강신청한 학생들 목록보기
SELECT * FROM tb_sugang;

--수강테이블 + 학생테이블
SELECT SU.*, uname, address
FROM tb_sugang SU JOIN tb_student ST
ON SU.hakno = ST.hakno;

--'제주'만 조회하기
SELECT SU.*, uname, address
FROM tb_sugang SU JOIN tb_student ST
ON SU.hakno = ST.hakno
WHERE address='제주';

SELECT SU.hakno, SU.gcode, uname, address
FROM tb_sugang SU JOIN tb_student ST
ON SU.hakno = ST.hakno

--가공된 논리적 테이블의 이름을 AA라고 지정하고, 다시 재가공 할 수 있다

SELECT AA.hakno, AA.gcode, AA.uname, AA.address
FROM (
 		SELECT SU.hakno, SU.gcode, uname, address
		FROM tb_sugang SU JOIN tb_student ST
 		ON SU.hakno = ST.hakno
	  ) AA
WHERE aa.address='제주';

-- ORA-00904: "AA"."EMAIL": 부적합한 식별자
-- ST 테이블에서 email칼럼을 가져오지 않았음

SELECT AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
FROM (
 		SELECT SU.hakno, SU.gcode, uname, address
		FROM tb_sugang SU JOIN tb_student ST
 		ON SU.hakno = ST.hakno
	  ) AA
WHERE aa.address='제주';

--AA 별칭 생략가능
SELECT hakno, gcode, uname, address
FROM (
 		SELECT SU.hakno, SU.gcode, uname, address
		FROM tb_sugang SU JOIN tb_student ST
 		ON SU.hakno = ST.hakno
	  ) 
WHERE address='제주';

--AA테이블의 모든 칼럼
SELECT *
FROM (
 		SELECT SU.hakno, SU.gcode, uname, address
		FROM tb_sugang SU JOIN tb_student ST
 		ON SU.hakno = ST.hakno
	  ) 
WHERE address='제주';
/////////////////////////////////

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명
--1)수강테이블 조회 
SELECT * from TB_SUGANG;

--2)수강 신청한 학생들의 명단(학번)
SELECT hakno FROM TB_SUGANG ORDER BY hakno;
SELECT DISTINCT(hakno) FROM tb_sugang ORDER BY hakno;
SELECT hakno FROM tb_sugang GROUP BY hakno;	--GROUP by절은 내부적으로 정렬을 가지고 있음

--3)수강신청한 학번(AA)들의 주소를 학생테이블에서 가져오
SELECT AA.hakno, ST.address
FROM (
		select hakno FROM tb_sugang GROUP BY hakno
	 )AA JOIN tb_student ST
ON AA.hakno=ST.HAKNO;

--4) 3)의 결과를 BB테이블로 만든 후 주소별 그룹후 행 갯수 구하기
SELECT BB.address, count(*) || '명' AS cnt
FROM (
		SELECT AA.hakno, ST.address
		FROM (
				select hakno FROM tb_sugang GROUP BY hakno
   			)AA JOIN tb_student ST
		ON AA.hakno=ST.HAKNO
	 )BB
GROUP BY BB.address;

문3) 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     d001 HTML   2명 
     d002 포토샵   1명
     d003 일러스트  2명
     p001 java	 4명
     p002 jsp	 2명
     p003 python 1명
     
--1) 수강테이블 조회하기
SELECT * FROM tb_sugang ORDER BY gcode;

--2) 수강테이블에서 과목코드가 동일한 행을 그룹
SELECT gcode, count(*)
FROM TB_SUGANG 
GROUP BY gcode;

--3) 2)의 결과를 AA테이블로 생성하고
SELECT AA.gcode, concat(AA.cnt, '명'), GW.gname
FROM (
		SELECT gcode, count(*) AS cnt
		FROM TB_SUGANG 
		GROUP BY gcode
	)	AA JOIN tb_gwamok GW
ON AA.gcode=GW.gcode
ORDER BY AA.gcode;


     
문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     g1001  홍길동  9학점
     g1002  홍길동  6학점
     g1005  진달래  9학점

--1) 수강테이블에서 학번별로 조회
     SELECT hakno, gcode FROM tb_sugang ORDER BY hakno;
    
--2) 수강테이블에 과목코드가 일치하는 학점을 과목테이블에서 가져와서 붙이기
	 SELECT SU.hakno, SU.gcode, GW.ghakjum
     FROM tb_sugang SU JOIN tb_gwamok GW
     ON SU.gcode=GW.gcode;
    
--3) 2)의 결과를 AA테이블로 만들고, 학번별로 그룹화한 후, 학점의 합계를 구하기
    SELECT AA.hakno, sum(AA.ghakjum) AS hap
    from(
    	 SELECT SU.hakno, SU.gcode, GW.ghakjum
    	 FROM tb_sugang SU JOIN tb_gwamok GW
     	 ON SU.gcode=GW.gcode
    	)AA
    GROUP BY AA.hakno

--4) 3)의 결과를 BB테이블로 만들고, 학번을 기준으로 학생테이블에서 이름 가져와서 붙이기    
SELECT BB.hakno, concat(BB.hap, '학점'), ST.uname
from(
		SELECT AA.hakno, sum(AA.ghakjum) AS hap, rownum as rnum
    	from(
    		 SELECT SU.hakno, SU.gcode, GW.ghakjum
    	 	 FROM tb_sugang SU JOIN tb_gwamok GW
     	 	 ON SU.gcode=GW.gcode
    		)AA
    GROUP BY AA.hakno
	)BB JOIN tb_student ST
ON BB.hakno=ST.hakno
where rnum>=4 and rnum<=6;

----------------------------------------------

문4)의 또다른 방법
--1)수강테이블 + 학생테이블 + 과목테이블 3개 테이블 한꺼번에 조인
SELECT SU.hakno, SU.gcode, ST.uname, GW.ghakjum
FROM tb_sugang SU JOIN tb_student ST
ON SU.hakno=ST.hakno JOIN tb_gwamok GW
ON SU.gcode=GW.gcode
ORDER BY SU.hakno;


--2) 1차 그룹(학번), 2차 그룹(이름)으로 그룹화하고, 총학점 구하기
SELECT SU.hakno, ST.uname, sum(GW.ghakjum) || '학점' AS hap
FROM tb_sugang SU JOIN tb_student ST
ON SU.hakno=ST.hakno JOIN tb_gwamok GW
ON SU.gcode=GW.gcode
GROUP BY SU.hakno, ST.uname
ORDER BY SU.hakno;
////////////////////////////////////////////////////

문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  p001  OOP
     g1001  p003  JSP  
     g1001  d001  HTML
     
--1)수강테이블 + 과목테이블 조인
SELECT SU.hakno, SU.gcode, GW.gname
FROM tb_sugang SU JOIN tb_gwamok GW
ON SU.gcode = GW.gcode;

--2)학번 g1001이 신청한 정보 조회하기
SELECT SU.hakno, SU.gcode, GW.gname
FROM tb_sugang SU JOIN tb_gwamok GW
ON SU.gcode = GW.gcode
WHERE SU.hakno='g1001'
ORDER BY SU.gcode;
     
문6)수강신청을 한 학생들의 학번, 이름 조회

--1) 수강신청을 한 학생들의 학번 조회
SELECT hakno FROM tb_sugang;
SELECT DISTINCT(hakno) FROM tb_sugang;
SELECT hakno FROM tb_sugang GROUP BY hakno;


--2)
SELECT hakno, uname
FROM TB_STUDENT 
WHERE hakno='g1001' OR hakno='g1002' OR hakno='g1005' OR hakno='g1006'

SELECT hakno, uname
FROM TB_STUDENT 
WHERE hakno IN ('g1001', 'g1002', 'g1005', 'g1006');

--3)
SELECT hakno, uname
FROM tb_student
WHERE hakno IN (SELECT hakno FROM tb_sugang GROUP BY hakno);

--내가 푼 문제)
SELECT uname, SU.hakno
FROM tb_sugang SU JOIN tb_student ST
ON SU.hakno = ST.hakno
GROUP BY uname, SU.hakno;


문7)수강신청을 하지 않은 학생들의 학번, 이름 조회

SELECT hakno, uname
FROM TB_STUDENT 
WHERE hakno NOT IN (SELECT hakno FROM tb_sugang GROUP BY hakno);

------------------------------------------------------
COMMIT;