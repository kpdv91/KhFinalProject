package com.kh.cat.store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.store.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired StoreService storeService;

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	//가게등록 페이지 이동
	@RequestMapping(value = "/storeRegistForm", method = RequestMethod.GET)
	public String storeRegistForm() {
		logger.info("가게등록 페이지 요청.");
		return "store/storeRegistForm";
	}
	
	/*//해쉬테그 추가
	@RequestMapping(value = "/hashTagAdd")
	public @ResponseBody HashMap<String, Object> 
	hashTagAdd(@RequestParam (value="tagList[]") String[] tagArr	
			,@RequestParam(value="hTag") String hTag) {
		logger.info("해쉬태그 추가요청.");
		logger.info("tagArr[] : "+tagArr.length);
		logger.info("tagArr[] : "+tagArr[0]);
		return storeService.hashTagAdd(tagArr, hTag);
	}*/
	
	//메뉴 사진 추가 페이지
	@RequestMapping(value = "/menuPhotoForm", method = RequestMethod.GET)
	public String menuPhotoForm() {
		logger.info("가게등록 페이지 요청.");
		return "store/menuPhotoForm";
	}
	
	//메뉴 사진 업로드 
	@RequestMapping(value = "/menuUpload")
	public ModelAndView upload(MultipartFile file, HttpSession session) {
		logger.info("메뉴 사진 업로드 요청.");
		String root = session.getServletContext().getRealPath("/");
		return	storeService.menuUpload(file, root);
	}
}
