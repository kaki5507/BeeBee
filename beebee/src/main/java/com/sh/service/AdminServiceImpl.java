package com.sh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService{
	
	
	@Autowired
	AdminMapper adminMapper;

	/* 총 회원 수 */
	@Override
	public int getTotalMember() {
		int cnt = adminMapper.totalMember();
		return cnt;
	}

	/* 이번주 가입 회원 수 */
	@Override
	public int getWeekMember() {
		int cnt = adminMapper.weekMember();
		return cnt;
	}

	/* 오늘 가입 회원 수 */
	@Override
	public int getTodayMember() {
		int cnt = adminMapper.todayMember();
		return cnt;
	}
	
	/* 이번달 가입 회원 수 */
	@Override
	public int getMonthMember() {
		return adminMapper.monthMember();
	}

	/* 저번달 가입 회원 수 */
	@Override
	public int getLastMonthMember() {
		return adminMapper.lastMonthMember();
	}

	/* 1일전 ~ 5일전 가입 회원 수 */
	@Override
	public int getMinus1Member() {return adminMapper.mi1Member();}
	@Override
	public int getMinus2Member() {return adminMapper.mi2Member();}
	@Override
	public int getMinus3Member() {return adminMapper.mi3Member();}
	@Override
	public int getMinus4Member() {return adminMapper.mi4Member();}
	@Override
	public int getMinus5Member() {return adminMapper.mi5Member();}
	
	
}
