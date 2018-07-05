package com.kh.cat.member.dao;

import com.kh.cat.dto.MemberDTO;

public interface MemberInter {

	String login(String id, String pw);

	int join(MemberDTO dto);//회원가입. 

	//int idcheck(String userId);//중복체크

	int chkDupId(MemberDTO dto);//중복체크

	String getAut(String aut);//권한 가져오기
	
}
