package com.kh.cat.common.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cat.dto.CouponBoxDTO;
import com.kh.cat.dto.DMDTO;
import com.kh.cat.dto.PointListDTO;
import com.kh.cat.dto.StoreDTO;

public interface CommonInter {

	ArrayList<DMDTO> receivelist(String id);

	ArrayList<DMDTO> sendlist(String id);

	DMDTO receivedetail(String idx);

	DMDTO senddetail(String idx);

	ArrayList<PointListDTO> pointlist(String id);

	String memberpoint(String id);

	ArrayList<CouponBoxDTO> couponlist(String id);

	String messagesendidcheck(String id);

	int sendmsg(String userid, String id, String content);

	ArrayList<StoreDTO> storeSearch_And(String search_map, String search_content_And);

	ArrayList<StoreDTO> storeSearch_Or(HashMap<String, Object> search_content_Map);

	int reviewtimelinecnt(String id);


}
