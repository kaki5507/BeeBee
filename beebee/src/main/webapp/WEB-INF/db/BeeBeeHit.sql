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