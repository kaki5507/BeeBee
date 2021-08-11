package com.sh.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.domain.SampleDTO;
import com.sh.domain.SampleDTOList;
import com.sh.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@RequestMapping("")
	public void basic() {
		log.info("±âº»...");
	}
	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		
		log.info("" + dto);
		
		return "ex01";
	}
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name,@RequestParam("age") String age) {
		
		log.info("name: "+name);
		log.info("age: "+age);
		
		return "ex01";
	}
	@GetMapping("/ex02list")
	public String ex02list(@RequestParam("ids") ArrayList<String> ids) {
		
		log.info("ids:" + ids);
		
		return "ex02List";
	}
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		
		log.info("list dtos: " + list);
		
		return "ex02Bean";
	}
	
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo: "+todo);
		return "ex03";
	}
}
