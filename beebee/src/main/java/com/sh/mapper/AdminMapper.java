package com.sh.mapper;

public interface AdminMapper {
	
	public int totalMember(); // �� ȸ����
	
	public int weekMember(); // �̹��� ���� ȸ��
	
	public int todayMember(); // ���� ���� ȸ��
	
	public int monthMember(); // �̹��� ���� ȸ��
	public int lastMonthMember(); // ������ ���� ȸ��
	
	public int mi1Member(); // 1���� ���� �� ~ 5����
	public int mi2Member();
	public int mi3Member();
	public int mi4Member();
	public int mi5Member();
	
}
