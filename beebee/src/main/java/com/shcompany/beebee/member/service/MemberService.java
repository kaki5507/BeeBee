package com.shcompany.beebee.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.shcompany.beebee.member.Member;
import com.shcompany.beebee.member.dao.MemberDao;


public class MemberService implements IMemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public void memberRegister(String mId, String mPwd,String mPhone1, String mPhone2, String mPhone3) {
		System.out.println("memberRegister()");
		System.out.println("mId : " + mId);
		System.out.println("mPwd : " + mPwd);
		System.out.println("mPhone : " + mPhone1 + " - " + mPhone2 + " - " + mPhone3);
		
		dao.memberInsert(mId, mPwd, mPhone1, mPhone2, mPhone3);
	}

	@Override
	public Member memberSearch(String mId, String mPwd) {
		System.out.println("memberSearch()");
		System.out.println("mId : " + mId);
		System.out.println("mPwd : " + mPwd);
		
		Member member = dao.memberSelect(mId, mPwd);
		
		return member;
	}

	@Override
	public void memberModify() {
		
	}

	@Override
	public void memberRemove() {
		
	}

}