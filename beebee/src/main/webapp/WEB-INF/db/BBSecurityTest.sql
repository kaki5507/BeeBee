-- 스프링 시큐리티 지정된 테이블 생성
create table tbl_member(
    userid varchar2(50) not null primary key,
    userpw varchar2(100) not null,
    username varchar2(100) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    enabled char(1) default '1');
    
create table tbl_member_auth(
    userid varchar2(50) not null,
    auth varchar2(50) not null,
    constraint fk_member_auth foreign key (userid) references tbl_member(userid)
);


-- users 테이블에 데이터 추가
insert into users (username, password) values ('user00', 'pw00');
insert into users (username, password) values ('member00', 'pw00');
insert into users (username, password) values ('admin00', 'pw00');

-- authorities 테이블에 데이터 추가
insert into authorities (username, authority) values ('user00', 'ROLE_USER');
insert into authorities (username, authority) values ('member00', 'ROLE_MANAGER');
insert into authorities (username, authority) values ('admin00', 'ROLE_MANAGER');
insert into authorities (username, authority) values ('admin00', 'ROLE_ADMIN');

commit;

drop table users;
drop index ix_auth_username;
drop table authorities;

select * from tbl_member;
select * from tbl_member_auth;
drop table tbl_member;
drop table tbl_member_auth;

		SELECT
			mem.userid, userpw, username, enabled, regdate, updatedate, auth
		FROM
			tbl_member mem LEFT OUTER JOIN tbl_member_auth on mem.userid = auth.userid
		WHERE
			mem.userid = 'admin90';

-- 자동 로그인 테이블
create table persistent_logins(
    username varchar2(64) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null,
    last_used timestamp not null
);

select * from persistent_logins;