package com.kh.cat.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class StoreService {

	ArrayList<String> list = new ArrayList<String>();
	
	public HashMap<String, Object> hashTagAdd(String[] tagArr, String hTag) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(tagArr.length>=10) {
			map.put("max", true);
		}else {
			map.put("max", false);
			map.put("hTag", hTag);
			list.add(hTag);
			map.put("list", list);
		}
		return map;
	}

}
