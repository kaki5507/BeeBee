-- beebee ����� ��й�ȣ beebee
CREATE USER beebee IDENTIFIED BY beebee
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- Ư�� ���� ����,��(role)�� �ʿ� �ϹǷ� GRANT ������ �̿��ؼ� ó��
GRANT CONNECT, DBA TO beebee;

-- ��й�ȣ �ٲٱ�
alter user beebee IDENTIFIED BY 5507;


