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
	
	// 회원가입 첫 페이지
	@GetMapping("/register-welcome")
	public void register_welcome() {
		log.info("회원가입을 환영합니다.");
	}
	
	// 이용약관
	@GetMapping("/register-agree")
	public void register_agree() {
		log.info("이용약관 페이지 입니다");
	}
	
	// 회원 정보 입력 화면
	@GetMapping("/register-identi")
	public void register_identi() {
		
	}
	
	// 회원 정보 입력 
	@PostMapping("/register-identi")
	public String register_identi(MemberVO member) {
		log.info("register : " + member);
		
		service.register(member);
		
		return "redirect:/register/register-clear";
	}
	
	// 아이디 체크
	// ResponseBody 자바 객체를 HTTP 요청의 body 내용으로 매핑
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam(value="email", required=false) String email){
		log.info("아이디 체크");
		log.info("전달받은 email : " + email);
		int cnt = service.emailCheck(email);
		log.info("전달받은 cnt" + cnt);
		
		return cnt;
	}
	
	
	// 이메일 체크 화면
	@GetMapping("/emailCheck")
	public String emailCheck() {
		log.info("GET emailCheck");
		return "/register/register-identi";
	}
	
	// 닉네임 체크
	@PostMapping("/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam(value="nickName", required=false) String nickName){
		log.info("닉네임 체크");
		log.info("전달받은 nickName : " + nickName);
		int cnt = service.nickNameCheck(nickName);
		log.info("전달받은 cnt" + cnt + "1이면 존재 0이면 없음");
		
		return cnt;
	}	
	
	// 회원 가입 완료
	@GetMapping("/register-clear")
	public void register_clear() {
		
		log.info("회원가입이 완료되었습니다.");
	}
}
