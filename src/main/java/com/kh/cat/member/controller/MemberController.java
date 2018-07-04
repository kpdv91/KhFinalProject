package com.kh.cat.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView loginConfirmPage (@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("login 요청");
		return memberService.login(params, session);
	}
	
	
	/*@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam HashMap<String, String> params) {
		logger.info("login 요청");
		return memberService.login(params);
	}*/
	
	/*@RequestMapping(value = "/login")
	public String login(@RequestParam("id") String id,@RequestParam("pw") String pw,HttpSession session) {
		logger.info("로그인 요청");
		if(memberService.login(id,pw)) {
			session.setAttribute("loginId", id);
		}
		//return "redirect:/list";
		return "main";
	}*/
	


	
	

}
