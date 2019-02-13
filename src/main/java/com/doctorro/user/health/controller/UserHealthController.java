package com.doctorro.user.health.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doctorro.user.join.dto.MemberDTO;

@Controller
@RequestMapping(value = "/user/")
public class UserHealthController {

/*	@Autowired
	private IndexService service;*/
	
    @RequestMapping("health")
    public String userHealth(Model model, Principal principal, HttpServletRequest request ) {
    	
    	System.out.println("유저헬스 컨트롤탐");
        return "health.user";
    }
}
