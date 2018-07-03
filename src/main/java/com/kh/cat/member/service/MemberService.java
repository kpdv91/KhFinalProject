package com.kh.cat.member.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.member.dao.MemberInter;

@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SqlSession sqlSession;
	MemberInter inter;
	
	
	public ModelAndView login(HashMap<String, String> params) {
		logger.info("login 서비스 요청");
		inter = sqlSession.getMapper(MemberInter.class);
		
		String id = params.get("id");
		String pw = params.get("pw");
		
		logger.info("아이디 : "+id+" / 비밀번호 : "+pw);
		
		String result = inter.login(id, pw);
		logger.info(""+result);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("success", result);
		mav.setViewName("member/loginForm");
		return mav;
	}

}
