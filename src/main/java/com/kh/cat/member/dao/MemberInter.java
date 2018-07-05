package com.kh.cat.member.dao;

import com.kh.cat.dto.MemberDTO;

public interface MemberInter {

	String login(String id, String pw);

	int join(MemberDTO dto);//회원가입. 
	
}
