package com.kh.cat.member.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cat.member.service.OverlayService;

@Controller("restController")    //컨트롤러 명 지정
@RequestMapping(value = "/rest") // 컨트롤러의 위치를 정해줍니다. 
public class RestController {
 
    @Autowired
    OverlayService service;
 
    private Logger logger = LoggerFactory.getLogger(this.getClass());
 
    // 중복확인(이메일)
    @RequestMapping(value = "/emailAuth")
    public @ResponseBody Map<String, String> emailAuth(@RequestParam("email") String email) {
        return service.emailAuth(email);
    }
 
}
