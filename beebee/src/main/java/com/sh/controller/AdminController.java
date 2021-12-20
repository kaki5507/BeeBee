package com.sh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.service.AdminService;
import com.sh.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	private AdminService service;
	
	@GetMapping("/admin-home")
	public void homeAdmin(){
		
	}
	
	@GetMapping("/admin-mem")
	public void memberAdmin(Model model) {
		model.addAttribute("memToTal", service.getTotalMember()); // �� ȸ�� �� 
		model.addAttribute("memWeek", service.getWeekMember()); // �̹��� ���� ȸ�� �� 
		model.addAttribute("memToday", service.getTodayMember()); // ���� ���� ȸ�� ��
		model.addAttribute("memMonth", service.getMonthMember()); // �̹��� ���� ȸ��
		model.addAttribute("memLastMonth", service.getLastMonthMember()); // ������ ���� ȸ��
		model.addAttribute("memMinus1", service.getMinus1Member()); // 1���� ~ 5����
		model.addAttribute("memMinus2", service.getMinus2Member());
		model.addAttribute("memMinus3", service.getMinus3Member());
		model.addAttribute("memMinus4", service.getMinus4Member());
		model.addAttribute("memMinus5", service.getMinus5Member());
	}
	
	@GetMapping("/admin-board")
	public void boardAdmin() {
		
	}
}
