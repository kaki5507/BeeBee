package com.bee.study;

import com.bee.member.Member;

public class Study {
	
	private String stdNum;
	private String stdTitle;
	private boolean stdPartin;
	private Member stdMember;
	
	public Study(String stdNum, String stdTitle, boolean stdPartin, Member stdMember){
		this.stdNum = stdNum;
		this.stdTitle = stdTitle;
		this.stdPartin = stdPartin;
		this.stdMember = stdMember;
	}

	public String getStdNum() {
		return stdNum;
	}

	public void setStdNum(String stdNum) {
		this.stdNum = stdNum;
	}

	public String getStdTitle() {
		return stdTitle;
	}

	public void setStdTitle(String stdTitle) {
		this.stdTitle = stdTitle;
	}

	public boolean isStdPartin() {
		return stdPartin;
	}

	public void setStdPartin(boolean stdPartin) {
		this.stdPartin = stdPartin;
	}

	public Member getStdMember() {
		return stdMember;
	}

	public void setStdMember(Member stdMember) {
		this.stdMember = stdMember;
	}
	
}
