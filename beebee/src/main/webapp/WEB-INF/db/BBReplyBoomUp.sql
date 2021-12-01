---------------------- 댓글 관련 테이블
create table tbl_reply (
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

ALTER TABLE tbl_reply add replyBoomUp number(4,0) default 0;
ALTER TABLE tbl_reply add replyBoomDown number(4,0) default 0;
drop table tbl_boomUp;
-- 댓글 추천 비추천 테이블
create table tbl_boomUp(
    reco varchar2(50) not null,
    boomDate date default sysdate,
    rno number(10,0),
    constraint pk_boomUp_reco primary key (reco,rno),
    constraint fk_boomUp_rno foreign key (rno) references tbl_reply(rno)
);
create table tbl_boomDown(
    reco varchar2(50) not null,
    boomDate date default sysdate,
    rno number(10,0),
    constraint pk_boomDown_reco primary key (reco),
    constraint fk_reply_boomDown foreign key (rno) references tbl_reply(rno)
);

commit;
