package com.kh.cat.board.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.board.dao.BoardInter;

@Service
public class BoardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	BoardInter inter;
	
	public ModelAndView boardList() {
		logger.info("boardList 서비스 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardList");
		return mav;
	}

	public ModelAndView boardWrite(HashMap<String, String> params) {
		logger.info("boardWrite 서비스 요청");
		inter = sqlSession.getMapper(BoardInter.class);
		
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
