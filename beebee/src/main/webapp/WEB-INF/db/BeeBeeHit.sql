-- 테이블 복제
CREATE table tbl_board2 as SELECT * FROM tbl_board where 1 != 1;

select * from tbl_board2;

DROP TABLE tbl_board2;


select * from tbl_board;

-- 조회수 생성
alter table tbl_board add hit number(10,0) default 0;
commit;

-- 종류별 게시판
SELECT * FROM TBL_BOARD order by bno desc;

ALTER TABLE tbl_board add CATEGORY varchar2(5);

select count(*) from tbl_board where category like 'free';

-- 가입 수
-- 오늘 가입
		select
    		(select count(*)
    		 from tbl_member
    		 where regdate >= to_char(trunc(sysdate), 'yyyy/mm/dd'))
		from dual;
-- 이번주 가입 회원 수 
select
    (select count(*)
    from tbl_member
    where regdate > to_char(trunc(sysdate,'iw'), 'yyyy/mm/dd'))
from dual;
select count(*) from tbl_member;

-- 이번달 가입 회원 수 
SELECT COUNT(*)
FROM tbl_member
WHERE regdate > TRUNC(sysdate,'MM');
-- 저번달 가입 회원 수
SELECT COUNT(*)
FROM tbl_member
WHERE regdate > ADD_MONTHS(TRUNC(sysdate,'MM'),-1);
-- 이번년도 가입 회원 수