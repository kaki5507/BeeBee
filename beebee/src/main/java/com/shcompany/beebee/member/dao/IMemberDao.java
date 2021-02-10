package com.shcompany.beebee.member.dao;

import com.shcompany.beebee.member.Member;

public interface IMemberDao {
	void memberInsert(String mId, String mPwd, String mPhone1, String mPhone2, String mPhone3);
	Member memberSelect(String mId, String mPwd);
	void memberUpdate();
	void memberDelete();
}
