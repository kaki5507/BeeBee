-- ��Ʈ��ȣ Ȯ��
select dbms_xdb.gethttpport() from dual; -- ���� 9090

-- 8080���� ��µǴ� ���
exec dbms_xdb.sethttpport(9090); -- ��Ʈ��ȣ ���� ����

