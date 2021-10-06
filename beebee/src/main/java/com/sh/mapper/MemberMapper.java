package com.sh.mapper;

import java.util.List;

import com.sh.domain.MemberVO;

public interface MemberMapper {

	public void insert(MemberVO member);
	
	public List<MemberVO> selectList();
	
	public int emailCheck(String email);
	
	public int nickNameCheck(String nickName);
	
	public void createAuthKey(String email, String authKey);
}
