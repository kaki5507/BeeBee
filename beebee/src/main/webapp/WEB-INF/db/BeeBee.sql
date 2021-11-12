-- 포트번호 확인
select dbms_xdb.gethttpport() from dual; -- 현재 8090

-- 8080으로 출력되는 경우
exec dbms_xdb.sethttpport(8080);

select * from tbl_attach;
select * from tbl_board;

insert into tbl_attach (uuid, uploadpath, filename , filetype, bno)
values ('sdsdsd', 'sd', 'zz.png', '0','1');

commit;

-- 게시글 저장할 테이블 생성
create table tbl_attach(
    uuid varchar2(200) not null,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    fileType char(1) default 'I',
    bno number(10,0)
);

drop table tbl_attach;

alter table tbl_attach add constraint pk_attach primary key (uuid);

alter table tbl_attach add constraint fk_board_attach foreign key (bno)
references tbl_board(bno);


select * from tbl_board;










-- 테이블 목록 조회 쿼리
select * from all_all_tables;
select * from dba_tables;

-- 테이블 목록 조회 (접속한 계정)
select * from USER_TABLES;

-- 게시물 테이블 만들기
create sequence seq_board; -- 게시물 고유 번호
drop sequence seq_board;
select * from user_sequences;
select seq_board.currval from dual;

commit;

select * from tbl_board where bno = 530;
commit;
-- 테이블 생성
create table tbl_board(
    bno number(10,0),
    title varchar2(100) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

drop table tbl_board;

select * from tbl_board order by bno desc;
select * from seq_board;
-- 프라이머리키 설정
alter table tbl_board add constraint pk_board
primary key (bno);

-- 댓글의 수 의미하는 컬럼 추가
alter table tbl_board add (replycnt number default 0);

-- 기존 댓글의 replyCnt 반영해야함
-- replycnt를 수정하는데 댓글테이블에서 bno값이 두개가 같을때 수정
update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);
commit;
select * from tbl_board where bno = '509';

-- 더미 추가함
insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '테스트 제목', '테스트 내용', '김승현');

-- 재귀 복사
insert into tbl_board (bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

commit;

-- bno+1을 해서 계획 설명 확인 풀 스캔
select * from tbl_board order by bno + 1 desc;
-- 프라이 머리키를 이용해서 접근 기존과 달리 sort의 과정도 없음
select * from tbl_board order by bno desc;

select /*+ INDEX_DESC(tbl_board pk_board) */ *
from tbl_board where bno > 0;

-- 힌트를 이용한 게시판 게시물 역순 출력
select /*+ INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content
from tbl_board where bno > 0;

select * from idx_reply;

-- 한 페이지에 10개 출력 쿼리
select /*+INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content
from tbl_board where rownum <= 10;

-- 로우넘을 10번 게시물 부터 20번 까지 출력해보자
-- 출력이 되지 않는다.
select /*+INDEX_DESC(tbl_board pk_board)*/ rownum rn, bno, title, content
from tbl_board where rownum <= 20;

-- 인라인뷰를 처리해서 쿼리를 짬
-- 안에서 먼저 rownum 20의 이하의 값들을 가져오고
-- 그 다음 select문을 이용해서 10보다 큰 값을 조회한다.
select bno, title, content
from (
    select /*+INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content
    from tbl_board
    where rownum <= 30
    )
where rn > 20;

commit;

select * from tbl_board ORDER BY bno desc;

select * from tbl_board where bno > 0 ORDER BY bno ASC;

commit;

select * from tbl_board ORDER BY bno desc;

-- 시퀀스 NEXTVAL 초기화
-- 시퀀스의 현재 값을 확인
SELECT LAST_NUMBER FROM USER_SEQUENCES where SEQUENCE_NAME = 'seq_board';
SELECT LAST_NUMBER FROM USER_SEQUENCES;

-- 현재의 시퀀스 값 만큼 INCREMENT를 뺀다.
ALTER SEQUENCE seq_board INCREMENT BY -29;

ALTER SEQUENCE seq_board INCREMENT BY 1;

select * from tbl_members;

select * from tbl_members where email = 'ckdbioksh@naver.com';



create index idx_reply on tbl_reply (bno desc, rno asc);
-- members 만들기 0928
CREATE TABLE tbl_members(
    email varchar2(200) PRIMARY KEY,
    nickname varchar2(50) not null,
    pwd varchar2(200) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

DROP TABLE tbl_members;

-- 임의 데이터 넣기
insert into tbl_members (email, nickname, pwd)
values ('ckdbioksh@naver.com', '운영자', '12345');

select * from tbl_members;
SELECT * FROM tbl_members WHERE email = 'ckdbioksh@naver.com' AND pwd = '123456789Aa!';
commit;

---------------------- 댓글 관련 테이블
create table tbl_reply (
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyBoom number(4,0), -- 4자리 까지 가능하고 0은 소숫점이 0이라는 뜻
    replyDate date default sysdate,
    updateDate date default sysdate
);
-- replyBoom 디폴트값 0으로 설정
ALTER TABLE tbl_reply MODIFY (replyBoom DEFAULT 0);
-- 댓글 고유 번호 시퀀스 생성
create sequence seq_reply;
drop table tbl_reply;
drop sequence seq_reply;

-- 프라이머리 키 설정
alter table tbl_reply add constraint pk_reply primary key (rno);

alter table tbl_reply add constraint fk_reply_board
foreign key (bno) references tbl_board (bno);

COMMIT;