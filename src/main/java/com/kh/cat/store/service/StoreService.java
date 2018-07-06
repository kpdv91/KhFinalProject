package com.kh.cat.store.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Service
public class StoreService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	HashMap<String, String> fileList = new HashMap<String, String>();
	
	/*public HashMap<String, Object> hashTagAdd(String[] tagArr, String hTag) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(tagArr.length>=10) {
			map.put("max", true);
		}else {
			map.put("max", false);
			map.put("hTag", hTag);
		}
		return map;
	}*/

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

}
