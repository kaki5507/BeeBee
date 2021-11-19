package com.sh.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.domain.MemberVO;
import com.sh.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/login/*")
@Log4j
@AllArgsConstructor
public class LoginController {
	
	private MemberService service;
	
	@GetMapping("/login-custom")
	public void loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout","Logout!!");
		}
	}
	
	/*
	// 로그인 요청
	@PostMapping("/loginCheck")
	public String login(HttpSession session,RedirectAttributes rttr,@Param("email") String email,@Param("pwd") String pwd) {
		
		String path = "";
		
		MemberVO member = new MemberVO();
		
		member.setEmail(email);
		member.setPwd(pwd);
		
		int result = service.login(member);
		
		if(result == 1) {
			path = "redirect:/home";
			session.setAttribute("login_info", member);
			rttr.addFlashAttribute("member",service.getByEmail(email)); //Flash 일회성
		}else {
			path = "redirect:/login/login";
			session.setAttribute("login_info", null);
		}
		
		return path;
	}
	*/
}
