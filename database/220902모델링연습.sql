--테이블 생성
create table TB_SeatClass(

    S_gcode     char(4)      not null,				 --구분코드
    S_class     varchar2(30) not null,				 --클래스
    S_cost      int          not null,				 --비용
    constraint TB_SeatClass_pk primary key (S_gcode) --PK
);

--테이블 데이터 행추가
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J001', '비지니스 스위트', 377000);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J002', '로얄비지니스', 269500);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J003', '비지니스 스마티움', 210000);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J004', '비지니스', 168000);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J005', '이코노미 스마티움', 123500);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J006', '이코노미 레그룸', 80000);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J007', '이코노미', 50000);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J008', '프론트', 30000);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J009', '듀오', 30000);
insert into TB_SeatClass(S_gcode, S_class, S_cost) VALUES('J010', '반려동물 지정', 30000);

select S_gcode 구분코드, S_Class 클래스, to_char(S_cost, 'FM999,999,999,999') "금액(편도 기준)"
from TB_SeatClass;


commit;


SELECT * FROM sungjuk;
SELECT * FROM tb_student;
SELECT * FROM TB_GWAMOK;
SELECT * FROM tb_sugang;
