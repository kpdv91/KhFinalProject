package com.kh.cat.board.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cat.board.service.BoardService;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService boardService;

	//리스트 페이지 이동
	@RequestMapping(value="/boardListPage")
	public String boardListCall() {
		logger.info("리스트 페이지 요청");
		return "board/boardList";
	}
	
	// 게시판 리스트
	@RequestMapping(value = "/boardList")
	public @ResponseBody HashMap<String, Object> boardList() {
		logger.info("boardList 요청");
		return boardService.boardList();
	}

	// 게시판 작성하기 페이지 이동
	@RequestMapping(value = "/boardWritePage")
	public String boardWritePage() {
		logger.info("boardWritePage 요청");
		return "board/boardWrite";
	}
	
	// 게시판 작성하기
	@RequestMapping(value = "/boardWrite")
	public @ResponseBody HashMap<String, Object> boardWrite(@RequestParam HashMap<String, String> params) {
		logger.info("boardWrite 요청");
		return boardService.boardWrite(params);
	}

	// 게시판 상세보기
	@RequestMapping(value = "/boardDetail")
	public ModelAndView boardDetail(@RequestParam("idx") String idx) {
		logger.info("boardDetail 요청");
		logger.info("상세 보기 idx : {}", idx);
		return boardService.boardDetail(idx);
	}

	// 게시판 수정 상세보기
	@RequestMapping(value = "/updateForm")
	public ModelAndView updateForm(@RequestParam("idx") String idx) {
		logger.info("updateForm 요청");
		logger.info("idx : {}", idx);
		return boardService.updateForm(idx);
	}

	// 게시판 수정하기
	@RequestMapping(value = "/boardUpdate")
	public @ResponseBody HashMap<String, Object> boardUpdate(@RequestParam HashMap<String, String> params) {
		logger.info("boardUpdate 요청");
		return boardService.boardUpdate(params);
	}

	// 게시판 삭제하기
	@RequestMapping(value = "/boardDelete")
	public @ResponseBody HashMap<String, Object> boardDelete(@RequestParam("idx") int idx) {
		logger.info("boardDelete 요청");
		logger.info("idx : {}", idx);
		return boardService.boardDelete(idx);
	}

}
