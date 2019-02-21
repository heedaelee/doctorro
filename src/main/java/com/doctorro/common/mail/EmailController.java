package com.doctorro.common.mail;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {

	@Autowired
	public MailService mailer;
	
	@RequestMapping(value = "/pwd", method=RequestMethod.GET)
	public String pwdIndex(Model model) {
		System.out.println("패스워드 index 컨트롤러 탐");
		model.addAttribute("pageName", "password");
		
		return "password.user";
	}

	@RequestMapping(value = "/pwd", method=RequestMethod.POST)
	public @ResponseBody String pwd(String mailto,HashMap<String, Object> map,HttpServletRequest request) {
		System.out.println("패스워드 변경 컨트롤러 탐");
		String toPathUrl=request.getRequestURL().toString().replace(request.getServletPath(), "");
		System.out.println("path까지 url:"+toPathUrl );
		
		String randomNum = mailer.sendMail(mailto,toPathUrl,map);// 로그인 실패 비밀번호 찾기 메일발송
		System.out.println("randomNum>>"+randomNum);
		
		String result ="success";
		return result;
	}
}
