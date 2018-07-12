package com.kh.cat.store.dao;

import com.kh.cat.dto.StoreDTO;

public interface StoreInter {

	void storeRegist(StoreDTO dto);

	void storeHashTag(int store_idx, String tag);

	void storeMenu(int store_idx, String file);

	StoreDTO storeDetail(int store_idx);

}
