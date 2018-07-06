package com.kh.cat.common.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.common.service.CommonService;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	@Autowired CommonService commonservice;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/search")
	public ModelAndView search(@RequestParam Map<String,String> params) {
		logger.info("검색 페이지 이동");
		logger.info("지역 : "+params.get("search_map"));
		logger.info("검색어 : "+params.get("search_content"));
		return commonservice.storeSearch(params);
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
		logger.info("보낸 메세지 확인");
		//String id = params.get("id");
		String msg= params.get("msg");
		//logger.info("id : {}",id);
		logger.info("msg : {}",msg);		
		return commonservice.sendlist(params);
	}
	@RequestMapping(value = "/sendMessage")
	public String sendMessage() {
		logger.info("메세지 보내기 페이지 이동");		
		return "timeline/timeline_sendMessage";
	}
	@RequestMapping(value = "/receivedetail")
	public ModelAndView receivedetail(@RequestParam("idx") String idx) {
		logger.info("{}번 메세지 요청",idx);
		return commonservice.receivedetail(idx);
	}
	@RequestMapping(value = "/senddetail")
	public ModelAndView senddetail(@RequestParam("idx") String idx) {
		logger.info("{}번 메세지 요청",idx);
		return commonservice.senddetail(idx);
	}
	@RequestMapping(value = "/pointlist")
	public @ResponseBody HashMap<String, Object> pointlist(@RequestParam Map<String,String> params) {
		logger.info("포인트 리스트 요청");		
		return commonservice.pointlist(params);
	}
	@RequestMapping(value = "/couponlist")
	public @ResponseBody HashMap<String, Object> cuponlist(@RequestParam Map<String,String> params) {
		logger.info("포인트 리스트 요청");		
		return commonservice.couponlist(params);
	}
	@RequestMapping(value = "/messagesendidcheck")
	public @ResponseBody HashMap<String, Object> messagesendidcheck(@RequestParam Map<String,String> params) {
		logger.info("포인트 리스트 요청");		
		return commonservice.messagesendidcheck(params);
	}
	@RequestMapping(value = "/sendmsg")
	public @ResponseBody HashMap<String, Object> sendmsg(@RequestParam Map<String,String> params) {
		logger.info("포인트 리스트 요청");		
		return commonservice.sendmsg(params);
	}
	@RequestMapping(value = "/timeline")
	public ModelAndView timeline(@RequestParam("id") String id,HttpSession session) {
		System.out.println("타임라인 요청");
		String userid=(String)session.getAttribute("loginId");
		logger.info(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("id",id);
		mav.setViewName("timeline/timeline_main");
		return mav;
	}
	@RequestMapping(value = "/maintimeline")
	public @ResponseBody HashMap<String, Object> maintimeline(@RequestParam Map<String,String> params) {
		logger.info("타임라인 메인 리뷰,좋아요,찜한가게,팔로우 목록 요청");		
		return commonservice.maintimeline(params);
	}
}
