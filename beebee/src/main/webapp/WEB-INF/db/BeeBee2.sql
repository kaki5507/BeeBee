-- 2021 11 24 시큐리티 멤버 컬럼명 변경
CREATE TABLE tbl_member(
    userEmail varchar2(200) PRIMARY KEY,
    userNickName varchar2(50) not null,
    userPwd varchar2(200) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    enabled char(1) default '1'
);
select * from tbl_member;
create table tbl_member_auth(
    userEmail varchar2(50) not null,
    auth varchar2(50) not null,
    constraint fk_member_auth foreign key (userEmail) references tbl_member(userEmail)
);
select * from tbl_member_auth;
-- 자동 로그인 테이블
create table persistent_logins(
    userNickName varchar2(64) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null,
    last_used timestamp not null
);
commit;
select * from persistent_logins;

drop table persistent_logins;
drop table tbl_member_auth;
drop table tbl_member;