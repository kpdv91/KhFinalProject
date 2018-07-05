package com.kh.cat.point.service;

import java.util.ArrayList;
import java.util.HashMap;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cat.dto.CouponBoxDTO;
import com.kh.cat.point.dao.PointInter;

@Service
public class PointService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SqlSession sqlSession;
	PointInter inter;
	
	//쿠폰샵 리스트
	public @ResponseBody HashMap<String, Object> couponShopList() {
		logger.info("couponShop 서비스 실행");
		inter = sqlSession.getMapper(PointInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<CouponBoxDTO> list = inter.couponShopList();
		map.put("list", list);
		return map;
	}

}
