package com.kh.cat.admin.dao;

import java.util.ArrayList;

import com.kh.cat.dto.ComplainDTO;
import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.RevPhotoDTO;
import com.kh.cat.dto.ReviewDTO;
import com.kh.cat.dto.StoreDTO;

public interface AdminInter {

	ArrayList<ComplainDTO> complainList();//신고리스트(관리자)

	ArrayList<StoreDTO> storeRegistList();//가게 등록 리스트(관리자)

	ArrayList<ReviewDTO> comp_reviewList(String rev_idx);//신고된 리뷰 리스트

	ArrayList<HashDTO> reviewHash(String rev_idx);//신고된 리뷰의 해시태그

	ArrayList<RevPhotoDTO> reviewPhoto(String rev_idx);//신고된 리뷰의 사진

	String revWrite(String rev_idx);//리뷰 작성자 아이디

	int blackListAdd(String revWriter);//블랙리스트 추가

	


}
