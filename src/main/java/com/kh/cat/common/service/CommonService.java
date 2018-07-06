package com.kh.cat.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.common.dao.CommonInter;
import com.kh.cat.dto.StoreDTO;

@Service
public class CommonService {
	
	@Autowired SqlSession sqlSession;	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	CommonInter inter;

	public HashMap<String, Object> receivelist(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("list", inter.receivelist(id));
		return map;	
	}

	public HashMap<String, Object> sendlist(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("list", inter.sendlist(id));
		return map;
	}

	public ModelAndView receivedetail(String idx) {
		inter = sqlSession.getMapper(CommonInter.class);
		logger.info(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("name","보낸사람");
		mav.addObject("detail",inter.receivedetail(idx));
		mav.setViewName("timeline/timeline_messagedetail");
		return mav;
	}

	public ModelAndView senddetail(String idx) {
		inter = sqlSession.getMapper(CommonInter.class);
		logger.info(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("name","받는사람");
		mav.addObject("detail",inter.senddetail(idx));
		mav.setViewName("timeline/timeline_messagedetail");
		return mav;
	}

	@Transactional
	public HashMap<String, Object> pointlist(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("memberpoint", inter.memberpoint(id));
		map.put("list", inter.pointlist(id));
		return map;
	}

	public HashMap<String, Object> couponlist(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("list", inter.couponlist(id));
		return map;
	}
	public HashMap<String, Object> messagesendidcheck(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		boolean idcheck = false;
		if(inter.messagesendidcheck(id) != null){
			idcheck=true;
		}		
		map.put("id",idcheck);
		return map;
	}
	public HashMap<String, Object> sendmsg(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userid=params.get("userid");
		String id=params.get("id");		
		String content=params.get("content");
		logger.info(userid+"/"+id+"/"+content);		
		int a = inter.sendmsg(userid,id,content);
		map.put("success",a);
		return map;
	}
	public ModelAndView storeSearch(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		String search_content = params.get("search_content");
		String search_content_And = search_content.replaceAll(" ", "%");
		String[] search_content_Split = search_content.split(" ");
		HashMap<String, Object> search_content_Map = new HashMap<String, Object>();
		search_content_Map.put("map", params.get("search_map"));
		search_content_Map.put("split", search_content_Split);
		
		ArrayList<StoreDTO> result = inter.storeSearch_And(params.get("search_map"),search_content_And);
		logger.info(result.toString());
		if(result.isEmpty()) {
			result = inter.storeSearch_Or(search_content_Map);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", result);
		mav.setViewName("include/common/search");
		return mav;
	}

}
