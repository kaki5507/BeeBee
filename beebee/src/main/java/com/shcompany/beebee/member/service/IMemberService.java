package com.shcompany.beebee.member.service;

import com.shcompany.beebee.member.Member;

public interface IMemberService {
	void memberRegister(String mId, String mPwd, String mPhone1, String mPhone2, String mPhone3);
	Member memberSearch(String mId, String mPwd);
	void memberModify();
	void memberRemove();
}
