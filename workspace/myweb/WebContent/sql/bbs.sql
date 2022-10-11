--bbs.sql
--답변 및 댓글형 게시판

--테이블 삭제
drop table tb_bbs;

--테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
,regdt    date            default  sysdate   -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null  -- 사용자 요청 PC의 IP
 ,primary key(bbsno)                 --bbsno 기본키 
);

--시퀀스 생성
create sequence bbs_seq;

--시퀀스 삭제
drop sequence bbs_seq;

--명령어 완료
commit;
///////////////////////////////


--새글쓰기
bbsno 								: 시퀀스를 이용해서 일련번호 
wname, subject, content, passwd		: 사용자가 입력
readcnt, regdt, indent, ansnum		: default
ip									: 요청 PC의 IP 저	
grpno                               : max(bbsno)+1                                                                                                      


--그룹번호(grpno) 만들기
select max(bbsno) from tb_bbs;
-- Null 값이면 계산 안 됨
select max(bbsno)+1 from tb_bbs;
-- nvl()함수를 이용해서 max(bbsno)값이 비어있을때(null)으로 바꿈
select nvl(max(bbsno),0) from tb_bbs;
--select nvl(max(bbsno),0)+1 from tb_bbs


--행추가
insert into tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)
values(bbs_seq.nextval, ?,?,?,?,?, (select nvl(max(bbsno),0+1 from tb_)));
