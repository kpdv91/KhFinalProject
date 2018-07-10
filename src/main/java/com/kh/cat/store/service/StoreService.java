package com.kh.cat.store.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.dto.StoreDTO;
import com.kh.cat.store.dao.StoreInter;

@Service
public class StoreService {
	
	@Autowired SqlSession sqlSession;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	StoreInter inter;
	
	HashMap<String, String> fileList = new HashMap<String, String>();
	String storePhoto = "5413516546.jpg";

	//메뉴 사진 업로드
	public ModelAndView menuUpload(MultipartFile file, String root) {
		ModelAndView mav = new ModelAndView();
		String detailPath = "resources/upload/store/";
		String fullPath = root+detailPath;
		logger.info(fullPath);
		//1. 폴더가 없을 경우 폴더 생성
		File dir = new File(fullPath);
		if(!dir.exists()) {
			logger.info("폴더 생성");
			dir.mkdir();
		}
		//2. 파일명 추출
		String oriFileName = file.getOriginalFilename();
		//3. 새로운 파일명 생성
		String newFileName = System.currentTimeMillis()+oriFileName.substring(oriFileName.lastIndexOf("."));
		//4. 파일 추출
		try {
			byte[] bytes =  file.getBytes();//multupartFilr에서 부터 바이트 추출
			Path filePath = Paths.get(fullPath+newFileName);//파일 생성 경로
			Files.write(filePath, bytes);
			fileList.put(newFileName, oriFileName);
			logger.info("저장할 파일 갯수 : {}",fileList.size());
			mav.addObject("path",detailPath+newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("store/menuPhotoForm");
		
		return mav;
	}

	//메뉴 사진 삭제
	public HashMap<String, Integer> fileDel(String root, String fileName) {
		logger.info(fileName);
		int success = 0;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		String detailPath ="resources/upload/store/";
		String fullPath = root+detailPath+fileName;
		logger.info(fullPath);
		File file = new File(fullPath);
		if(file.exists()) {
			file.delete();
		}else {
			logger.info("이미 삭제된 사진입니다.");
		}
		if(fileList.get(fileName)!=null) {//ma에 해당 파일이 존재하면 
			fileList.remove(fileName);
			logger.info("삭제후 남은 파일 갯수 : {}", fileList.size());
			success=1;
		}
		map.put("success", success);
		System.out.println(fileList);
		return map;
	}

	//가게 등록
	@Transactional
	public HashMap<String, Object> storeRegist(String[] tagArr, HashMap<String, String> data) {
		inter = sqlSession.getMapper(StoreInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		StoreDTO dto = new StoreDTO();
		String id = "user";
		dto.setId(id);
		dto.setStore_photo(storePhoto);
		dto.setStore_name(data.get("store_name"));
		dto.setStore_ceo(data.get("store_ceo"));
		dto.setStore_phone(data.get("store_phone"));
		dto.setStore_addr(data.get("store_addr"));
		dto.setStore_food(data.get("store_food"));
		dto.setStore_price(Integer.parseInt(data.get("store_price")));
		dto.setStore_time(data.get("store_time"));
		dto.setStore_rest(data.get("store_rest"));
		inter.storeRegist(dto);//가게 등록
		for(String tag:tagArr) {
			inter.storeHashTag(dto.getStore_idx(),tag);//태그 추가
		}
		for(String file:fileList.keySet()) {
			inter.storeMenu(dto.getStore_idx(),file);//메뉴판 추가
		}
		fileList.clear();
		map.put("success", 1);
		return map;
	}

	//파일리스트 리셋
	public void menuReset() {
		fileList.clear();
	}

}
