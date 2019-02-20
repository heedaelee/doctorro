package com.doctorro.common.mail;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {

	@Autowired
	public MailService mailer;
	

	@RequestMapping(value = "/pwd")
	public @ResponseBody String pwd(String mailto,HashMap<String, Object> map) {
		String randomNum = mailer.sendMail(mailto,"loginfail",map);// 로그인 실패 비밀번호 찾기 메일발송
		System.out.println("randomNum>>"+randomNum);
		
		return "/WEB-INF/views/home.jsp";
	}
}
