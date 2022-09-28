SELECT COUNT(*) FROM TB_GWAMOK;  --9
SELECT COUNT(*) FROM TB_SUGANG;  --14
SELECT COUNT(*) FROM TB_STUDENT; --6

문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
    (학번, 이름, 과목코드)

    --디자인교과목의 학점 조회하기
    SELECT * FROM TB_GWAMOK WHERE gcode LIKE 'd%' ORDER BY GHAKJUM DESC;

   --1)디자인 교과목중에서 학점이 제일 많은 학점 조회하기
    SELECT max(GHAKJUM) --5
    FROM TB_GWAMOK 
    WHERE gcode LIKE 'd%'
    
   --2) 1)결과에서 나온 학점(5)과 동일한 학점을 갖고 있는 행에서 과목코드 선택
   -- 즉, 디자인 교과목중에서 학점이 제일 많은 과목코드(단 중복된 학점이 없다는 가정하에)
   SELECT gcode
   FROM TB_GWAMOK 
   WHERE GHAKJUM=(5)
   AND gcode LIKE 'd%'; --doo2
   
   SELECT gcode
   FROM TB_GWAMOK
   WHERE GHAKJUM = (SELECT max(GHAKJUM) FROM TB_GWAMOK WHERE gcode LIKE 'd%')
   AND gcode LIKE 'd%'; --d002
  
   --3 2)에서 나온 과목코드(d002)를 수강신청한 명단을 조회
   
   SELECT gcode, hakno FROM TB_SUGANG WHERE gcode='d002';
   
   SELECT gcode, hakno 
   FROM TB_SUGANG 
   WHERE gcode= ( SELECT gcode
   				  FROM TB_GWAMOK
  				  WHERE GHAKJUM = (SELECT max(GHAKJUM) FROM TB_GWAMOK WHERE gcode LIKE 'd%')
				  AND gcode LIKE 'd%'
  		 		);
  		 	
  --4) 3)의 결과를 AA테이블로 만든 후, 학생테이블을 조인해서 이름 가져오기
  	SELECT aa.gcode, AA.hakno, ST.uname
    FROM ( SELECT gcode, hakno 
   		   FROM TB_SUGANG 
  		   WHERE gcode= ( SELECT gcode
   				  		  FROM TB_GWAMOK
		  				  WHERE GHAKJUM = (SELECT max(GHAKJUM) FROM TB_GWAMOK WHERE gcode LIKE 'd%')
						  AND gcode LIKE 'd%'
		  		 		)
    	)AA JOIN TB_STUDENT ST
	ON AA.hakno=ST.hakno;
//////////////////////////////////////////////////////////////

문2) 학번별 수강신청한 총학점을 구하고 학번별 정렬해서 줄번호 4~6행 조회하시오
    (단, 수강신청하지 않은 학생의 총학점도 0으로 표시)
--학생테이블 조회하기
 SELECT hakno, uname FROM TB_STUDENT ORDER BY hakno; 

--1) 수강신청한 과목의 학점 가져오기
SELECT SU.hakno, SU.GCODE, GW.GHAKJUM
FROM TB_SUGANG SU JOIN TB_GWAMOK GW
ON SU.gcode=GW.gcode;

--2)학번별로 총학점 구하기
SELECT SU.hakno, sum(GW.ghakjum) AS 총학점
FROM TB_SUGANG SU JOIN TB_GWAMOK GW
ON SU.gcode=GW.gcode
GROUP BY SU.hakno;

--3) 수강신청하지 않은 학생들도 가져올 수 있도록 학생테이블 left join 하고,
	--2)결과 (AA테이블)를 붙임
SELECT ST.hakno, ST.UNAME, AA.hakno, AA.총학점
FROM TB_STUDENT ST LEFT JOIN (
								SELECT SU.hakno, sum(GW.ghakjum) AS 총학점
								FROM TB_SUGANG SU JOIN TB_GWAMOK GW
								ON SU.gcode=GW.gcode
								GROUP BY SU.hakno
							 ) AA
ON ST.hakno=AA.hakno;

--4)총학점이 null이면 0으로 바꾸고, 학번순으로 조회하기
SELECT ST.hakno, ST.UNAME, nvl(AA.총학점, 0)
FROM TB_STUDENT ST LEFT JOIN (
								SELECT SU.hakno, sum(GW.ghakjum) AS 총학점
								FROM TB_SUGANG SU JOIN TB_GWAMOK GW
								ON SU.gcode=GW.gcode
								GROUP BY SU.hakno
							 ) AA
ON ST.hakno=AA.hakno
ORDER BY ST.hakno;


--5) 줄번호 추가
SELECT ST.hakno, ST.UNAME, nvl(AA.총학점, 0), rownum
FROM TB_STUDENT ST LEFT JOIN (
								SELECT SU.hakno, sum(GW.ghakjum) AS 총학점
								FROM TB_SUGANG SU JOIN TB_GWAMOK GW
								ON SU.gcode=GW.gcode
								GROUP BY SU.hakno
							 ) AA
ON ST.hakno=AA.hakno
ORDER BY ST.hakno;

--6) 5의 결과를 셀프조인하고 나서, 줄번호 추가하기
SELECT BB.hakno, BB.uname, BB.총학점2, rownum AS rnum
FROM(
	  SELECT ST.hakno, ST.UNAME, nvl(AA.총학점, 0) AS 총학점2
	  FROM TB_STUDENT ST LEFT JOIN (
									SELECT SU.hakno, sum(GW.ghakjum) AS 총학점
									FROM TB_SUGANG SU JOIN TB_GWAMOK GW
									ON SU.gcode=GW.gcode
									GROUP BY SU.hakno
								 ) AA
	 ON ST.hakno=AA.hakno
	 ORDER BY ST.hakno
	) BB
	
	
--7) 6의 결과를 셀프조인(CC테이블)하고 줄번호(rnum) 4~6 조회하기
SELECT CC.hakno, CC.총학점2, rnum
FROM (
		SELECT BB.hakno, BB.uname, BB.총학점2, rownum AS rnum
		FROM(
	 		  SELECT ST.hakno, ST.UNAME, nvl(AA.총학점, 0) AS 총학점2
			  FROM TB_STUDENT ST LEFT JOIN (
			 								SELECT SU.hakno, sum(GW.ghakjum) AS 총학점
											FROM TB_SUGANG SU JOIN TB_GWAMOK GW
											ON SU.gcode=GW.gcode
											GROUP BY SU.hakno
										   ) AA
	    	 ON ST.hakno=AA.hakno
	 		 ORDER BY ST.hakno
			) BB
) CC
WHERE rnum>=4 AND rnum<=6;
///////////////////////////////////////////////////////////////////

문3) 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후
     위에서 부터 1건만 조회하시오 (학번, 이름, 총학점) 
-- 수강테이블에 행추가 해주세요
-- (총학점이 다 같은 값이여서 결과확인하기가 조금 애매 합니다)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;


--1) 과목코드가 일치하는 학점 가져오기
SELECT SU.hakno, SU.gcode, GW.GHAKJUM
FROM tb_sugang SU JOIN tb_gwamok GW
ON SU.gcode=GW

--2) 학번별로 총학점 구하고, 총학점순으로 내림차순 정렬하기
SELECT SU.hakno, sum(GW.ghakjum) AS 총학점
FROM TB_SUGANG SU JOIN TB_GWAMOK GW
ON SU.gcode = GW.GCODE
GROUP BY SU.hakno
ORDER BY sum(GW.ghakjum) DESC;

--3) 2)의 결과를 AA테이블로 만들고, 학생테이블 조인해서 이름 가져오기

