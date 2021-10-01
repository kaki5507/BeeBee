package com.sh.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.domain.MemberVO;
import com.sh.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/register/*")
@Log4j
@AllArgsConstructor
public class RegisterController {
	
	private MemberService service;
	
	// ȸ������ ù ������
	@GetMapping("/register-welcome")
	public void register_welcome() {
		log.info("ȸ�������� ȯ���մϴ�.");
	}
	
	// �̿���
	@GetMapping("/register-agree")
	public void register_agree() {
		log.info("�̿��� ������ �Դϴ�");
	}
	
	// ȸ�� ���� �Է� ȭ��
	@GetMapping("/register-identi")
	public void register_identi() {
		
	}
	
	// ȸ�� ���� �Է� 
	@PostMapping("/register-identi")
	public String register_identi(MemberVO member) {
		log.info("register : " + member);
		
		service.register(member);
		
		return "redirect:/register/register-clear";
	}
	
	// ���̵� üũ
	// ResponseBody �ڹ� ��ü�� HTTP ��û�� body �������� ����
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam(value="email", required=false) String email){
		log.info("���̵� üũ");
		log.info("���޹��� email : " + email);
		int cnt = service.emailCheck(email);
		log.info("���޹��� cnt" + cnt);
		
		return cnt;
	}
	
	
	// �̸��� üũ ȭ��
	@GetMapping("/emailCheck")
	public String emailCheck() {
		log.info("GET emailCheck");
		return "/register/register-identi";
	}
	
	// �г��� üũ
	@PostMapping("/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam(value="nickName", required=false) String nickName){
		log.info("�г��� üũ");
		log.info("���޹��� nickName : " + nickName);
		int cnt = service.nickNameCheck(nickName);
		log.info("���޹��� cnt" + cnt + "1�̸� ���� 0�̸� ����");
		
		return cnt;
	}	
	
	// ȸ�� ���� �Ϸ�
	@GetMapping("/register-clear")
	public void register_clear() {
		
		log.info("ȸ�������� �Ϸ�Ǿ����ϴ�.");
	}
}
