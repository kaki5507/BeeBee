package com.sh.service;

public interface AdminService {

	public int getTotalMember(); // �� ���� ȸ��
	
	public int getWeekMember(); // �̹��� ���� ȸ��
	
	public int getTodayMember(); // ���� ���� ȸ��
	
	public int getMonthMember(); // �̹��� ���� ȸ��
	public int getLastMonthMember(); // ������ ���� ȸ��
	
	public int getMinus1Member(); // 1���� ~ 5����
	public int getMinus2Member();
	public int getMinus3Member();
	public int getMinus4Member();
	public int getMinus5Member();
	
}
