package com.kh.cat.common.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cat.common.service.CommonService;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	@Autowired CommonService commonservice;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value = "/receivelist")
	public @ResponseBody HashMap<String, Object> receivelist(@RequestParam Map<String,String> params) {
		logger.info("받은 메세지 확인");
		//String id = params.get("id");
		String msg= params.get("msg");
		//logger.info("id : {}",id);
		logger.info("msg : {}",msg);		
		return commonservice.receivelist(params);
	}
	@RequestMapping(value = "/sendlist")
	public @ResponseBody HashMap<String, Object> sendlist(@RequestParam Map<String,String> params) {
		logger.info("받은 메세지 확인");
		//String id = params.get("id");
		String msg= params.get("msg");
		//logger.info("id : {}",id);
		logger.info("msg : {}",msg);		
		return commonservice.sendlist(params);
	}
}
