package com.shcompany.beebee.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shcompany.beebee.member.Member;
import com.shcompany.beebee.member.service.MemberService;

@Controller
public class MemberController {


	MemberService service;

	@RequestMapping(value = "/memJoin", method = RequestMethod.POST)
	public String memJoin(Model model, HttpServletRequest request) {
		String mId = request.getParameter("mId");
		String mPwd = request.getParameter("mPwd");
		String mPhone1 = request.getParameter("mPhone1");
		String mPhone2 = request.getParameter("mPhone2");
		String mPhone3 = request.getParameter("mPhone3");

		service.memberRegister(mId, mPwd, mPhone1, mPhone2, mPhone3);

		model.addAttribute("mId", mId);
		model.addAttribute("mPwd", mPwd);
		model.addAttribute("mPhone1", mPhone1+"-"+mPhone2+"-"+mPhone3);
		return "memJoinOk";
	}

	@RequestMapping(value = "/memLogin", method = RequestMethod.POST)
	public String memLogin(Model model, HttpServletRequest request) {

		String mId = request.getParameter("mId");
		String mPwd = request.getParameter("mPw");

		Member member = service.memberSearch(mId, mPwd);

		try {
			model.addAttribute("mId", member.getmId());
			model.addAttribute("mPwd", member.getmPwd());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "memLoginOk";
	}

}