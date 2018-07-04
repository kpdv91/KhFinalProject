package com.kh.cat.review.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.ibatis.session.SqlSession;
import org.apache.tools.ant.types.FileList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.dto.ReviewDTO;
import com.kh.cat.review.dao.ReviewInter;


@Service
public class ReviewService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired SqlSession sqlSession;
	ReviewInter inter;
	
	
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
	public HashMap<String, Integer> fileDel(String root, String fileName) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = 0;
		String fullPath = root + "resources/upload/"+fileName;
		File file = new File(fullPath);
		if(file.exists()) {
			logger.info("삭제할 파일이 존재 : "+file);
			file.delete();
		}else {
			logger.info("이미 삭제된 사진");
		}
		if(fileList.get(fileName) != null) {
			fileList.remove(fileName);//리스트 삭제
			logger.info("삭제 후 남은 파일 갯수 : {}",fileList.size());
			success = 1;
		}
		map.put("success", success);
		return map;
	}
	public ModelAndView write(ArrayList<String> hash_tag, ArrayList<String> review_photo, HashMap<String, String> map) {

		logger.info("리뷰 작성 서비스 도착");
		
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/reviewWritePage";
		ReviewDTO dto = new ReviewDTO();
		dto.setReview_storeName(map.get("review_storeName"));
		logger.info(map.get("review_storeName"));
		dto.setId(map.get("id"));
		logger.info(map.get("id"));
		dto.setReview_star(Double.parseDouble(map.get("star-input")));
		logger.info(""+Double.parseDouble(map.get("star-input")));
		dto.setReview_content(map.get("review_content"));
		logger.info(map.get("review_content"));
		
		logger.info("리뷰 작성 slq 시작");
		inter = sqlSession.getMapper(ReviewInter.class);
		if(inter.reviewWrite(dto) == 1) {
			System.out.println(dto.getReview_idx());
			if(hash_tag.size() > 0) {
				for(int i=0; i<hash_tag.size(); i++) {
					String tag = hash_tag.get(i);
					int success = inter.hashtag(tag,dto.getReview_idx());
				}
			}
			if(review_photo.size() > 0) {
				for(int i=1; i<review_photo.size();i++) {
					String rePhoto = review_photo.get(i);
					int result = inter.reviewPhotoWrite(dto.getReview_idx(),rePhoto);
				}
			}
		}
		mav.setViewName("review/reviewList");
		return mav;
	}
	public HashMap<String, Object> revStoreSearch(String params) {
		
		logger.info("가게 검색 리스트 요청");
		inter = sqlSession.getMapper(ReviewInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", inter.storeList(params));
		
		return map;
	}

}
