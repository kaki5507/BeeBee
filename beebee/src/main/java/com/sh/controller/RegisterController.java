package com.sh.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.domain.MemberDTO;
import com.sh.domain.MemberVO;
import com.sh.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/register/*")
@Log4j
public class RegisterController {
	
	private MemberService service;
	
	@GetMapping("/register-welcome")
	public void register_welcome() {
		log.info("ȸ�������� ȯ���մϴ�.");
	}
	
	@GetMapping("/register-agree")
	public void register_agree() {
		log.info("�̿��� ������ �Դϴ�");
	}
	
	@PostMapping("/register-identi")
	public String register_identi(MemberVO member) {
		log.info("register : " + member);
		
		service.register(member);
		
		return "register/register-clear";
		// /register/register-clear
		// void�� �̿��ؼ� return ���ְ�
	}
	
	@GetMapping("/register-clear")
	public void register_clear() {
		log.info("ȸ�������� �Ϸ�Ǿ����ϴ�.");
	}
}
