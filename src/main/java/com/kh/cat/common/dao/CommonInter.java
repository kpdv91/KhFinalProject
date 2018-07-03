package com.kh.cat.common.dao;

import java.util.ArrayList;

import com.kh.cat.dto.DMDTO;

public interface CommonInter {

	ArrayList<DMDTO> receivelist(String id);

	ArrayList<DMDTO> sendlist(String id);

}
