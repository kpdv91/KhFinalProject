package com.kh.cat.member.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cat.common.dao.CommonInter;
import com.kh.cat.dto.MemberDTO;
import com.kh.cat.member.dao.MemberInter;


@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SqlSession sqlSession;
	MemberInter inter;
		
	String hash = "";
	
	//회원가입
	public ModelAndView join(HashMap<String, String> map,@RequestParam("userPw") String pass) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		hash = encoder.encode(pass);				
		
		inter = sqlSession.getMapper(MemberInter.class);
		/*map -> dto*/
		MemberDTO dto = new MemberDTO();
		dto.setId(map.get("userId"));
		//dto.setPw(map.get("userPw"));
		dto.setPw(hash);
		dto.setName(map.get("userName"));
		dto.setEmail(map.get("userEmail"));
		dto.setPhone(map.get("userPhone"));
		//dto.setProfile(map.get("profile"));
		
		for(String key:fileList.keySet()) {//map에서 키를 뽑아온다.
			dto.setProfile(key);
		}
		
		int success = inter.join(dto);
		logger.info("결과값 : {}",success);
		//실패할 경우 page, msg
		String page ="joinForm";
		String msg = "회원가입에 실패 했습니다.";
		
		if(success == 1) {//회원가입 성공시
			page ="main";
			msg = "회원가입에 성공 했습니다.";
		}
		//Model + view 한꺼번에 담을 수 있다.
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);//모델에 들어갈 내용
		mav.setViewName(page);//반환 페이지 내용
		return mav;
	}
	
	
	
	
	//로그인
	public ModelAndView login(HashMap<String, String> params,HttpSession session, @RequestParam("pw") String pass) {
		logger.info("로그인 체크요청");
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberDTO dto = new MemberDTO();
		inter = sqlSession.getMapper(MemberInter.class);
		
		String id = params.get("id");
		String pw = params.get("pw");
		hash = inter.getPw(id);
		logger.info(hash);
		
		
	/*	boolean success = encoder.matches(pass, hash);
		logger.info("pass : "+pass);
		logger.info("hash : "+hash);
		logger.info("일치 여부 : "+success);*/
		//String msg = "not matched.";
		/*if(success) {
			msg = "matched.";
		}*/		

		//String profile = params.get("profile");
		logger.info("아이디 : "+id+" / 평문화 비밀번호 : "+pw);
		logger.info("아이디 : "+id+" / 암호화 비밀번호 : "+hash);
		String profile = inter.getprofile(id);
		//String result = inter.login(id, hash);
		String result = inter.login(id, pw);
		logger.info("result는 ? : "+result);
		
		boolean success = encoder.matches(pw, hash);
		logger.info("일치 여부 : "+success);
		
		//String msg = "로그인 성공";
		String page = "main";
		
		/*String msg = "로그인 실패";
		String page = "member/loginForm";*/
		if(result==null) {
			//msg = "로그인 실패";
			page = "member/loginForm";
			
			if(success==true){
				//msg = "로그인 성공";
				//page = "main";
				session.setAttribute("loginId", id);
				session.setAttribute("loginProfile", profile);
				//msg = "로그인 성공";
				page = "main";
				logger.info("세션값 체크 : {}", session.getAttribute("loginId"));
				logger.info("세션값 체크 : {}", session.getAttribute("loginProfile"));
				logger.info("이동할 페이지 : {}", page);
				//logger.info("발생할 메시지 : {}", msg);
			}
		
		}
		
		logger.info("이동할 페이지 2 : {}", page);
		//logger.info("발생할 메시지 2: {}", msg);
		ModelAndView mav = new ModelAndView();
		//mav.addObject("msg", msg);//모델에 들어갈 내용
		mav.setViewName(page);//반환 페이지
		
		return mav;
	}
		
		

		
		//logger.info("해당 ID의 aut : "+result);
				
		/*String page = "main";
		String msg = "success";
		System.out.println(result);
		if(result == null) {
			page = "member/loginForm";
			msg = "fail";
		}else if(result == "admin"){
			page = "member/joinForm";
			msg = "관리자 메인 페이지";
		}else {
			session.setAttribute("loginId", id); 
			logger.info("세션값 체크 : {}", session.getAttribute("loginId"));
		}*/
		
		/*String page = "main";
		String msg = "success";
		System.out.println(result);
		if(pw == hash) {
			page = "member/loginForm";
			msg = "로그인 실패";
		}		
		if(result == null) {
			page = "member/loginForm";
			msg = "로그인 실패";
		}else{
			page = "main";
			msg = "로그인 성공";
			session.setAttribute("loginId", id);
			session.setAttribute("loginProfile", profile);
			logger.info("세션값 체크 : {}", session.getAttribute("loginId"));
			logger.info("세션값 체크 : {}", session.getAttribute("loginProfile"));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);//모델에 들어갈 내용
		mav.setViewName(page);//반환 페이지
	
		return mav;
	} */

	
	
	//ID 중복 체크
    public Map<String, String> overlay(String id) {
        inter = sqlSession.getMapper(MemberInter.class);
        Map<String, String> json = new HashMap<String, String>();
        String use = "N";        
        if(inter.overlay(id) == null){
            use = "Y";
        }        
        json.put("use", use);
        return json;
    }


	//파일올리기
	HashMap<String, String> fileList = new HashMap<String, String>();

	public ModelAndView fileUpload(MultipartFile file, String root) {
		ModelAndView mav = new ModelAndView();
		String fullPath = root+"resources/upload/";
		logger.info(fullPath);
		//1. 폴더가 없을 경우 폴더 생성
		File dir = new File(fullPath);
		if(!dir.exists()) {
			logger.info("fileUpload 서비스메서드, 폴더 없음, 생성 시작");
			dir.mkdir();
		}
		//2. 파일명 추출
		String oriFileName = file.getOriginalFilename();
		//3. 새로운 파일명 생성
		String newFileName = System.currentTimeMillis()+oriFileName.substring(oriFileName.lastIndexOf("."));
		//4. 새 파일명으로 파일 변경
		try {
			byte[] bytes = file.getBytes(); //MultipartFile에서부터 바이트 추출
			Path filePath = Paths.get(fullPath+newFileName); //파일 생성 경로
			Files.write(filePath, bytes); //파일 생성
			fileList.put(newFileName, oriFileName);
			logger.info("저장할 파일 개수 : {}", fileList.size());
			logger.info("사진 파일 저장경로 : ",filePath);
			mav.addObject("path", "resources/upload/"+newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("member/fileUploadForm");
		return mav;
		//자바 nio는 자바 버전 7 이상에서 쓸수있음... io보다 빠름
		//파일 업로드 자체는 db 쓰지 않기때문에 interface 안가도 된다!
	}


	public HashMap<String, Object> profileimg(Map<String, String> params) {
		inter = sqlSession.getMapper(MemberInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("profileimg", inter.profileimg(id));
		return map;
	}


	public HashMap<String, Object> profileunder(Map<String, String> params) {
		inter = sqlSession.getMapper(MemberInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("profile", inter.profileunder(id));
		return map;
	}

/*	//ID 찾기
	public HashMap<String, Object> findId(Map<String, String> params) {
		inter = sqlSession.getMapper(MemberInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String name = params.get("userName");
		String email = params.get("userEmail");
		logger.info("이름 : "+name+" / 이메일 : "+email);
		map.put("findId", inter.findId(name,email));
		//logger.info("찾는 id : " +inter.findId(name,email));
		return map;	
	}*/
	
	//ID 찾기
	public String findId(Map<String, String> params, HttpSession session,Model model) {
		inter = sqlSession.getMapper(MemberInter.class);
		HashMap<String, String> map = new HashMap<String, String>();
		String name = params.get("userName");
		String email = params.get("userEmail");
		logger.info("이름 : "+name+" / 이메일 : "+email);
		//map.put("findId", inter.findId(name,email));
		String find = inter.findId(name,email);
		int find2 = inter.findId2(name,email);
		logger.info("찾는 id : " +find);
		logger.info("찾는 id2 : " +find2);
		//session.setAttribute("findId", find);
		//ModelAndView mav = new ModelAndView();
		StringBuffer sb = new StringBuffer(find);
		if(find.length()==5) {
			sb.replace(2, find.length()-1, "**");
		}else if(find.length()==6) {
			sb.replace(2, find.length()-1, "***");
		}else if(find.length()==7) {
			sb.replace(2, find.length()-1, "****");
		}else if(find.length()==8) {
			sb.replace(2, find.length()-1, "*****");
		}else if(find.length()>8) {
			sb.replace(2, find.length()-1, "******");
		}
		 session.setAttribute("findId", sb);
		 session.setAttribute("findId2", sb);
	
		logger.info("치환된 문자열 : "+sb);
		
		String msg = "";
		
		/*if(find == null) {
			//page = "member/loginForm";
			msg = "정보 불일치";
		}else{
			//page = "main";
			msg = "정보 일치";
			session.setAttribute("loginId", id);
			session.setAttribute("loginProfile", profile);
			logger.info("세션값 체크 : {}", session.getAttribute("loginId"));
			logger.info("세션값 체크 : {}", session.getAttribute("loginProfile"));
		}*/
			/*mav.addObject("find",find);
			mav.addObject("msg",msg);*/
			model.addAttribute("find",find);
			//return "member/findIdForm";	
			return "redirect:/";
		}


	public HashMap<String, Object> timelineuserupdate(HashMap<String, String> params) {
		inter = sqlSession.getMapper(MemberInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("update", inter.userdetail(id));
		return map;
	}

	

	 

	    
	}




