-- 포트번호 확인
select dbms_xdb.gethttpport() from dual; -- 현재 8090

-- 8080으로 출력되는 경우
exec dbms_xdb.sethttpport(8080);

-- 게시글 저장할 테이블 생성
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

