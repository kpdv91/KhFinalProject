package com.kh.cat.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.admin.service.AdminService;

@Controller
public class AdminController {

	private Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired AdminService adminService;
	
	@RequestMapping(value = "/comp_review_moveWin")
	public ModelAndView sendMessage(@RequestParam HashMap<String, String> params) {
		logger.info("신고된 리뷰 새창 요청");
		ModelAndView mav = new ModelAndView();
		mav.addObject("rev_idx",params.get("rev_idx"));
		mav.addObject("revReply_idx",params.get("revReply_idx"));
		mav.setViewName("admin/complainReviewList");
		return mav;
	}
	// 신고 리스트(관리자)
	@RequestMapping(value = "/complainList")
	public @ResponseBody HashMap<String, Object> complainList(@RequestParam HashMap<String, String> params) {
		logger.info("신고 리스트 요청");
		return adminService.ComplainList(params);
	}

	//가게 등록 리스트(관리자)
	@RequestMapping(value = "/storeRegistList")
	public @ResponseBody HashMap<String, Object> storeRegistList(@RequestParam HashMap<String, String> params) {
		logger.info("가게 등록 리스트 요청");
		return adminService.StoreRegistList(params);
	}
	
	//가게 등록 리스트(관리자)
	@RequestMapping(value = "/blackListAdd")
	public @ResponseBody HashMap<String, Object> blackListAdd(@RequestParam HashMap<String, String> params) {
		logger.info("블랙리스트 추가 요청");
		logger.info("리뷰 idx : {}", params.get("rev_idx"));
		logger.info("리뷰 댓글 idx : {}", params.get("revReply_idx"));
		return adminService.blackListAdd(params);
	}
		
	// 신고된 리뷰 리스트(관리자)
	@RequestMapping(value = "/complain_review_move")
	public @ResponseBody HashMap<String, Object> complain_review_move(@RequestParam HashMap<String, String> params) {
		logger.info("신고 리뷰 리스트 요청");
		logger.info("리뷰 idx : {}", params.get("rev_idx"));
		logger.info("리뷰 댓글 idx : {}", params.get("revRepy_idx"));
		return adminService.complain_reviewList(params);
	}
	//신고된 리뷰 해시태그, 사진
	@RequestMapping(value = "/comp_rev_hash_photo")
	public @ResponseBody HashMap<String, Object> reviewHashPhoto(
			@RequestParam HashMap<String, String> params) {
		logger.info("리뷰 해시태그, 사진 요청");
		logger.info("리뷰 idx : {}", params.get("rev_idx"));
		return adminService.reviewHashPhoto(params);
	}

}
