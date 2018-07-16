package com.kh.cat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cat.admin.dao.AdminInter;
import com.kh.cat.dto.ComplainDTO;
import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.RevPhotoDTO;
import com.kh.cat.dto.ReviewDTO;
import com.kh.cat.dto.StoreDTO;

@Service
public class AdminService {
	
	@Autowired SqlSession sqlSession;	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	AdminInter inter;
	
	//신고 리스트
	public HashMap<String, Object> ComplainList(HashMap<String, String> params) {
		logger.info("신고 리스트 서비스 요청");
		inter = sqlSession.getMapper(AdminInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ComplainDTO> list = inter.complainList();
		map.put("list", list);
		return map;
	}

	//가게 등록 리스트
	public HashMap<String, Object> StoreRegistList(HashMap<String, String> params) {
		logger.info("가게 등록 리스트 서비스 요청");
		inter = sqlSession.getMapper(AdminInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> list = inter.storeRegistList();
		map.put("list", list);
		return map;
	}
	
	//블랙리스트 추가
	public HashMap<String, Object> blackListAdd(HashMap<String, String> params) {
		logger.info("블랙리스트 추가 서비스 실행");
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(AdminInter.class);
		String rev_idx = params.get("rev_idx");
		String revReply_idx = params.get("revReply_idx");
		
		logger.info("리뷰 idx : "+rev_idx+" / "+"리뷰 댓글 idx : "+revReply_idx);
		
	
		String revWriter = inter.revWriter(rev_idx);//리뷰 작성자 아이디 조회 쿼리문
		logger.info("리뷰 작성자 : {}", revWriter);
		int result = inter.blackListAdd(revWriter);
		if(result > 0) {
			map.put("result", result);
			map.put("msg", "블랙리스트 추가 완료");
			logger.info("블랙리스트 추가(리뷰) 여부 : {}", result);
		}
		
		
		
		
		return map;
	}

	//신고된 리뷰리스트
	public HashMap<String, Object> complain_reviewList(HashMap<String, String> params) {
		logger.info("신고된 리뷰 서비스 요청");
		
		String rev_idx = params.get("rev_idx");
		String revReply_idx = params.get("revReply_idx");
		
		logger.info("리뷰 idx : {}", rev_idx);
		logger.info("리뷰 idx : {}", revReply_idx);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(AdminInter.class);
		ArrayList<ReviewDTO> list = inter.comp_reviewList(rev_idx);
		map.put("list", list);
		return map;
	}

	//신고된 리뷰 해시, 사진
	public HashMap<String, Object> reviewHashPhoto(HashMap<String, String> params) {
		logger.info("리뷰 해시태그,사진 서비스 실행");
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(AdminInter.class);
		String rev_idx = params.get("rev_idx");
		logger.info("리뷰 idx : {}", rev_idx);
		ArrayList<HashDTO> hashList =  inter.reviewHash(rev_idx);
		ArrayList<RevPhotoDTO> photoList = inter.reviewPhoto(rev_idx);
		 
		map.put("hash", hashList);
		map.put("photo", photoList);
		return map;
	}

	//가게 등록 승인
	public HashMap<String, Object> registYes(HashMap<String, String> params, String loginId) {
		logger.info("가게 등록 승인 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(AdminInter.class);
		
		String store_idx = params.get("store_idx");
		String id = params.get("id");
		
		int result = inter.registYes(store_idx);
		if(result > 0) {
			inter.regY_dm_Write(id, loginId);
			map.put("msg", "승인 완료");
		}
		
		return map;
	}

	//가게 등록 거절
	public HashMap<String, Object> registNo(HashMap<String, String> params, String loginId) {
		logger.info("가게 등록 거절 서비스");
		
		String store_idx = params.get("store_idx");
		String id = params.get("id");
		String dm_content = params.get("dm_content");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(AdminInter.class);
		//id = 받는사람, loginId = 보내는사람, dm_content = 쪽지 내용
		int result = inter.regNo_dmWrite(id, loginId, dm_content);
		if(result > 0) {
			inter.storeDel(store_idx);
			map.put("msg", "등록 취소 완료");
		}
		
		return map;
	}

	//신고 취소
	public HashMap<String, Object> comp_cancel(HashMap<String, String> params) {
		logger.info("신고 취소 서비스 실행");
		
		String rev_idx = params.get("rev_idx");
		String revReply_idx = params.get("revReply_idx"); 
		String id = params.get("id");
		
		logger.info("리뷰 idx : "+rev_idx+" / "+"리뷰댓글 idx : "+revReply_idx+" / "+"신고한 아이디 : "+id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(AdminInter.class);
		
		//리뷰 신고 내역 삭제
		if(rev_idx !=null && revReply_idx == null) {
			int result = inter.complainDel(rev_idx, id);
			if(result > 0) {
				map.put("result", result);
				map.put("msg", "신고 취하 완료");
			}
		}
		
		return map;
	}//이재욱 키 150cm

	

}
