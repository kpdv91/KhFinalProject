package com.kh.cat.board.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.board.dao.BoardInter;
import com.kh.cat.dto.BoardDTO;

@Service
public class BoardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	BoardInter inter;
	
	//게시판 리스트
	public ModelAndView boardList() {
		logger.info("boardList 서비스 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardList");
		return mav;
	}

	//게시판 작성
	public ModelAndView boardWrite(HashMap<String, String> params) {
		logger.info("boardWrite 서비스 요청");
		ModelAndView mav = new ModelAndView();
		
		BoardDTO dto = new BoardDTO();
		
		String cate = params.get("cate");
		String id = params.get("id");
		String subject = params.get("subject");
		String content  = params.get("content");
		
		logger.info("cate : {}", cate);
		logger.info("id : {}", id);
		logger.info("subject : {}", subject);
		logger.info("content : {}", content);
		
		dto.setBoard_cate(cate);
		dto.setId(id);
		dto.setBoard_subject(subject);
		dto.setBoard_content(content);
		
		inter = sqlSession.getMapper(BoardInter.class);
		int result = inter.boardWrite(dto);
		String page = "redirect:/boardWrite";
		
		if(result > 0) {
			page = "redirect:/boardDetail?idx="+dto.getBoard_idx();
		}
		
		logger.info("idx : {}", dto.getBoard_idx());
		/*mav.addObject("success", dto.getBoard_idx());*/
		mav.setViewName(page);
		return mav;
	}

	//게시판 상세보기
	public ModelAndView boardDetail(String idx) {
		logger.info("boardDetail 서비스 요청");
		ModelAndView mav = new ModelAndView();
		
		inter = sqlSession.getMapper(BoardInter.class);
		BoardDTO dto = inter.boardDetail(idx);
		logger.info("idx : {}",idx);
		String page = "main";
		System.out.println(page);
		
		mav.addObject("dto", dto);
		mav.setViewName(page);

		return mav;
	}

}
