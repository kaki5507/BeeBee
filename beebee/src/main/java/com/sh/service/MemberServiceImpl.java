package com.sh.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.domain.AuthVO;
import com.sh.domain.MemberVO;
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
		mapper.insert(member);
		log.info("register......"+member);
		log.info("이메일 "+ member.getUserEmail());
		log.info("닉네임 "+ member.getUserNickName());
		log.info("비밀번호 "+ member.getUserPwd());
		log.info("생성일 "+ member.getRegDate());
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
	public int nickNameCheck(String userNickName) {
		int cnt = mapper.nickNameCheck(userNickName);
		return cnt;
	}

	// 로그인
	@Override
	public int login(MemberVO member) {
		
		int result = mapper.login(member);
		
		return result;
	}

	@Override
	public MemberVO getByEmail(String userEmail) {
		
		log.info("getByEmail..");
		
		return mapper.getByEmail(userEmail);
	}
	
}
