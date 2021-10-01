package com.sh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.domain.MemberVO;
import com.sh.mapper.BoardMapper;
import com.sh.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	// 회원 가입
	@Override
	public void register(MemberVO member) {
		
		log.info("register......"+member);
		
	}

	// 회원 리스트
	@Override
	public List<MemberVO> selectList() {
		
		log.info("getList....");
		
		return mapper.selectList();
	}

	// 아이디 중복 체크
	@Override
	public int emailCheck(String email) {
		int cnt = mapper.emailCheck(email);
		return cnt;
	}

	// 닉네임 중복 체크
	@Override
	public int nickNameCheck(String nickName) {
		int cnt = mapper.nickNameCheck(nickName);
		return cnt;
	}
	
}
