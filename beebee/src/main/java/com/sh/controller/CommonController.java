package com.sh.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@Log4j
public class CommonController {

	@GetMapping("/accessError")
	public void accessDenined(Authentication auth, Model model) {
		
		log.info("access Denined : " + auth);
		
		model.addAttribute("msg", "Access Denined");
	}
}
