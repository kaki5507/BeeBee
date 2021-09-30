package com.sh.service;

import java.util.List;

import com.sh.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO member) ;

	public List<MemberVO> selectList();
	
	public int emailCheck(String email);
	
}
