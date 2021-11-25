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
	
	
	// ȸ�� ����
	@Override
	public void register(MemberVO member) {
		mapper.insert(member);
		log.info("register......"+member);
		log.info("�̸��� "+ member.getUserEmail());
		log.info("�г��� "+ member.getUserNickName());
		log.info("��й�ȣ "+ member.getUserPwd());
		log.info("������ "+ member.getRegDate());
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
	public int nickNameCheck(String userNickName) {
		int cnt = mapper.nickNameCheck(userNickName);
		return cnt;
	}

	// �α���
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
