● 오라클 DB 자료형

1. 숫자형
 - NUMBER	 	전체자릿수(38)까지 표현. 표준SQL문의 int형과 동일하지만, 소수점 표현도 가능함
 - NUMBER(3) 	전체자릿수(3) -999~999
 - NUMBER(6,2)	전체자릿수(6)이고, 6칸내에서 소수점 자릿수(2)
 
 
 2. 문자형
  - char		고정형 최대길이	2000바이트
  - varchar2	가변형 최대길이 4000바이트
  - LONG		최대 2GB까지
  
 3. 이진파일
  - blob
  - 주의사항 : 	파일을 데이터베이스에 저장하지 않음
  
  
 4. 날짜형
  - DATE		년월일시분
  - timestamp	기본날짜형을 확장한 자료형 
  
  
 ● Maria DB 자료형
 
 1. 숫자형 : tinyint, SMALLINT. int, bigint, float, double, boolean
 				TINYINT(자리수)
 				SMALLINT(자리수)
 				int(자리수)
 				bigint(자리수)
 				float(전체자리수, 소수점이하자리수)
 				double(전체자리수, 소수점이하자리수)
 				
 2. 문자형 : char, varchar, tinytext, text, mediumtext, longtext
 			char(글자수)		=> 255자까지
 			varchar(글자수)	=> 255자까지
 			tinytext		=> 255자까지
 			text			=> 65535자까지
 			mediumtext		=> 16777215자까지
 			longtext		=> 4294967295자까지
 			
 			
 3. 날짜형 : DATE, datetime, timestamp, time, year