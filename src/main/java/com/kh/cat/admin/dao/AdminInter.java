package com.kh.cat.admin.dao;

import java.util.ArrayList;

import com.kh.cat.dto.ComplainDTO;
import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.RevPhotoDTO;
import com.kh.cat.dto.RevReplyDTO;
import com.kh.cat.dto.ReviewDTO;
import com.kh.cat.dto.StoreDTO;

public interface AdminInter {

	ArrayList<ComplainDTO> complainList();//신고리스트(관리자)

	ArrayList<StoreDTO> storeRegistList();//가게 등록 리스트(관리자)

	ArrayList<ReviewDTO> comp_reviewList(String rev_idx);//신고된 리뷰 리스트

	ArrayList<HashDTO> reviewHash(String rev_idx);//신고된 리뷰의 해시태그

	ArrayList<RevPhotoDTO> reviewPhoto(String rev_idx);//신고된 리뷰의 사진

	int blackListAdd(String complain_id);//블랙리스트 추가

	int registYes(String store_idx);//가게 등록 승인

	void regY_dm_Write(String id, String loginId);//등록 승인 시 쪽지보내기

	int regNo_dmWrite(String id, String loginId, String dm_content);//등록 거절 시 쪽지 보내기

	void storeDel(String store_idx);//등록 거절 시 삭제

	int complainDel(String rev_idx, String id);//신고 취소

	int review_del(String rev_idx);//리뷰 삭제

	int review_del_dm(String complain_id, String loginId, String dm_content);//게시물 삭제시 신고당한 사람에게 쪽지

	void review_del_dm2(String id, String loginId);//게시물 삭제시 신고한 사람에게 쪽지

	ArrayList<RevReplyDTO> comp_revReplyList(String rev_idx);//신고된 리뷰댓글 리스트

	void revReply_del_dm3(String id, String loginId);

	int complainDel2(String revReply, String id);

	int revReply_del(String revReply_idx);//댓글 삭제


	


}
