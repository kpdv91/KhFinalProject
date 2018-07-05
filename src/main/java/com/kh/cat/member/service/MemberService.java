package com.kh.cat.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.dto.MemberDTO;
import com.kh.cat.member.dao.MemberInter;


@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SqlSession sqlSession;
	MemberInter inter;
	
	public ModelAndView login(HashMap<String, String> params,HttpSession session) {
		logger.info("로그인 체크요청");
		inter = sqlSession.getMapper(MemberInter.class);
		
		String id = params.get("id");
		String pw = params.get("pw");
		logger.info("아이디 : "+id+" / 비밀번호 : "+pw);
		session.setAttribute("loginId", id); 
		logger.info("세션값 체크 : {}", session.getAttribute("loginId"));
		String result = inter.login(id, pw);
		logger.info(""+result);
		
		String page = "main";
		String msg = "success";
		
		if(result == null) {
			page = "member/loginForm";
			msg = "fail";
		} 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);//모델에 들어갈 내용
		mav.setViewName(page);//반환 페이지
		
		return mav;
	}

	public ModelAndView join(HashMap<String, String> map) {
		
		inter = sqlSession.getMapper(MemberInter.class);
		/*map -> dto*/
		MemberDTO dto = new MemberDTO();
		dto.setId(map.get("userId"));
		dto.setPw(map.get("userPw"));
		dto.setName(map.get("userName"));
		dto.setEmail(map.get("userEmail"));
		
		int success = inter.join(dto);
		logger.info("결과값 : {}",success);
		String page ="joinForm";
		String msg = "회원가입에 실패 했습니다.";
		
		if(success == 1) {
			page ="main";
			msg = "회원가입에 성공 했습니다.";
		}
		//Model + view 한꺼번에 담을 수 있다.
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);//모델에 들어갈 내용
		mav.setViewName(page);//반환 페이지 내용
		return mav;
	}
	
	
	/*//로그인
	public void login(String id, String pw) {
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		System.out.println(id+pw);
		//DB 작업이 필요 하기 때문에 BbsDAO 객체화.
		MainDAO dao = new MainDAO();
		Boolean result = dao.login(id,pw);
		DTO dto = new DTO();
		PwDTO pwdto = new PwDTO();
		pwdto.setLoginidDTO(id);
		
		System.out.println("pwdto.getLoginidDTO() : "+pwdto.getLoginidDTO());
		
		String msg = "아이디 또는 비밀번호를 확인해주세요";
		
		if(result==true) {
			System.out.println("로그인 성공");
			//JAVA에서 내장객체가 아니기 때문에 session 불러오자
			HttpSession session = request.getSession();
			session.setAttribute("loginId", id);
			session.setAttribute("loginPw", pw);
			if(id.startsWith("s")) {
				response.sendRedirect("smain");
			}else if(id.startsWith("p")) {
				response.sendRedirect("pmain");
			}else {
				response.sendRedirect("student");
			}
		}else {
			System.out.println("로그인 실패");
			request.setAttribute("msg", msg);
			RequestDispatcher dis =request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}
	}*/
	
	/*public boolean login(String id, String pw) {
		
		inter = sqlSession.getMapper(MemberInter.class);
		boolean success = false;
		if(inter.login(id, pw) != null) {
			success = true;
		}
		
		return true;
	}*/
	
	/*public ModelAndView login(HashMap<String, String> params, HttpSession session) {
		logger.info("login 서비스 요청");
		inter = sqlSession.getMapper(MemberInter.class);
		
		String id = params.get("id");
		String pw = params.get("pw");
		session.setAttribute("userId", id);
		logger.info("아이디 : "+id+" / 비밀번호 : "+pw);
		
		String result = inter.login(id, pw);
		logger.info(""+result);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("success", result);
		mav.setViewName("main");
		return mav;
	}*/
	
	
	/*public ModelAndView login(HashMap<String, String> params) {
		logger.info("로그인 체크요청");
		inter = sqlSession.getMapper(MemberInter.class);
		
		String id = params.get("userId");
		String pw = params.get("userPw");
		logger.info("아이디 : "+id+" / 비밀번호 : "+pw);
		
		String result = inter.login(id, pw);
		logger.info(""+result);
		
		String page = "main";
		String msg = "success";
		
		if(result == null) {
			page = "member/loginForm";
			msg = "fail";
		} 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);//모델에 들어갈 내용
		mav.setViewName(page);//반환 페이지
		
		return mav;
	}*/


	

}
