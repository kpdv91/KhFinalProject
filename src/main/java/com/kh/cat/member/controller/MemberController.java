package com.kh.cat.member.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.member.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired MemberService memberService;

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("loginForm 페이지 요청");
		return "loginForm";
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam HashMap<String, String> params) {
		logger.info("login 요청");
		return memberService.login(params);
	}
	


	
	

}
