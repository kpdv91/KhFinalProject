package com.kh.cat.point.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	/*//쿠폰샵 리스트
	public @ResponseBody HashMap<String, Object> couponShopList() {
		logger.info("couponShop 서비스 실행");
		inter = sqlSession.getMapper(PointInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<CouponBoxDTO> list = inter.couponShopList();
		map.put("list", list);
		return map;
	}*/

	//쿠폰 구매
	public HashMap<String, Object> couponPurchase(String price, String loginId) {
		logger.info("couponPurchase 서비스 실행");
		inter = sqlSession.getMapper(PointInter.class);
		CouponBoxDTO dto = new CouponBoxDTO();
		logger.info("세션 값 : {}", loginId);
		
		int myPoint = inter.myPoint(loginId);
		logger.info("내 포인트 : {}", myPoint);
		
		int couponPrice = Integer.parseInt(price);
		if(myPoint < couponPrice) {
			logger.info("포인트가 부족합니다.");
		}else {
			int result = inter.couponPurchase(loginId, couponPrice);
			logger.info("성공 여부 : {}", result);
			int success = inter.myCoupon(dto);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}

}
