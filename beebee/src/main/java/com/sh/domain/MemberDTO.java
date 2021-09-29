package com.sh.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String email;
	private String nickname;
	private String pwd;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd hh:mm") // 년도/월/일 시간:분
	private Date regdate;
	@DateTimeFormat(pattern = "yyyy/MM/dd hh:mm")
	private Date updateDate;
	
	public MemberDTO(String email, String nickname, String pwd, Date regdate, Date updateDate) {
		this.email = email;
		this.nickname = nickname;
		this.pwd = pwd;
		this.regdate = regdate;
		this.updateDate = updateDate;
	}
	
	
}
