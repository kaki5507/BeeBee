package com.sh.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.sh.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	
	private static final long serialVesionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String userEmail, String userPwd,Collection<? extends GrantedAuthority> authorities) {
		super(userEmail, userPwd ,authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getUserEmail(), vo.getUserPwd(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		this.member = vo;
	}
	
}
