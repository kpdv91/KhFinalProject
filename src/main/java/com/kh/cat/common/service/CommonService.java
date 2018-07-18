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

import com.kh.cat.dto.ReviewDTO;
import com.kh.cat.dto.AlarmDTO;
import com.kh.cat.dto.ComplainDTO;
import com.kh.cat.dto.DMDTO;
import com.kh.cat.dto.FollowDTO;
import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.MemberDTO;
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
	@Transactional
	public HashMap<String, Object> sendmsg(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		DMDTO dto = new DMDTO();
		String userid=params.get("userid");
		String id=params.get("id");		
		String content=params.get("content");
		dto.setId(userid);
		dto.setDm_id(id);
		dto.setDm_content(content);
		logger.info(userid+"/"+id+"/"+content);		
		int a = inter.sendmsg(dto);
		if(a>0) {
			inter.alarmdminsert(dto.getDm_idx(),id);
		}
		map.put("success",a);
		return map;
	}

	public HashMap<String, Object> maintimeline(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");		
		int a = inter.reviewtimelinecnt(id);
		int b = inter.liketimelinecnt(id);
		int c = inter.storeliketimelinecnt(id);
		int d = inter.followtimelinecnt(id);
		map.put("review",a);
		map.put("reviewlike",b);
		map.put("storelike",c);
		map.put("follow",d);
		return map;
	}

	public HashMap<String, Object> timelinereviewlist(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("list", inter.timelinereviewlist(id));
		return map;
	}

	@Transactional
	public HashMap<String, Object> followinsert(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		FollowDTO dto = new FollowDTO();
		String userid=params.get("userid");
		String id=params.get("id");
		dto.setId(userid);
		dto.setFollow_id(id);
		logger.info(userid+"/"+id+"/");		
		int a = inter.followinsert(dto);
		System.out.println("a"+a);
		System.out.println(dto.getFollow_idx());
		if(a>0) {
			inter.alarminsert(dto.getFollow_idx(),id);
		}
		map.put("success",a);
		return map;
	}

	public HashMap<String, Object> followcheck(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userid=params.get("userid");
		String id=params.get("id");
		logger.info(id);
		boolean followcheck = false;
		if(inter.followcheck(userid,id) != null){
			followcheck=true;
		}		
		map.put("id",followcheck);
		return map;
	}

	public HashMap<String, Object> followdelete(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userid=params.get("userid");
		String id=params.get("id");		
		logger.info(userid+"/"+id+"/");		
		int a = inter.followdelete(userid,id);
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
		search_content_Map.put("content", search_content_And);
		search_content_Map.put("sort", "리뷰 최신 순");
		
		ArrayList<StoreDTO> result = inter.storeSearch_And(search_content_Map);
		if(result.isEmpty()) {
			search_content_Map.put("content", search_content_Split);
			result = inter.storeSearch_Or(search_content_Map);
			if(result.isEmpty()) {
				result = inter.storeSearch_Hash(search_content_Map);
			}
		}
		
		ArrayList<ArrayList<HashDTO>> result_hash = new ArrayList<ArrayList<HashDTO>>();
		for(int i=0; i<result.size(); i++) {
			result_hash.add(inter.storeHash(result.get(i).getStore_idx()));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", result);
		mav.addObject("list_hash", result_hash);
		mav.setViewName("include/common/search");
		return mav;
	}
	
	public HashMap<String, Object> storeSearchSort(HashMap<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		logger.info("넘어온 정렬 : "+params.get("data"));
		logger.info("넘어온 검색어 : "+params.get("search_content"));
		String search_content = params.get("search_content");
		String search_content_And = search_content.replaceAll(" ", "%");
		String[] search_content_Split = search_content.split(" ");
		
		HashMap<String, Object> search_content_Map = new HashMap<String, Object>();
		search_content_Map.put("map", params.get("search_map"));
		search_content_Map.put("content", search_content_And);
		search_content_Map.put("sort", params.get("data"));
		
		ArrayList<StoreDTO> result = inter.storeSearch_And(search_content_Map);
		if(result.isEmpty()) {
			search_content_Map.put("content", search_content_Split);
			result = inter.storeSearch_Or(search_content_Map);
			if(result.isEmpty()) {
				result = inter.storeSearch_Hash(search_content_Map);
			}
		}
		
		ArrayList<ArrayList<HashDTO>> result_hash = new ArrayList<ArrayList<HashDTO>>();
		for(int i=0; i<result.size(); i++) {
			result_hash.add(inter.storeHash(result.get(i).getStore_idx()));
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", result);
		map.put("list_hash", result_hash);
		return map;
	}

	public HashMap<String, Object> timelinelikereview(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		ArrayList<Integer> review = inter.timelinereview(id);
		logger.info("review "+review.size());
		logger.info("reviewlist"+review.get(0));
		ArrayList<ArrayList<ReviewDTO>> list = new ArrayList<ArrayList<ReviewDTO>>();
		for(int i=0;i<review.size();i++) {
			list.add(inter.timelinelikereview(review.get(i)));
		}
		map.put("list",list);
		return map;
	}

	public HashMap<String, Object> timeline_reply(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		ArrayList<Integer> review = inter.my_reply(id);
		logger.info("review "+review.size());
		logger.info("reviewlist"+review.get(0));
		//ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		ArrayList<ArrayList<ReviewDTO>> list = new ArrayList<ArrayList<ReviewDTO>>();
		for(int i=0;i<review.size();i++) {
			list.add(inter.timelinelikereview(review.get(i)));
		}
		map.put("list",list);
		return map;
	}

	public HashMap<String, Object> timelinprofile(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		map.put("profile", inter.timelinprofile(id));
		return map;
	}

	public HashMap<String, Object> timelinereviewreply(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String idx=params.get("idx");
		logger.info(idx);
		map.put("replylist", inter.timelinereviewreply(idx));
		return map;
	}

	/*//관리자 신고 리스트
	public HashMap<String, Object> timeLineComplainList(Map<String, String> params) {
		logger.info("신고 리스트 서비스 요청");
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ComplainDTO> list = inter.complainList();
		map.put("list", list);
		return map;
	}

	//가게 등록 리스트(관리자)
	public HashMap<String, Object> timeLineStoreRegistList(Map<String, String> params) {
		logger.info("가게 등록 리스트 서비스 요청");
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> list = inter.storeRegistList();
		map.put("list", list);
		return map;
	}*/

	public HashMap<String, Object> reply_update(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int idx = Integer.parseInt(params.get("revreply_idx"));
		String content = params.get("content");
		logger.info(idx+"/"+content);
		int a = inter.reply_update(idx,content);
		boolean updatecheck = false;
		if(a>0){
			updatecheck=true;
		}
		map.put("update",updatecheck);
		return map;
	}

	public HashMap<String, Object> reply_delete(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int idx = Integer.parseInt(params.get("revreply_idx"));
		logger.info("idx"+idx);
		int a = inter.reply_delete(idx);
		boolean deletecheck = false;
		if(a>0){
			deletecheck=true;
		}
		map.put("del",deletecheck);
		return map;
	}

	public HashMap<String, Object> timelinelikestore(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		ArrayList<Integer> likestore = inter.likestore(id);
		logger.info("store 개수 "+likestore.size());
		logger.info("storeidx"+likestore.get(0));
		//ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		ArrayList<ArrayList<StoreDTO>> list = new ArrayList<ArrayList<StoreDTO>>();
		ArrayList<ArrayList<HashDTO>> list_hash = new ArrayList<ArrayList<HashDTO>>();
		for(int i=0;i<likestore.size();i++) {
			list.add(inter.timelinelikestore(likestore.get(i)));
			list_hash.add(inter.likestorehash(likestore.get(i)));
		}
		map.put("list",list);
		map.put("list_hash",list_hash);
		return map;
	}

	public HashMap<String, Object> timelinefollowlist(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		logger.info(id);
		ArrayList<String> followlist = inter.followlist(id);
		ArrayList<String> following = inter.following(id);
		ArrayList<ArrayList<MemberDTO>> list = new ArrayList<ArrayList<MemberDTO>>();
		ArrayList<ArrayList<MemberDTO>> listing = new ArrayList<ArrayList<MemberDTO>>();
		for(int i =0; i<followlist.size();i++) {
			list.add(inter.followlistprofile(followlist.get(i)));
		}
		for(int j =0; j<following.size();j++) {
			listing.add(inter.followingprofile(following.get(j)));
		}
		map.put("fallowlist", list);
		map.put("fallowing",listing);
		return map;
	}

	public HashMap<String, Object> alarmlist(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id=params.get("id");
		map.put("list", inter.alarmlist(id));
		return map;
	}

	public HashMap<String, Object> alarmread(Map<String, String> params) {
		inter = sqlSession.getMapper(CommonInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int idx=Integer.parseInt(params.get("idx"));
		int a = inter.alarmread(idx);
		boolean alarmread = false;
		if(a>0) {
			alarmread = true;
		}
		map.put("success", alarmread);
		return map;
	}

}
