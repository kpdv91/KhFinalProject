package com.kh.cat.review.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.apache.tools.ant.types.FileList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Service
public class ReviewService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	HashMap<String, String> fileList = new HashMap<String, String>();
	public ModelAndView upload(MultipartFile file, String root) {
		
		ModelAndView mav = new ModelAndView();
		String fullPath = root + "resources/upload/";
		logger.info(fullPath);
		
		File dir = new File(fullPath);
		if(!dir.exists()) {
			logger.info("폴더 없음, 생성");
			dir.mkdir();
		}
		
		//파일명 추출
		String fileName = file.getOriginalFilename();
		//새로운 파일명 생성
		String newFileName = System.currentTimeMillis()
				+ fileName.substring(fileName.lastIndexOf("."));
		
		
		//파일 추출
		try {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get(fullPath+newFileName);//파일 생성 경로
			Files.write(filePath, bytes);//파일 생성
			fileList.put(newFileName, fileName);
			logger.info("저장할 파일 갯수 : {}",fileList.size());
			mav.addObject("path","resources/upload/"+newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("review/uploadForm");
		
		return mav;
	}

}
