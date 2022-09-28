● [오라클 함수]

1.문자열 함수

-- 가상테이블 : dual

1.문자열 함수

SELECT LOWER('Hello World') FROM dual; 			--전부 소문자로 변환  
SELECT UPPER('Hello World') FROM dual; 			--전부 대문자로 변환 
SELECT LENGTH('Hello World') FROM dual; 		--글자갯
SELECT SUBSTR('Hello World', 1, 5) FROM dual; 	--문자열 자르기 (첫번째 글자부터 5개)

SELECT INSTR('HelloWorld', 'W')FROM dual;
SELECT LPAD('SKY', 5, '*') from dual;
SELECT RPAD('SKY', 5, '*') from dual;
SELECT replace('happy', 'p', 'k') FROM dual;

SELECT  chr(65) FROM dual;	--ASCII 문자 변환  'A'
SELECT  chr(97) FROM dual;
SELECT  chr(98) FROM dual;	--'a'
SELECT  chr(75) FROM dual;

--문자열 연결하기
SELECT CONCAT('로미오', '줄리엣') FROM dual;	--로미오줄리엣
SELECT CONCAT(uname, '의 평균은'),CONCAT(aver, '입니다') FROM sungjuk;

SELECT * FROM sungjuk;

--update sungjuk
--set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

-- || 결합연산자
SELECT uname || '의 평균은' || aver || '입니다' FROM sungjuk;
SELECT uname || '의 평균은' || aver || '입니다' AS str FROM SUNGJUK;
//////////////////////////////////////////////////////////////////

2. 숫자 관렴 함수
SELECT ABS(-7) FROM dual;			--절대값
SELECT MOD(5,3) FROM dual;			--나머지 연산자
SELECT ceil(12.4) FROM dual;		--13 올림 
SELECT TRUNC(13.56, 1) FROM dual;		--13.5 내림 

SELECT avg(kor) FROM sungjuk;			 --65
SELECT ceil(avg(kor)) FROM SUNGJUK;		 --65
SELECT TRUNC(AVG(kor),2) FROM sungjuk;	 --65
SELECT ROUND(AVG(kor),2) FROM sungjuk;	 --65

--to_number('숫자형태의 문자열')
SELECT to_number('123')+1 FROM dual;	--124
SELECT '100'+1 FROM dual;				--101 내부적으로 to_number()가 호출됨 

/////////////////////////////////////////////////////////////////////

3.날짜 관련 함수

SELECT SYSDATE FROM dual;	--시스템의 현재 날짜와 시간 정보를 리턴하는 함수

--sysdate에서 년월일 추출하기 
SELECT EXTRACT(YEAR FROM sysdate) FROM dual;	--2022
SELECT EXTRACT(MONTH FROM sysdate) FROM dual;	--8
SELECT EXTRACT(day FROM sysdate) FROM dual;		--23

--날짜데이터의 연산 
SELECT SYSDATE+100 FROM dual;	--오늘날짜+100일 
SELECT SYSDATE-100 FROM dual;	--오늘날짜-100일 


--두개의 날데이터에서 개월 수 계산
SELECT MONTHS_BETWEEN('2022-08-23', '2022-05-25') FROM dual;	--2.93
SELECT MONTHS_BETWEEN('2022-08-23', '2022-12-25') FROM dual;	--4.06

--문자열을 날짜형으로 변환 
SELECT TO_DATE('2022-10-25') FROM dual;
SELECT to_date('2022-10-25') - TO_DATE('2022-10-30')  FROM dual; -- -5


●nvl() 함수 - null값을 다른값으로 바꿈

문제) 주소가 'Incheo'인행의 국어점수 최대값, 인원수를 조회하시오 
SELECT max(kor), count(*)
FROM   SUNGJUK
WHERE addr='Incheon';		--최대값(null), 인원수(0)

SELECT count(*)+1			--0+1
FROM SUNGJUK
WHERE addr='Incheon';

SELECT max(kor)+1			--NULL+1 -> null값과 연산할 수 없
FROM SUNGJUK 
WHERE addr='Incheon';

SELECT NVL(max(kor), 0)+1 AS max_kor  -- NULL값이면 0으로 대체
FROM sungjuk
WHERE addr='Incheon';

SELECT nvl(max(kor), 0)+1 AS max_kor
FROM SUNGJUK 
WHERE addr='Incheon';

///////////////////////////////////////////////////////

● 모조 칼럼
 - rownum : 행번호
 - rowid  : 행의 주소값
 
SELECT sno, uname, addr, rownum, ROWID 
FROM SUNGJUK;

SELECT sno, uname, addr, rownum
FROM SUNGJUK
WHERE rownum>=1 AND rownum<=5;

SELECT sno, uname, addr, rownum
FROM SUNGJUK
WHERE ADDR='Seoul';

SELECT sno, uname, addr, rownum
FROM SUNGJUK
ORDER BY uname;



SELECT * FROM sungjuk;


