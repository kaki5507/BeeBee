package com.sh.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userEmail;
	private String userPwd;
	private String userNickName;
	private boolean enabled;
	
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;
	
}