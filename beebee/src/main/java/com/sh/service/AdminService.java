package com.sh.service;

public interface AdminService {

	public int getTotalMember(); // 총 가입 회원
	
	public int getWeekMember(); // 이번주 가입 회원
	
	public int getTodayMember(); // 오늘 가입 회원
	
	public int getMonthMember(); // 이번달 가입 회원
	public int getLastMonthMember(); // 저번달 가입 회원
	
	public int getMinus1Member(); // 1일전 ~ 5일전
	public int getMinus2Member();
	public int getMinus3Member();
	public int getMinus4Member();
	public int getMinus5Member();
	
}
