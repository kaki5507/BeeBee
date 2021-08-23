-- 포트번호 확인
select dbms_xdb.gethttpport() from dual; -- 현재 8090

-- 8080으로 출력되는 경우
exec dbms_xdb.sethttpport(8090); -- 포트번호 변경 가능

