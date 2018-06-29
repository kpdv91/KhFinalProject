package com.kh.cat.common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PreCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("controller 요청 전에 실행 -- preHandle()");
		System.out.println("세션 검사");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		boolean pass = false;
		if(id==null) {
			System.out.println("로그인 안됨");
			response.sendRedirect("/controller/");
		}else {
			System.out.println("로그인 됨");
			pass = true;
		}
		System.out.println("해당 요청으로 보낼지 true | false로 반환");
		return pass;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		System.out.println("controller 요청 후에서 부터 뷰 전송 사이에 실행 -- postHandle()");
		System.out.println("mav를 이용해서 특정페이지에 특정 데이터 전송가능");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		String content = "<div id='loginArea'>안녕하세요 '"+id+"'님</div>";
		mav.addObject("loginBox", content);
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("controller 요청 처리 완료 후에 실행 -- afterCompletion()");
	}
	
}
