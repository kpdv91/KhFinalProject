package com.kh.cat.point.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public HashMap<String, Object> couponPurchase(String price, String name, String loginId) {
		logger.info("couponPurchase 서비스 실행");
		inter = sqlSession.getMapper(PointInter.class);
		CouponBoxDTO dto = new CouponBoxDTO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//쿠폰코드 랜덤으로 섞기
		int certNumLength = 6;
		Random random = new Random(System.currentTimeMillis());
		int range = (int) Math.pow(10, certNumLength);
		int trim = (int) Math.pow(10, certNumLength-1);
		int code = random.nextInt(range)+trim;
		if(code > range) {
			code = code - trim;
		}
		
		java.sql.Date today = new java.sql.Date(new java.util.Date().getTime());
		logger.info("현재시간 : {}", today);
		int a =0;
		logger.info("랜덤 코드 : {}",code);
		dto.setCouponBox_code(code);
		dto.setId(loginId);
		dto.setCouponBox_price(Long.parseLong(price));
		dto.setCouponBox_name(name);
		dto.setCouponBox_use(a);
		
		/*int code[] = {1,2,3,4,5,6};
		int random_code[] = shuffle(code);//맨 아래 메소드
		logger.info("코드번호 : {}", random_code);

		/*private int couponBox_code;
		private String id;
		private long couponBox_price;
		private String couponBox_name;
		private Date couponBox_date;
		private int couponBox_use;*/
		
		
		int myPoint = inter.myPoint(loginId);
		logger.info("내 포인트 : {}", myPoint);
		
		int couponPrice = Integer.parseInt(price);
		if(myPoint < couponPrice) {
			logger.info("포인트가 부족합니다.");
			map.put("msg", "포인트가 부족합니다.");
		}else {
			int result = inter.couponPurchase(loginId, couponPrice);
			logger.info("쿠폰 구매 성공 여부 : {}", result);
			int success = inter.myCoupon(dto);
			logger.info("쿠폰함 추가 성공 여부 : {}", success);
		}
		return map;
	}

	
	//코드번호 랜덤으로 섞기
	/*private static int[] shuffle(int[] code) {
		 for(int x=0;x<code.length;x++){
		      int i = (int)(Math.random()*code.length);
		      int j = (int)(Math.random()*code.length);
		            
		      int tmp = code[i];
		      code[i] = code[j];
		      code[j] = tmp;
		    }
		return code;
	}*/

}
