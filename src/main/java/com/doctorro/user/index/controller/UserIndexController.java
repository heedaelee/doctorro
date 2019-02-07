package com.doctorro.user.index.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

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
    public String index(Model model, Principal principal, HttpServletRequest request ) {
    	
	    /*	유저 로그인 인증 후
	    	 param : m_email
	    	 return : dto(유저정보)	*/
    	if(principal!=null) {
			request.getSession().setAttribute("m_email",principal.getName());				
			MemberDTO dto = new MemberDTO();
			System.out.println("principal 받아 session에 입력한 email :"+request.getSession().getAttribute("m_email"));
			dto = service.getUser(principal.getName());
			model.addAttribute("dto", dto);
			//model.addAttribute("social", "no");
		return "user.index.index";
	}
    	
        return "user.index.index";
    }
}
