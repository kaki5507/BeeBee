package com.sh.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	// 이용약관,개인정보 수집 동의 화면
	@GetMapping("/stipulation/privacy")
	public void privacy() {
		log.info("이용약관");
	}
	@GetMapping("/stipulation/service")
	public void service() {
		log.info("이용약관");
	}
	
	// 회원 정보 입력 화면
	@GetMapping("/register-identi")
	public void register_identi() {
		
	}
	
	// 회원 정보 입력 
	@PostMapping("/register-identi")
	public String register_identi(MemberVO member) {
		log.info("register : " + member);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePwd = encoder.encode(member.getUserPwd());
		member.setUserPwd(securePwd);
		
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
	
	// 이메일 인증 세션값 가져오기
	@GetMapping("/emailConfirm")
	@ResponseBody
	public String emailConfirm(HttpSession session) {
		
		String result = (String) session.getAttribute("joinCode");
		log.info("email 인증검사 포스트 매핑");
		log.info("result :"+result);
		
		return result;
	}
	
	// 이메일 인증번호 보내기
	@PostMapping("/emailSend")
	@ResponseBody
	public boolean sendMailAuth(HttpSession session, @RequestParam(value="email") String email) {
		int ran = new Random().nextInt(100000) + 10000;
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joinCode + "입니다."); 
		
		return mailservice.send(subject, sb.toString(), "ckdbioksh@gmail.com", email);
	}

	// 회원 가입 완료
	@GetMapping("/register-clear")
	public void register_clear() {
		
		log.info("회원가입이 완료되었습니다.");
	}
}
