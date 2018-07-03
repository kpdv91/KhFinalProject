package com.kh.cat.store.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	//가게등록 페이지 이동
	@RequestMapping(value = "/storeRegistForm", method = RequestMethod.GET)
	public String storeRegistForm() {
		return "store/storeRegistForm";
	}
	
	//대표사진 등록 페이지 이동
	@RequestMapping(value = "/sPhotoUpload", method = RequestMethod.GET)
	public String sPhotoUpload() {
		logger.info("대표사진 올리기");
		return "store/sPhotoUpload";
	}
}
