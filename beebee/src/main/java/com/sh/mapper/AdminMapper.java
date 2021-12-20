package com.sh.mapper;

public interface AdminMapper {
	
	public int totalMember(); // 총 회원수
	
	public int weekMember(); // 이번주 가입 회원
	
	public int todayMember(); // 오늘 가입 회원
	
	public int monthMember(); // 이번달 가입 회원
	public int lastMonthMember(); // 저번달 가입 회원
	
	public int mi1Member(); // 1일전 가입 수 ~ 5일전
	public int mi2Member();
	public int mi3Member();
	public int mi4Member();
	public int mi5Member();
	
}
