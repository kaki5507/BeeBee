-- ���̺� ����
CREATE table tbl_board2 as SELECT * FROM tbl_board where 1 != 1;

select * from tbl_board2;

DROP TABLE tbl_board2;


select * from tbl_board;

-- ��ȸ�� ����
alter table tbl_board add hit number(10,0) default 0;
commit;

-- ������ �Խ���
SELECT * FROM TBL_BOARD order by bno desc;

ALTER TABLE tbl_board add CATEGORY varchar2(5);

select count(*) from tbl_board where category like 'free';

-- ���� ��
-- ���� ����
		select
    		(select count(*)
    		 from tbl_member
    		 where regdate >= to_char(trunc(sysdate), 'yyyy/mm/dd'))
		from dual;
-- �̹��� ���� ȸ�� �� 
select
    (select count(*)
    from tbl_member
    where regdate > to_char(trunc(sysdate,'iw'), 'yyyy/mm/dd'))
from dual;
select count(*) from tbl_member;

-- �̹��� ���� ȸ�� �� 
SELECT COUNT(*)
FROM tbl_member
WHERE regdate > TRUNC(sysdate,'MM');
-- ������ ���� ȸ�� ��
SELECT COUNT(*)
FROM tbl_member
WHERE regdate > ADD_MONTHS(TRUNC(sysdate,'MM'),-1);
-- �̹��⵵ ���� ȸ�� ��