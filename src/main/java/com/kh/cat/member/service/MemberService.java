package com.kh.cat.member.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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

		String result = inter.login(id, pw);
		logger.info(""+result);
				
		String page = "main";
		String msg = "success";
		System.out.println(result);
		if(result == null) {
			page = "member/loginForm";
			msg = "fail";
		}else {
			session.setAttribute("loginId", id); 
			logger.info("세션값 체크 : {}", session.getAttribute("loginId"));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);//모델에 들어갈 내용
		mav.setViewName(page);//반환 페이지
		
		return mav;
	}

	
	//보네 - 회원가입
	public ModelAndView join(HashMap<String, String> map) {
		
		inter = sqlSession.getMapper(MemberInter.class);
		/*map -> dto*/
		MemberDTO dto = new MemberDTO();
		dto.setId(map.get("userId"));
		dto.setPw(map.get("userPw"));
		dto.setName(map.get("userName"));
		dto.setEmail(map.get("userEmail"));
		dto.setPhone(map.get("userPhone"));
		
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
	
	//중복체크
	public void overlay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		System.out.println("param :"+id);
		MemberDAO dao = new MemberDAO();
		boolean overlay = dao.overlay(id);
		
		//Gson 객체생성
		Gson json = new Gson();
		//map 생성
		HashMap<String, Boolean> map = new HashMap<>();
		//map 에 값 추가
		map.put("overlay", overlay);
		//json 으로 변경
		String obj = json.toJson(map);
		//response 로 변환(옵션1 :한글깨짐,옵션2 : 크로스 도메인)
		response.getWriter().println(obj);
	}
	



	// 보네 - 파일올리기
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


	/*@Service
	public class OverlayService {
	 
	    @Autowired
	    SqlSession sqlSession;
	 
	    private Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	    OverlayInterface inter = null;*/
	 
	// 이메일 중복확인
	    public Map<String, String> idAuth(String id) {
	        Map<String, String> jsonObj = new HashMap<String, String>();
	 
	        inter = sqlSession.getMapper(MemberInter.class);
	        String idAuth = inter.idAuth(id);
	 
	        if (idAuth != null) {
	            jsonObj.put("chk", "-1");
	        } else {
	            jsonObj.put("chk", "1");
	        }
	        return jsonObj;
	    }
	    
	}




