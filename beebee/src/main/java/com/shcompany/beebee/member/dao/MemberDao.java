package com.shcompany.beebee.member.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.shcompany.beebee.member.Member;

//@Component
@Repository
public class MemberDao implements IMemberDao {

	private HashMap<String, Member> dbMap;
	
	public MemberDao() {
		dbMap = new HashMap<String, Member>();
	}
	
	@Override
	public void memberInsert(String mId, String mPwd, String mPhone1, String mPhone2, String mPhone3) {
		System.out.println("memberInsert()");
		System.out.println("mId : " + mId);
		System.out.println("mPwd : " + mPwd);
		System.out.println("mPhone : " + mPhone1 + " - " + mPhone2 + " - " + mPhone3);
		
		Member member = new Member();
		member.setmId(mId);
		member.setmPwd(mPwd);
		member.setmPhone1(mPhone1);
		member.setmPhone2(mPhone2);
		member.setmPhone3(mPhone3);
		
		dbMap.put(mId, member);
		
		Set<String> keys = dbMap.keySet();
		Iterator<String> iterator = keys.iterator();
		
		while (iterator.hasNext()) {
			String key = iterator.next();
			Member mem = dbMap.get(key);
			System.out.print("memberId:" + mem.getmId() + "\t");
			System.out.print("|memberPw:" + mem.getmPwd() + "\t");
			System.out.print("|memberPhone:" + mem.getmPhone1() + " - " + 
											   mem.getmPhone2() + " - " + 
											   mem.getmPhone3() + "\n");
		}
		
	}

	@Override
	public Member memberSelect(String mId, String mPwd) {
		Member member = dbMap.get(mId);
		
		return member;
	}

	@Override
	public void memberUpdate() {

	}

	@Override
	public void memberDelete() {

	}

}