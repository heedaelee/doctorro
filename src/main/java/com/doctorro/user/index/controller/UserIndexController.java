package com.doctorro.user.index.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doctorro.user.index.service.IndexService;
import com.doctorro.user.join.dto.MemberDTO;

@Controller
@RequestMapping(value = "/user/")
public class UserIndexController {
	
	@Autowired
	private IndexService service;
	
    @RequestMapping("index")
    public String index(Model model, Principal principal, HttpServletRequest request, HttpSession session ) {
    	//타일즈 설정
    	model.addAttribute("pageName", "main");
	    /*	유저 로그인 인증 후
	    	 param : au_email
	    	 return : dto(유저정보)	*/
    	if(principal!=null) {
			request.getSession().setAttribute("au_email",principal.getName());				
			MemberDTO userdto = new MemberDTO();
			System.out.println("로그인 후 정보 받기 : principal 받아 session에 입력한 email :"+request.getSession().getAttribute("au_email"));
			userdto = service.getUser(principal.getName());
			model.addAttribute("userdto", userdto);
			
		return "user.index.index";
	}
    	
        return "user.index.index";
    }
}
