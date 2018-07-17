package com.kh.cat.member.controller;

import java.util.ArrayList;
import java.util.Map;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cat.member.service.MemberService;


 
@Controller("AjaxController")
@RequestMapping(value = "/rest")
public class AjaxController {
    
    @Autowired
    MemberService service;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    //중복체크
    @RequestMapping(value="/overlay")
    public  @ResponseBody Map<String, String> 
        overlay(@RequestParam("id") String id){
        
        logger.info("중복아이디 체크 : {}",id);
        
        return service.overlay(id);
    }
    
    //ID 찾기
    @RequestMapping(value="/findId")
    public  @ResponseBody Map<String, String> 
        findId(@RequestParam("userName") String name,@RequestParam("userEmail") String email){
        
        logger.info("ID 찾기 실행  : ");
        
        return service.findId(name,email);
    }
    
    
    
}
    
/*    //회원가입
    @RequestMapping(value="/join")
    public  @ResponseBody Map<String, Integer> 
        overlay(@RequestParam Map<String, String> params){        
        logger.info("회원 가입");        
        return service.join(params);
    }*/



