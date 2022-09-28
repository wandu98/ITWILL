● [CSV 파일]
- 모든 데이터가 , 로 구분되어 있는 파일

● [CSV 파일을 데이터베이스로 가져오기]
- 공공데이터포털 https://DATA.GO.kr/ 활용


문) 도로명 우편번호 테이블 구축하기

--1) zipdoro.csv준비 (258267)

--2) zipdoro.csv 내용을 저장하는 zipdoro테이블 생성
CREATE TABLE zipdoro (
	zipno	char(5)			--우편번
	,zipaddress varchar(5)	--주소
);

COMMIT;
DROP TABLE zipdoro;			--테이블 삭제


--3) 가져오기와 내보내기
-zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
-zipdoro 테이블 우클릭 -> export	 (내보내기)

SELECT COUNT(*) FROM zipdoro;

create table zipdoro (
    zipno      char(5)        --우편번호
   ,zipaddress varchar(1000)  --주소
);
-------------------------------------------------------

서울특별시 강남구로 시작되는 우편번호가 몇개인지 조회하시오
SELECT count(zipno)
FROM zipdoro
WHERE zipaddress LIKE '서울특별시 강남구%';

///////////////////////////////////////////////////////

문2) 한국교원대학교_초중등학교위치.csv를 변환하시오 

-- 비어있는 값(null)을 찾으시
create table school; (
        school      varchar2(10)  
       ,school      varchar2(10)
       ,school      varchar2(10)
       ,school      varchar2(10)
       ,school      varchar2(10)
       ,school      varchar2(10)
       ,school      varchar2(10)
       ,school      varchar2(10)
 