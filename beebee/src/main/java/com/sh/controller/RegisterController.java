package com.sh.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.sh.domain.MemberVO;
import com.sh.service.MailService;
import com.sh.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/register/*")
@Log4j
@AllArgsConstructor
public class RegisterController {
	
	private MemberService service;
	
	private MailService mailservice;
	
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
	
	// �̿���,�������� ���� ���� ȭ��
	@GetMapping("/stipulation/privacy")
	public void privacy() {
		log.info("�̿���");
	}
	@GetMapping("/stipulation/service")
	public void service() {
		log.info("�̿���");
	}
	
	// ȸ�� ���� �Է� ȭ��
	@GetMapping("/register-identi")
	public void register_identi() {
		
	}
	
	
	
	
	/*
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
	
	// �̸��� ���� ���ǰ� ��������
	@GetMapping("/emailConfirm")
	@ResponseBody
	public String emailConfirm(HttpSession session) {
		
		String result = (String) session.getAttribute("joinCode");
		log.info("email �����˻� ����Ʈ ����");
		log.info("result :"+result);
		
		return result;
	}
	
	// �̸��� ������ȣ ������
	@PostMapping("/emailSend")
	@ResponseBody
	public boolean sendMailAuth(HttpSession session, @RequestParam(value="email") String email) {
		int ran = new Random().nextInt(100000) + 10000;
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		
		String subject = "ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
		StringBuilder sb = new StringBuilder();
		sb.append("������ ���� �ڵ�� " + joinCode + "�Դϴ�."); 
		
		return mailservice.send(subject, sb.toString(), "ckdbioksh@gmail.com", email);
	}
	*/
    

	// ȸ�� ���� �Ϸ�
	@GetMapping("/register-clear")
	public void register_clear() {
		
		log.info("ȸ�������� �Ϸ�Ǿ����ϴ�.");
	}
}
