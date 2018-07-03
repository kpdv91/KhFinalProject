package com.kh.cat.review.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/timeline", method = RequestMethod.GET)
	public String timeline() {
		System.out.println("타임라인 요청");
		return "timeline/timeline_main";
	}
	
	@RequestMapping(value = "/reviewWritePage")
	public String reviewWritePage() {
		System.out.println("리뷰 작성 페이지 요청");
		return "review/reviewWrite";
	}
}
