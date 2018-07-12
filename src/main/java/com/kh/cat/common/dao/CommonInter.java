package com.kh.cat.common.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cat.dto.ComplainDTO;
import com.kh.cat.dto.CouponBoxDTO;
import com.kh.cat.dto.DMDTO;
import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.PointListDTO;
import com.kh.cat.dto.RevReplyDTO;
import com.kh.cat.dto.ReviewDTO;
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

	ArrayList<StoreDTO> storeSearch_And(HashMap<String, Object> search_content_AndMap);

	ArrayList<StoreDTO> storeSearch_Or(HashMap<String, Object> search_content_OrMap);

	ArrayList<StoreDTO> storeSearch_Hash(HashMap<String, Object> search_content_Hash);
	
	int reviewtimelinecnt(String id);

	int liketimelinecnt(String id);

	int storeliketimelinecnt(String id);

	int followtimelinecnt(String id);

	ArrayList<ReviewDTO> timelinereviewlist(String id);

	int followinsert(String userid, String id);

	String followcheck(String userid, String id);

	int followdelete(String userid, String id);

	ArrayList<Integer> timelinereview(String id);

	ArrayList<ReviewDTO> timelinelikereview(Integer integer);

	ArrayList<Integer> my_reply(String id);

	Object timelinprofile(String id);

	ArrayList<HashDTO> storeHash(int store_idx);

	ArrayList<RevReplyDTO> timelinereviewreply(String idx);


	ArrayList<ComplainDTO> complainList();//신고 리스트(관리자)

	ArrayList<StoreDTO> storeRegistList();//가게 등록 리스트(관리자)

	int reply_update(int idx, String content);

	int reply_delete(int idx);


}
