package com.sh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.domain.Criteria;
import com.sh.domain.PageDTO;
import com.sh.service.BoardService;
import com.sh.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/")
@Log4j
@AllArgsConstructor
public class HomeController {
	
	private BoardService boardService;
	
	@GetMapping("/home")
	public String home(Model model,Criteria cri) {
		
		model.addAttribute("list", boardService.getList(cri));

		int total = boardService.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		return "/main/index";
	}
	
}