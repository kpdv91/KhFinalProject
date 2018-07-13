package com.kh.cat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cat.admin.dao.AdminInter;
import com.kh.cat.common.dao.CommonInter;
import com.kh.cat.dto.ComplainDTO;
import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.RevPhotoDTO;
import com.kh.cat.dto.ReviewDTO;
import com.kh.cat.dto.StoreDTO;
import com.kh.cat.review.dao.ReviewInter;

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
		inter = sqlSession.getMapper(AdminInter.class);
		String rev_idx = params.get("rev_idx");
		String revReply_idx = params.get("revReply_idx");
		
		logger.info("리뷰 idx : "+rev_idx+" / "+"리뷰 댓글 idx : "+revReply_idx);
		
	
		String revWriter = inter.revWrite(rev_idx);//리뷰 작성자 아이디 조회 쿼리문
		logger.info("리뷰 작성자 : {}", revWriter);
		int result = inter.blackListAdd(revWriter);
		logger.info("블랙리스트 추가(리뷰) 여부 : {}", result);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
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

	

}
