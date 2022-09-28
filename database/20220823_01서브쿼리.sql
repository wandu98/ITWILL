[서브쿼리]
- SQL문속 또 다른 SQL문
- 테이블내에서 다시 한번 쿼리문에 의해 레코드 조회 및 검색

--국어점수의 평균을 조회하시오

SELECT kor FROM sungjuk;
SELECT avg(kor) FROM sungjuk;
SELECT ROUND(avg(kor,0) FROM sungjuk;	--66
SELECT ROUND(AVG(kor),0) AS avg_kor FROM sungjuk;

문1) 국어점수 평균(66)보다 잘한 국어 점수를 조회하시오

SELECT uname, kor FROM sungjuk WHERE kor>=66;

SELECT uname, kor FROM sungjuk WHERE kor>=(SELECT ROUND(avg(kor),0) FROM sungjuk);

문2) 서울지역의 국어점수 평균보다 잘한 지역, 이름, 국어점수를 조회하시오

--서울지역의 국어점수 평균을 구하시오
SELECT avg(kor) FROM SUNGJUK WHERE addr='Seoul';
SELECT ROUND(avg(kor),0) FROM SUNGJUK WHERE addr='Seoul';	--73

SELECT addr, uname, kor
FROM sungjuk
WHERE kor>=(SELECT ROUND(avg(kor),0) FROM SUNGJUK WHERE addr='Seoul');


문3) 서울지역의 국어점수 평균보다 잘한 국어점수가 다른 지역에 있는지 조회하시오
SELECT addr, uname, kor
FROM SUNGJUK 
WHERE kor>=(SELECT ROUND(avg(kor),0) FROM SUNGJUK WHERE addr='Seoul');
AND addr <> 'Seoul'; --addr != 'Seoul' 동일

문4) 국어점수의 최소값보다 이하 점수가 수학 또는 영어점수에 있는지 조회하시오
SELECT  min(kor) FROM sungjuk; --20

SELECT UNAME, KOR, ENG, MAT 
FROM SUNGJUK 
WHERE mat<=(SELECT  min(kor) FROM sungjuk) 
	 OR 
	 eng<=(SELECT  min(kor) FROM sungjuk);
