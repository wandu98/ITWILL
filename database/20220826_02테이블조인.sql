● [테이블 조인의 종류]

1) inner join
   - 두 테이블에 공통으로 존재하는 칼럼을 이용하는 방식
   - inner 생략가능
   - 기본
   
2) left outer join
   - 왼쪽 테이블의 모든 데이터와 오른쪽 테이블의 동일 데이터를 추출
   - outer 생략가능
   
3) right outer join
   - 오른쪽 테이블의 모든 데이터와 왼쪽 테이블의 동일 데이터를 추출
   - outer 생략가능

●  [LEFT JOIN 과 RIGHT join]

-- 학생테이블의 모든 행을 가져오고, 수강테이블에서 학벙니 일치하는 행만 가져오기
SELECT ST.*, SU.*
FROM TB_STUDENT ST LEFT JOIN tb_sugang SU
ON ST.HAKNO = SU.HAKNO ;


문1)left join를 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오
SELECT ST.HAKNO, ST.UNAME, SU.hakno, SU.gcode
FROM TB_STUDENT ST LEFT JOIN TB_SUGANG SU
ON ST.HAKNO = SU.hakno
WHERE SU.hakno IS NULL;

문2)right join를 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오

SELECT SU.HAKNO, SU.gcode, ST.hakno, ST.uname
FROM TB_SUGANG SU right JOIN TB_STUDENT St
ON SU.HAKNO = ST.hakno
WHERE SU.hakno IS NULL;

● [ (+)기호를 이용한 테이블 조인 ] 
    (+)기호는 일치되지 않는 행이 존재하는 않은 쪽에 붙인다
    
SELECT ST.hakno, ST.uname, SU.gcode, SU.hakno
FROM TB_STUDENT ST, tb_sugang SU
WHERE ST.HAKNO = SU.hakno(+);		--LEFT JOIN

SELECT SU.hakno, SU.gcode, ST.uname, ST.hakno
FROM TB_STUDENT SU, tb_sugang ST
WHERE SU.HAKNO(+)=ST.hakno;			--right JOIN

COMMIT;

