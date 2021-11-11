-- ��Ʈ��ȣ Ȯ��
select dbms_xdb.gethttpport() from dual; -- ���� 8090

-- 8080���� ��µǴ� ���
exec dbms_xdb.sethttpport(8080);

-- �Խñ� ������ ���̺� ����
create table tbl_attach(
    uuid varchar2(200) not null,
    fileName varchar2(100) not null,
    uploadPath varchar2(200) not null,
    image char(1) default 'I',
    bno number(10,0)
);

alter table tbl_attach add constraint pk_attach primary key (uuid);

alter table tbl_attach add constraint fk_board_attach foreign key (bno)
references tbl_board(bno);

