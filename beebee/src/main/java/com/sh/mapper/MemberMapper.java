package com.sh.mapper;

import java.util.HashMap;
import java.util.List;

import com.sh.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userEmail);
	
	/*
	public void insert(MemberVO member);
	
	public List<MemberVO> selectList();
	
	public int emailCheck(String email);
	
	public int nickNameCheck(String nickName);
	
	public void createAuthKey(String email, String authKey);
	
	public int login(MemberVO member);
	
	public MemberVO getByEmail(String email);]
	*/
}
