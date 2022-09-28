
i:\java202207\database\20220823_01emp���̺���.sql
////////////////////////////////////////////////////////////////////////////////


��1) emp ������̺��� �����Ͻÿ�
create table emp(
  empno       number(4)     primary key     -- ���(-9999~9999)
  ,ename      varchar2(50)                        -- �̸�
  ,job        varchar2(10)                          -- ����
  ,mgr        number(4)                             -- �Ŵ�������
  ,hiredate   date                                     -- �Ի���
  ,sal        number(7,2)                           -- �޿�(�Ҽ��� 2�ڸ�)
  ,comm       number(7,2)                        -- Ŀ�̼�(���ʽ�)
  ,deptno     number(2)                           -- �μ��ڵ�(-99~99)
);

drop table emp;

��2) emp������̺� ���� �߰��Ͻÿ�
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '����', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '���', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '��ǥ', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '���', 7902, '2001-12-03', 200, 20);
////////////////////////////////////////////////////////////////////////////////


��3) ��ü ���� ������ ��ȸ�Ͻÿ�

select count(*) from emp;

��4) ���̺��� Į��(�ʵ�) ����� Ȯ���Ͻÿ�

select * from emp;

��5) ����̸���(��������) �����Ͻÿ�

select * from emp order by ename;

��6) ����̸���(��������) �����Ͻÿ�

select * from emp order by ename desc;

��7) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�

select ename, sal, deptno
from emp
order by sal desc;

��8) �μ��ڵ� ��������, �޿� ������������
     ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
     
select ename, sal, deptno
from emp
order by deptno asc, sal desc;

��9) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
      �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
      
select ename, hiredate, deptno
from emp
order by deptno, hiredate;

��10) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�

select job from emp; --  �׻� ���� ������ üũ�ϱ�

select job from emp group by job;

select distinct(job) from emp;

��11) emp���̺��� job ��������, sal ������������ �����ؼ�
      ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
      
select ename as �̸�, job as ����, sal as �޿�
from emp
order by job, sal desc;

��12) �޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)

select ename, sal
from emp
where sal between 100 and 400
order by sal desc;

select ename, sal
from emp
where sal >= 100 and sal <= 400
order by sal desc;

��13) �޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)

select ename, sal
from emp
where sal <= 100 or sal >= 400
order by sal desc;

��14) ����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�

select ename, job
from emp
where job = '����' or job = '����'
order by ename;

select ename, job
from emp
where job in ('����','����')
order by ename;

��15) �μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�

select ename, deptno
from emp
where deptno = 30;

select ename, deptno
from emp
where deptno in (30);

��16) �ߺ��� �μ��ڵ带 �Ѱ����� ��ȸ�Ͻÿ�

select distinct(deptno) from emp;

select deptno from emp group by deptno;

��17) �μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
      (or, in������ ���� Ȱ���ؼ� ��ȸ)
      
select ename, deptno
from emp
where deptno in (10, 20, 30);

select ename, deptno
from emp
where deptno = 10 or deptno = 20 or deptno = 30;

��18) �޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
      (and, between������ ���� Ȱ���ؼ� ��ȸ)
      
select ename, sal
from emp
where sal between 300 and 500
-- where sal >= 300 and sal <= 500
order by sal;

��19) �̸��� ����ȭ ��ȸ�Ͻÿ�

select ename
from emp
where ename = '����ȭ';

��20) �达���� ��ȸ�Ͻÿ�

select ename
from emp
where ename like '��%';

��21) �̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�

select *
from emp
where ename like '%ȭ%';

��22) �μ��ڵ尡 20�� ���ڵ忡 ���ؼ�
      �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
      
select deptno, sal, comm from emp;

update emp
set comm = sal / 100
where deptno = 20;

��23) ������ �Ʒ��� ���� ������ �̸�, �μ�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
      
-- �� Ǯ��
ALTER TABLE emp ADD ysal number(4);

update emp
set ysal = sal * 12 + comm;

alter table emp drop column ysal;

-- ����� Ǯ��
select ename, deptno, sal, sal*12+comm as ���� from emp;

select * from emp;

��24) Ŀ�̼��� null�̸� 0���� �ٲ��� ������ �ٽ� ����ؼ�
      �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
      
-- comm�� null ���� ���� ��ȸ
select ename, comm from emp where comm is null;

-- comm Į���� null ���� 0���� �ٲٱ�
select ename, nvl(comm, 0)
from emp
where comm is null;
      
-- comm Į���� null ���� 0���� �ٲ� ��, ���� ����ϱ�
select ename, deptno, sal, sal*12+nvl(comm, 0) as ���� from emp;

-- ������ �ݿø��ؼ� �Ҽ��� ���� ��ȸ�Ͻÿ�
select ename, deptno, sal, round(sal*12+nvl(comm, 0), 0) as ���� from emp;

update emp
set comm = nvl(comm, 0);

update emp
set ysal = sal * 12 + comm;

select * from emp;

��25) �� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
      (|| ���տ�����)

select ename || '�� �޿��� ' || sal || ' �Դϴ�.' from emp;

select ename || '�� �޿��� ' || sal || ' �Դϴ�.' as pay from emp;

-- ������ �켱����
() ��ȣ : ������ �켱�������� �켱��
1���� : �񱳿�����, SQL������, ���������
2���� : not
3���� : and
4���� : or
5���� : ���տ�����   

��26) emp���̺��� �Ի���(hiredate)�� 2005�� 1�� 1�� ������ ����� ����
      ����� �̸�(ename), �Ի���, �μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�
      
select ename, hiredate, deptno
from emp
where TO_CHAR(hiredate) < TO_CHAR('2005-01-01')
order by hiredate;

select ename, hiredate, deptno
from emp
where hiredate < '2005-01-01'
order by hiredate;

��27) emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
     ����鿡 ���Ͽ� �̸�, �����ڵ�(job), �μ���ȣ�� �̸������� ��ȸ�Ͻÿ�
     (or, in������ ���� Ȱ���ؼ� ��� ��ȸ)
     
select ename, job, deptno
from emp
where deptno in (20, 30)
-- where deptno = 20 or deptno = 30
order by ename;

��28) ���, �̸�, �μ��� ��ȸ�Ͻÿ�
      (��, �μ��ڵ尡 10�̸� ������
                      20�̸� ������
                      30�̸� �����η� �ٲ㼭 ���)
                      
select empno, ename, case when deptno = 10 then '������'
                                       when deptno = 20 then '������'
                                       when deptno = 30 then '������'
                                end as deptname
from emp;

                      
select empno, ename, decode(deptno, 10, '������',
                                                      20, '������',
                                                      30, '������') deptname
from emp;


��29) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not(sal>200 and sal<300) -- 200 �ʰ� 300 �̸��� �ƴ� �� ��ȸ
      order by sal;
      

��30) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not sal>200 and sal<300 -- 200 �����̸鼭 300 �̸� ���� ��ȸ 
      order by sal;


//////////////////////////////////////////////////////////////////////////////////////////////////////

[emp���̺� ���� ��������]


��31) �μ��ڵ庰 �޿��հ踦 ���Ͻÿ�

select deptno, sum(sal) from emp group by deptno;

select deptno, sum(sal)
from emp
group by deptno
order by deptno;

��32) �μ��ڵ庰 �޿��հ踦 ���ؼ�  �� �հ谪�� 1500�̻� ��ȸ�Ͻÿ�

select deptno, sum(sal)            -- ������� 4)
from emp                                -- ������� 1)
group by deptno                      -- ������� 2)
having sum(sal) >= 1500;         -- ������� 3)


��33) �μ��� �޿������ 300�̻� ��ȸ�Ͻÿ�

select deptno, avg(sal)
from emp
group by deptno;

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 300;


��34) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ ���ؼ� �޿���ռ����� ��ȸ�Ͻÿ�

select deptno, round(avg(sal), 0)
from emp
where sal >= 300
group by deptno;

select deptno, round(avg(sal), 0)
from emp
where sal >= 300
group by deptno
order by round(avg(sal), 0);


��35) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ 400�̻��� �޿������� ��ȸ�Ͻÿ�




select deptno, round(avg(sal), 0)
from emp
where sal >= 300
group by deptno
having round(avg(sal), 0) >= 400
order by round(avg(sal), 0);


select sal, (select deptno from emp group by deptno having avg(sal)>=400) as deptno_avg
from emp
where sal >= 300
order by sal;

��36) hiredateĮ���� ����Ͽ� ������ �Ի��� �ο����� ���Ͻÿ�

-- ��ȯ�Լ� : to_char(������¥, '���ϴ� ���')

-- �Ի��� ��ȸ
select hiredate from emp;

-- �Ի��Ͽ��� �� ��������
select to_char(hiredate, 'mm') from emp;
select to_char(hiredate, 'mm') as �� from emp;

select to_char(hiredate, 'yy') as �Ի�⵵ from emp;
select to_char(hiredate, 'dd') as �� from emp;

-- �Ի���� �����ؼ� ��ȸ�ϱ�
select to_char(hiredate, 'mm') as �Ի��
from emp
order by to_char(hiredate, 'mm');

-- �Ի������ �׷�ȭ �ϱ�
select to_char(hiredate, 'mm') as �Ի��
from emp
group by to_char(hiredate, 'mm');

-- �Ի�� �������� �����ϱ�
select to_char(hiredate, 'mm') as �Ի��, count(*) as �ο���
from emp
group by to_char(hiredate, 'mm')
order by �Ի��;

--- �ο��� ������ �����ϱ�
select to_char(hiredate, 'mm') as �Ի��, count(*) as �ο���
from emp
group by to_char(hiredate, 'mm')
order by �ο���;

--select extract (month from hiredate) as mon, count(*)
--from emp
--group by extract (month from hiredate)
--order by mon asc;


��37) �Ŵ����� ����ο����� ��ȸ�Ͻÿ�

select mgr, count(*)
from emp
group by mgr;

��38) �����ȣ 7654�� �޿����� ���� ���� ��ȸ�Ͻÿ� (���� ����)

select sal from emp where empno = 7654; -- 400

select empno, ename, sal
from emp
where sal < 400;

select empno, ename, sal
from emp
where sal < (select sal from emp where empno = 7654);


��39) �μ����� �޿�+Ŀ�̼Ǹ� ��������  �ִ밪, �ּҰ�, ��հ�(�ݿø� �ؼ�)�� �μ������� ��ȸ�Ͻÿ�

select deptno, sal, comm from emp order by deptno;
select deptno, sal, comm, sal + comm from emp order by deptno;
select deptno, sal, comm, sal + nvl(comm, 0) from emp order by deptno;

select deptno, max(sal + nvl(comm, 0)) �ִ밪, min(sal + nvl(comm, 0)) �ּҰ�, round(avg(sal + nvl(comm, 0)), 1) ��հ�
from emp
group by deptno
order by deptno;


/////////////////////////////////////////////////////////////////////

�� [��¥ ������]

��40) �� �����鿡 ���ؼ� ������ �̸��� �ټӳ���� ���Ͻÿ�
      ��, �ټӳ���� �������� �����Ͽ� ��Ÿ���ÿ�
      
-- �̸�, �Ի����� �Ի��� ������ ��ȸ�Ͻÿ�
select ename, hiredate from emp order by hiredate;
      
-- (���糯¥ - �Ի���) / 365
select ename, hiredate, sysdate-hiredate from emp;

-- (���糯¥ - �Ի���) / 365 -> �Ҽ��� ����
select ename, floor((sysdate - hiredate) / 365) from emp;

select ename, hiredate, trunc((sysdate-hiredate)/365) from emp;

-- (���糯¥ - �Ի���) / 365 -> �Ҽ��� ���� -> Į���� ����
select ename, hiredate, trunc((sysdate-hiredate)/365) as �ټӳ�� from emp;

-- �ټӳ�� ������ �������� ����
select ename, hiredate, trunc((sysdate-hiredate)/365) as �ټӳ�� from emp
order by �ټӳ�� desc;


��41) �Ʒ��� ���� ��� �Ͻÿ�
      ��) �������� �ټӳ�� : 20��
      
select ename, hiredate from emp order by hiredate;

select ename, sysdate - hiredate from emp order by hiredate;

select ename, (sysdate - hiredate) / 365 from emp order by hiredate;

select ename, trunc((sysdate - hiredate) / 365) from emp order by hiredate;

select ename || '�� �ټӳ�� : ' || trunc((sysdate - hiredate) / 365) || '��' from emp order by hiredate;
      
select ename || '�� �ټӳ�� : ' || floor((sysdate - hiredate) / 365) || '��'
from emp order by hiredate;



��42) ������� �ټӳ���� ������ ���� ��ȸ(�̸�, �ټӳ��)�Ͻÿ�

-- ����� ��ȸ�ϱ�
select * from emp where ename = '�����';

-- ������� �ټӳ�� ���ϱ�
select trunc((sysdate - hiredate) / 365) as �ټӳ�� from emp where ename = '�����'; -- 20


select ename, trunc((sysdate - hiredate) / 365) as �ټӳ��
from emp
where trunc((sysdate - hiredate) / 365) = 20;



select ename, trunc((sysdate - hiredate) / 365) as �ټӳ��
from emp
where trunc((sysdate - hiredate) / 365) = (
                                                            select trunc((sysdate - hiredate) / 365)
                                                            from emp
                                                            where ename = '�����'
                                                          );





��43) �Ի����� ��15�� �̻�� ����� ���� ���翬������ 10% �λ������ �� 
      ���, �̸�, �Ի���, ���翬��, �λ��Ŀ���, �λ�ȱݾ����� ��׿��������� ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
      
-- �ټӳ���� 15�� �̻� ��ȸ�ϱ�
select ename, hiredate, sal
from emp
where trunc((sysdate - hiredate) / 365) >= 15;
      
-- ���� ���� ���ϱ� (��, Ŀ�̼��� ������ 0���� �ٲ㼭 ���)
select ename, hiredate, sal * 12 + nvl(comm, 0)
from emp
where trunc((sysdate - hiredate) / 365) >= 15;

select ename, hiredate, sal * 12 + nvl(comm, 0) as ���翬��
from emp
where trunc((sysdate - hiredate) / 365) >= 15;

-- ���� �������� 10% �λ�� �ݾ�
select ename, hiredate, sal
         ,sal * 12 + nvl(comm, 0) as ���翬��
         ,(sal * 12 + nvl(comm, 0)) * 0.1 as �λ�ȱݾ�
from emp
where trunc((sysdate - hiredate) / 365) >= 15;

-- ���翬��+ �λ�ȱݾ� = �������� ���ϱ�
select ename, hiredate, sal
         ,sal * 12 + nvl(comm, 0) as ���翬��
         ,(sal * 12 + nvl(comm, 0)) * 0.1 as �λ�ȱݾ�
         ,sal * 12 + nvl(comm, 0) + (sal * 12 + nvl(comm, 0)) * 0.1 as ��������
from emp
where trunc((sysdate - hiredate) / 365) >= 15;

-- �������� �Ҽ��� ���� �ݿø�
select ename, hiredate, sal
         ,sal * 12 + nvl(comm, 0) as ���翬��
         ,(sal * 12 + nvl(comm, 0)) * 0.1 as �λ�ȱݾ�
         ,round(sal * 12 + nvl(comm, 0) + (sal * 12 + nvl(comm, 0)) * 0.1, 0) as ��������
from emp
where trunc((sysdate - hiredate) / 365) >= 15
order by sal desc;

      
select empno, ename, hiredate, (sal*12 + nvl(comm, 0)) as ���翬��, floor((sal*12 + nvl(comm, 0))) * 1.1 as �λ��Ŀ��� 
from emp
where floor((sysdate - hiredate) / 365) >= 15
order by �λ��Ŀ��� desc;

select * from emp;

��44) �Ի�⵵�� ¦���� �������� �޿��� ����� job���� ����Ͻÿ�

-- ����, �Ի��� ��ȸ�ϱ�
select job, hiredate from emp;

-- �Ի��Ͽ��� �⵵ �����ϱ�
select hiredate, extract (year from hiredate) from emp;

-- ¦���⵵ �����ϱ�
select hiredate, extract (year from hiredate)
from emp
where mod(extract (year from hiredate), 2) = 0;

-- ���޺� �޿��� ��� ���ϱ�
select job, avg(sal)
from emp
where mod(extract (year from hiredate), 2) = 0
group by job;

-- to_char()
select job, avg(sal)
from emp
where mod(to_char(hiredate, 'yyyy'), 2) = 0
group by job
order by avg(sal);

