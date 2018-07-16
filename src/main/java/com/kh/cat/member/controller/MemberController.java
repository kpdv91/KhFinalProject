package com.kh.cat.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.member.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired MemberService memberService;
	
	//로그인 폼
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("loginForm 페이지 요청");
		return "member/loginForm";
	}
	
	//로그인
	@RequestMapping(value = "/login")
	public ModelAndView loginConfirmPage (@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("login 요청");
		return memberService.login(params, session);
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request ){
		session = request.getSession(false);		
		if(session != null) {
			session.invalidate();
			System.out.println("로그아웃 처리 완료");
		}
		return "home";
	}
	
	//회원 가입폼
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		logger.info("joinForm 페이지 요청");
		return "member/joinForm";
	}
	
	//회원 가입
	@RequestMapping(value="join", method=RequestMethod.POST)
	public ModelAndView join(@RequestParam HashMap<String, String> map) {
		logger.info("회원 가입 요청");
		logger.info("id : {}",map.get("userId"));
		logger.info("pw : {}",map.get("userPw"));
		logger.info("name : {}",map.get("userName"));
		logger.info("email : {}",map.get("userEmail"));
		logger.info("phone : {}",map.get("userPhone"));
		logger.info("profile : {}",map.get("profile"));
		//성공 = result.jsp, 실패 = writeForm.jsp
		/*logger.info("등록 요청 : "+pass);
		//평문의 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		hash = encoder.encode(pass);
		//salt 값으로 인하여 같은 평문도 다른 해시로 만든다.
		logger.info("암호문 : "+hash);
		logger.info("암호문 길이: "+hash.length());*/
		return memberService.join(map);
	}	
		
	//파일 업로드 폼
	@RequestMapping(value = "/fileUploadForm")
	public String fileUploadForm() {
		logger.info("파일 업로드 페이지 이동");
		return "member/fileUploadForm";
	}

	//파일 업로드
	@RequestMapping(value = "/fileUpload")
	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		logger.info("fileUpload 요청");
		String root = session.getServletContext().getRealPath("/");
		return memberService.fileUpload(file,root);
	}
	
	@RequestMapping(value = "/profileimg")
	public @ResponseBody HashMap<String, Object> profileimg(@RequestParam Map<String,String> params) {
		logger.info("프로필 사진 불러오기 요청");			
		return memberService.profileimg(params);
	}
	
	@RequestMapping(value = "/profileunder")
	public @ResponseBody HashMap<String, Object> profileunder(@RequestParam Map<String,String> params) {
		logger.info("프로필 사진 불러오기 요청");			
		return memberService.profileunder(params);
	}
	
	//ID 찾기 폼
	@RequestMapping(value = "/findIdForm", method = RequestMethod.GET)
	public String findIdForm() {
		logger.info("ID 찾기 페이지 요청");
		return "member/findIdForm";
	}

	/*//ID 찾기
	@RequestMapping(value = "/findId")
	public @ResponseBody HashMap<String, String> map (@RequestParam Map<String,String> params) {
		logger.info("ID 찾기 요청");
		return memberService.findId(params);
	}*/
	
	//ID 찾기
	@RequestMapping(value = "/findId")
	public ModelAndView findId (@RequestParam HashMap<String,String> params) {
		logger.info("ID 찾기 요청");
		return memberService.findId(params);
	}
	
	//회원정보수정
	@RequestMapping(value = "/timelineuserupdate")
	public @ResponseBody HashMap<String, Object> timelineuserupdate (@RequestParam HashMap<String,String> params) {
		logger.info("회원 정보 요청");
		return memberService.timelineuserupdate(params);
	}
}
