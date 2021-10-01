package com.sh.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String email;
	private String nickName;
	private String pwd;
	private Date regdate;
	private Date updateDate;
	
}
