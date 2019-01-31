package com.doctorro.user.join.controller;

import com.doctorro.user.join.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user/")
public class JoinController {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	 @RequestMapping("join")
	    public String userJoinPage() {
	        return "user.join";
	    }
	 
	 @RequestMapping(value = "join", method = RequestMethod.POST)
	    public @ResponseBody String userInsert(HttpServletRequest request, MemberDTO memberDTO, Model model) {

		 System.out.println("자료:"+memberDTO.toString());
		 memberDTO.setM_pwd(bCryptPasswordEncoder.encode(memberDTO.getM_pwd()));

	        return "user.join";
	    }

}
