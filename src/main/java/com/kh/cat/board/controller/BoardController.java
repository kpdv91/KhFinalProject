package com.kh.cat.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.cat.board.service.BoardService;

@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired BoardService boardService;
	
	
	@RequestMapping(value = "/boardWritePage", method = RequestMethod.GET)
	public String boardWritePage() {
		logger.info("boardWritePage 요청");
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String boardWrite() {
		logger.info("boardWrite 페이지 요청");
		return "board/boardWrite";
	}
	
}
