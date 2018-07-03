package com.kh.cat.board.dao;

import com.kh.cat.dto.BoardDTO;

public interface BoardInter {

	BoardDTO boardDetail(String idx);

	int boardWrite(BoardDTO dto);

}
