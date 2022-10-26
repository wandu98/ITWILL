--notice.sql
--공지사항

1) 테이블 생성

   create table tb_notice(
     noticeno   number           not null  -- 일련번호
    ,subject    varchar2(255)    not null  -- 제목
    ,content    varchar2(4000)   not null  -- 내용
    ,regdt      date    default  sysdate   -- 작성일
    ,grpno    number(5)       not null
    ,readcnt  number(5)       default 0 not null -- 글조회수
    ,indent   number(5)       default 0 -- 들여쓰기
    ,ansnum   number(5)       default 0 -- 글순서
    ,primary key(noticeno)                 -- noticeno 기본키
   );


2) 일련번호 시퀀스 생성

   create sequence noticeno_seq;
   
   
   
  테이블 시퀀스 만들어 둠