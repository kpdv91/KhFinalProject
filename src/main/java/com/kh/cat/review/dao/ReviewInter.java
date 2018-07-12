package com.kh.cat.review.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cat.dto.ComplainDTO;
import com.kh.cat.dto.ReviewDTO;
import com.kh.cat.dto.StoreDTO;

public interface ReviewInter {

	int reviewWrite(ReviewDTO dto);

	int hashtag(String tag, int review_idx);

	int reviewPhotoWrite(int review_idx, String rePhoto);

	ArrayList<StoreDTO> storeList(String params);

	ArrayList<ReviewDTO> reviewList(HashMap<String, String> ra);

	ArrayList<ReviewDTO> reviewHash(String review_idx);

	ArrayList<ReviewDTO> reviewPhoto(String review_idx);

	void review_point(String loginId);//리뷰 작성시 50포인트

	void photoReview_point(String loginId);//리뷰 작성시 100포인트

	int review_likeCnt(int idx);//리뷰 좋아요 수

	void likePoint(String loginId);//좋아요 수 포인트

	Integer complain(ComplainDTO dto);

	Integer reviewStar(String review_idx);

	int review_delete(String review_idx);

}
