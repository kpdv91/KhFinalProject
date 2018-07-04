package com.kh.cat.point.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cat.point.service.PointService;

@Controller
public class PointController {

	private static final Logger logger = LoggerFactory.getLogger(PointController.class);
	@Autowired PointService pointService;

	//쿠폰샵 페이지 이동
	@RequestMapping(value="/couponShopPage")
	public String couponShopPage() {
		logger.info("쿠폰샵 페이지 요청");
		return "point/couponShop";
	}
	
	@RequestMapping(value="/couponShop")
	public @ResponseBody HashMap<String, Object> couponShop() {
		logger.info("couponShop 요청");
		return pointService.couponShopList();
	}
	
}
