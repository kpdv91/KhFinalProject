package com.kh.cat.point.dao;

import com.kh.cat.dto.CouponBoxDTO;

public interface PointInter {

	/*ArrayList<CouponBoxDTO> couponShopList();*/
	
	//쿠폰가격
	int couponPrice(String code);
	
	//내 포인트
	int myPoint(String loginId);

	//쿠폰 구매
	int couponPurchase(String loginId, int couponPrice);

	int myCoupon(CouponBoxDTO dto);


}
