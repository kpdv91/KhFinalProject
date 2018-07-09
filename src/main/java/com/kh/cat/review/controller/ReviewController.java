package com.kh.cat.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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

import com.kh.cat.review.service.ReviewService;

@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired ReviewService service;
	
	@RequestMapping(value = "/reviewWritePage")
	public String reviewWritePage() {
		
		System.out.println("리뷰 작성 페이지 요청");
		return "review/reviewWrite";
	}
	
	@RequestMapping(value = "/uploadForm")
	public String uploadForm() {
		logger.info("파일 업로드 페이지 이동");
		return "review/uploadForm";
	}
	
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public ModelAndView fileupload(MultipartFile file, HttpSession session) {
		System.out.println("파일 업로드 요청");
		String root = session.getServletContext().getRealPath("/");
		return service.upload(file,root);
	}
	
	@RequestMapping(value = "/fileDel")
	public @ResponseBody HashMap<String, Integer> 
		fileDel(@RequestParam("fileName") String fileName, HttpSession session) {
		logger.info("file delete 요청");
		String root = session.getServletContext().getRealPath("/");
		
		return service.fileDel(root,fileName);
	}
	
	@RequestMapping(value= "/reviewWrite")
	public String wirte(@RequestParam("hash_tag") ArrayList<String> hash_tag,
			@RequestParam("review_photo") ArrayList<String> review_photo,@RequestParam HashMap<String, String>map, HttpServletRequest request) {
		logger.info("글쓰기 요청");	
		logger.info(""+map);
	
		String loginId = (String) request.getSession().getAttribute("loginId");
		return service.write(hash_tag, review_photo, map, loginId);
	}
	
	@RequestMapping(value = "/revStoreSearch")
	public @ResponseBody HashMap<String, Object> revStoreSearch(@RequestParam("review_storeName") String params) {
		logger.info("가게 리스트 요청");
		logger.info(params);
		return service.revStoreSearch(params);
	}
	
	/*@RequestMapping(value= "/reviewWrite")
	public ModelAndView wirte(@RequestParam HashMap<String, Object> hash_tag) {
		logger.info("글쓰기 요청");	
		logger.info("해시태그:" + hash_tag.get("hash_tag"));
		return null;
	}*/
	
	//리뷰 리스트 페이지
	@RequestMapping(value = "/reviewListPage")
	public String reviewListPage() {		
		System.out.println("리뷰 작성 페이지 요청");
		return "review/reviewList";
	}
	@RequestMapping(value = "/reviewList")
	public @ResponseBody HashMap<String, Object> reviewList() {
		logger.info("리뷰 리스트 요청");
		return service.reviewList();
	}
	@RequestMapping(value = "/reviewHashPhoto")
	public @ResponseBody HashMap<String, Object> reviewHashPhoto(@RequestParam("review_idx") String review_idx) {
		logger.info("리뷰 해시태그, 사진 요청");
		return service.reviewHashPhoto(review_idx);
	}
	
}
