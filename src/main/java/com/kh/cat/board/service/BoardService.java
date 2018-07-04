package com.kh.cat.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.board.dao.BoardInter;
import com.kh.cat.dto.BoardDTO;

@Service
public class BoardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	BoardInter inter;
	
	//게시판 리스트
	public @ResponseBody HashMap<String, Object> boardList() {
		logger.info("boardList 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(BoardInter.class);
		ArrayList<BoardDTO> list = inter.boardList();
		logger.info("리스트 확인 : " +list); 
		map.put("list", list);
		
		return map;
	}

	//게시판 작성
	public @ResponseBody HashMap<String, Object> boardWrite(HashMap<String, String> params) {
		logger.info("boardWrite 서비스 요청");

		HashMap<String, Object> map = new HashMap<String,Object>();
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
		
		int result = 0;
		result = inter.boardWrite(dto);
		logger.info("result check : "+result);
		
		if(result > 0) {
			map.put("success",dto.getBoard_idx());
		}
		logger.info("idx : {}", dto.getBoard_idx());
		return map;
	}

	//게시판 상세보기
	public ModelAndView boardDetail(String idx) {
		logger.info("boardDetail 서비스 요청");
		ModelAndView mav = new ModelAndView();
		
		inter = sqlSession.getMapper(BoardInter.class);
		BoardDTO dto = inter.boardDetail(idx);
		logger.info("idx : {}",idx);
		String page = "board/boardDetail";
		
		mav.addObject("dto", dto);
		mav.setViewName(page);

		return mav;
	}

	//수정 상세보기
	public ModelAndView updateForm(String idx) {
		logger.info("updateForm 서비스 요청");
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInter.class);
		BoardDTO dto = inter.boardDetail(idx);
		
		mav.addObject("dto", dto);
		mav.setViewName("board/updateForm");
		return mav;
	}

	//수정 수정하기
	public HashMap<String, Object> boardUpdate(HashMap<String, String> params) {
		logger.info("boardUpdate 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		BoardDTO dto = new BoardDTO();
		String idx = params.get("idx");
		String subject = params.get("subject");
		String content = params.get("content");
		
		logger.info("idx : {}", idx);
		logger.info("subject : {}", subject);
		logger.info("content : {}", content);
		
		dto.setBoard_idx(Integer.parseInt(idx));
		dto.setBoard_subject(subject);
		dto.setBoard_content(content);
		
		inter = sqlSession.getMapper(BoardInter.class);
		int result = 0;
		result = inter.boardUpdate(dto);
		
		if(result > 0) {
			map.put("success", dto.getBoard_idx());
		}
		return map;
	}

	public HashMap<String, Object> boardDelete(int idx) {
		logger.info("boardDelete 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		inter = sqlSession.getMapper(BoardInter.class);
		int result = 0;
		result = inter.boardDelete(idx);
		
		if(result > 0) {
			map.put("success", result);
		}
		return map;
	}

}
