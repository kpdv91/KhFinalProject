package com.kh.cat.store.controller;

import java.util.HashMap;

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
		storeService.menuReset();
		return "store/storeRegistForm";
	}
	
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
	
	//메뉴 사진 삭제
	@RequestMapping(value = "/menuDel")
	public @ResponseBody HashMap<String, Integer> 
	menuDel(@RequestParam("fileName") String fileName, HttpSession session) {
		logger.info("메뉴 삭제 요청.");
		String root = session.getServletContext().getRealPath("/");
		return storeService.fileDel(root, fileName);
	}
	
	//대표 사진 업로드 
		@RequestMapping(value = "/photoUpload")
		public ModelAndView photoUpload(MultipartFile file, HttpSession session) {
			logger.info("대표 사진 업로드 요청.");
			String root = session.getServletContext().getRealPath("/");
			logger.info(file.getOriginalFilename());
			//return storeService.photoUpload(file, root);
			return null;
		}
	
	//맛집 등록
	@RequestMapping(value = "/storeRegist")
	public @ResponseBody HashMap<String, Object> 
	storeRegist(@RequestParam (value="tagList[]") String[] tagArr	
			,@RequestParam HashMap<String, String> data) {
		logger.info("맛집 등록 요청.");
		logger.info("tagArr[] : "+tagArr.length);
		logger.info("tagArr[] : "+tagArr[0]);
		logger.info(data.get("store_addr"));
		return storeService.storeRegist(tagArr, data);
	}
}
