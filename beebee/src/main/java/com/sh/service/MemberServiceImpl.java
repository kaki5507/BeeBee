package com.sh.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.domain.MemberVO;
import com.sh.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	
	/*
	// ȸ�� ����
	@Override
	public void register(MemberVO member) {
		
		mapper.insert(member);
		
		log.info("register......"+member);
		log.info("�̸��� "+ member.getEmail());
		log.info("�г��� "+ member.getNickName());
		log.info("��й�ȣ "+ member.getPwd());
		log.info("������ "+ member.getRegdate());
	}

	// ȸ�� ����Ʈ
	@Override
	public List<MemberVO> selectList() {
		
		log.info("getList....");
		
		return mapper.selectList();
	}

	// ���̵� �ߺ� üũ
	@Override
	public int emailCheck(String email) {
		int cnt = mapper.emailCheck(email);
		return cnt;
	}

	// �г��� �ߺ� üũ
	@Override
	public int nickNameCheck(String nickName) {
		int cnt = mapper.nickNameCheck(nickName);
		return cnt;
	}

	// �α���
	@Override
	public int login(MemberVO member) {
		
		int result = mapper.login(member);
		
		return result;
	}

	@Override
	public MemberVO getByEmail(String email) {
		
		log.info("getByEmail..");
		
		return mapper.getByEmail(email);
	}
	*/
	
	
}
