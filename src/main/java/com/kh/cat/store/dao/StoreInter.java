package com.kh.cat.store.dao;

import java.util.ArrayList;

import com.kh.cat.dto.HashDTO;
import com.kh.cat.dto.StoreDTO;

public interface StoreInter {

	void storeRegist(StoreDTO dto);

	void storeHashTag(int store_idx, String tag);

	void storeMenu(int store_idx, String file);

	StoreDTO storeDetail(int store_idx);

	ArrayList<HashDTO> storeHash(int store_idx);

}
