-- ��Ʈ��ȣ Ȯ��
select dbms_xdb.gethttpport() from dual; -- ���� 8090

-- 8080���� ��µǴ� ���
exec dbms_xdb.sethttpport(8080);

select * from tbl_attach;
select * from tbl_board;

insert into tbl_attach (uuid, uploadpath, filename , filetype, bno)
values ('sdsdsd', 'sd', 'zz.png', '0','1');

commit;

-- �Խñ� ������ ���̺� ����
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










-- ���̺� ��� ��ȸ ����
select * from all_all_tables;
select * from dba_tables;

-- ���̺� ��� ��ȸ (������ ����)
select * from USER_TABLES;

-- �Խù� ���̺� �����
create sequence seq_board; -- �Խù� ���� ��ȣ
drop sequence seq_board;
select * from user_sequences;
select seq_board.currval from dual;

commit;

select * from tbl_board where bno = 530;
commit;
-- ���̺� ����
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
-- �����̸Ӹ�Ű ����
alter table tbl_board add constraint pk_board
primary key (bno);

-- ����� �� �ǹ��ϴ� �÷� �߰�
alter table tbl_board add (replycnt number default 0);

-- ���� ����� replyCnt �ݿ��ؾ���
-- replycnt�� �����ϴµ� ������̺��� bno���� �ΰ��� ������ ����
update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);
commit;
select * from tbl_board where bno = '509';

-- ���� �߰���
insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', '�����');

-- ��� ����
insert into tbl_board (bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

commit;

-- bno+1�� �ؼ� ��ȹ ���� Ȯ�� Ǯ ��ĵ
select * from tbl_board order by bno + 1 desc;
-- ������ �Ӹ�Ű�� �̿��ؼ� ���� ������ �޸� sort�� ������ ����
select * from tbl_board order by bno desc;

select /*+ INDEX_DESC(tbl_board pk_board) */ *
from tbl_board where bno > 0;

-- ��Ʈ�� �̿��� �Խ��� �Խù� ���� ���
select /*+ INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content
from tbl_board where bno > 0;

select * from idx_reply;

-- �� �������� 10�� ��� ����
select /*+INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content
from tbl_board where rownum <= 10;

-- �ο���� 10�� �Խù� ���� 20�� ���� ����غ���
-- ����� ���� �ʴ´�.
select /*+INDEX_DESC(tbl_board pk_board)*/ rownum rn, bno, title, content
from tbl_board where rownum <= 20;

-- �ζ��κ並 ó���ؼ� ������ «
-- �ȿ��� ���� rownum 20�� ������ ������ ��������
-- �� ���� select���� �̿��ؼ� 10���� ū ���� ��ȸ�Ѵ�.
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

-- ������ NEXTVAL �ʱ�ȭ
-- �������� ���� ���� Ȯ��
SELECT LAST_NUMBER FROM USER_SEQUENCES where SEQUENCE_NAME = 'seq_board';
SELECT LAST_NUMBER FROM USER_SEQUENCES;

-- ������ ������ �� ��ŭ INCREMENT�� ����.
ALTER SEQUENCE seq_board INCREMENT BY -29;

ALTER SEQUENCE seq_board INCREMENT BY 1;

select * from tbl_members;

select * from tbl_members where email = 'ckdbioksh@naver.com';



create index idx_reply on tbl_reply (bno desc, rno asc);
-- members ����� 0928
CREATE TABLE tbl_members(
    email varchar2(200) PRIMARY KEY,
    nickname varchar2(50) not null,
    pwd varchar2(200) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

DROP TABLE tbl_members;

-- ���� ������ �ֱ�
insert into tbl_members (email, nickname, pwd)
values ('ckdbioksh@naver.com', '���', '12345');

select * from tbl_members;
SELECT * FROM tbl_members WHERE email = 'ckdbioksh@naver.com' AND pwd = '123456789Aa!';
commit;

---------------------- ��� ���� ���̺�
create table tbl_reply (
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyBoom number(4,0), -- 4�ڸ� ���� �����ϰ� 0�� �Ҽ����� 0�̶�� ��
    replyDate date default sysdate,
    updateDate date default sysdate
);
-- replyBoom ����Ʈ�� 0���� ����
ALTER TABLE tbl_reply MODIFY (replyBoom DEFAULT 0);
-- ��� ���� ��ȣ ������ ����
create sequence seq_reply;
drop table tbl_reply;
drop sequence seq_reply;

-- �����̸Ӹ� Ű ����
alter table tbl_reply add constraint pk_reply primary key (rno);

alter table tbl_reply add constraint fk_reply_board
foreign key (bno) references tbl_board (bno);

COMMIT;