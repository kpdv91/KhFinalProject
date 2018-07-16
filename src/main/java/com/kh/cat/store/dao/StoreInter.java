package com.kh.cat.store.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.MenuDTO;
import com.kh.cat.dto.StoreDTO;

public interface StoreInter {

	void storeRegist(StoreDTO dto);

	void storeHashTag(int store_idx, String tag);

	void storeMenu(int store_idx, String file);

	StoreDTO storeDetail(int store_idx);

	ArrayList<HashDTO> storeHash(int store_idx);

	ArrayList<MenuDTO> menuPhoto(int store_idx);

	String storeLikeChk(String loginId, int store_idx);

	void storeLike(String loginId, String store_idx);

	void storeLikeDel(String loginId, String store_idx);

	void storeLikeCntUp(String store_idx);

	void storeLikeCntDown(String store_idx);

	int storeLikeCnt(String store_idx);

}
