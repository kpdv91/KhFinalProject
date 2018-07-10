package com.kh.cat.member.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cat.member.dao.MemberInter;

@Service
public class OverlayService {
 
    @Autowired
    SqlSession sqlSession;
 
    private Logger logger = LoggerFactory.getLogger(this.getClass());
 
    MemberInter inter = null;
 
// 이메일 중복확인
    public Map<String, String> emailAuth(String email) {
        Map<String, String> jsonObj = new HashMap<String, String>();
 
        inter = sqlSession.getMapper(MemberInter.class);
        String emailAuth = inter.emailAuth(email);
 
        if (emailAuth != null) {
            jsonObj.put("chk", "-1");
        } else {
            jsonObj.put("chk", "1");
        }
        return jsonObj;
    }
    
}
