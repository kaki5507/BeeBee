-- ��Ʈ��ȣ Ȯ��
select dbms_xdb.gethttpport() from dual; -- ���� 8090

-- 8080���� ��µǴ� ���
exec dbms_xdb.sethttpport(8090); -- ��Ʈ��ȣ ���� ����

