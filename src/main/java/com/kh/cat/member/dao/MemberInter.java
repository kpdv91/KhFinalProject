package com.kh.cat.member.dao;

import com.kh.cat.dto.MemberDTO;

public interface MemberInter {

	MemberDTO login(String id, String pw);

	int join(MemberDTO dto);//회원가입. 

	MemberDTO profileimg(String id);

	MemberDTO profileunder(String id);	

	String overlay(String id); //중복체크
	
}
