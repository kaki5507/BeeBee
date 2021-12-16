-- 테이블 복제
CREATE table tbl_board2 as SELECT * FROM tbl_board where 1 != 1;

select * from tbl_board2;

DROP TABLE tbl_board2;


select * from tbl_board;

alter table tbl_board add hit number(10,0) default 0;
commit;