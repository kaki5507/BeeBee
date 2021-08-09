-- beebee 만들기 비밀번호 beebee
CREATE USER beebee IDENTIFIED BY beebee
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 특정 행위 권한,롤(role)이 필요 하므로 GRANT 구문을 이용해서 처리
GRANT CONNECT, DBA TO beebee;

-- 비밀번호 바꾸기
alter user beebee IDENTIFIED BY 5507;


