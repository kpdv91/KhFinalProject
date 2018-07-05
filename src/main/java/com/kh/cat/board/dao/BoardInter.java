package com.kh.cat.board.dao;

import java.util.ArrayList;

import com.kh.cat.dto.BoardDTO;

public interface BoardInter {

	BoardDTO boardDetail(String idx);

	int boardWrite(BoardDTO dto);

	int boardUpdate(BoardDTO dto);

	int boardDelete(int idx);

	ArrayList<BoardDTO> boardList();

}
