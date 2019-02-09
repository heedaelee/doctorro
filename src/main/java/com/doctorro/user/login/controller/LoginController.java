package com.doctorro.user.login.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.doctorro.user.join.dto.MemberDTO;
import com.doctorro.user.join.service.JoinService;
import com.doctorro.user.login.service.LoginService;
import com.github.scribejava.core.model.OAuth2AccessToken;


@Controller
@RequestMapping(value = "/user/")
public class LoginController {
	
	// 비동기
    @Autowired
    private View jsonview;

    @Autowired
    private JoinService service;
    
    @Autowired
    private LoginService loginService;
    
    @Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
    @RequestMapping("login")
    public String index(Model model, HttpSession session) {
    	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = NaverLogin.getAuthorizationUrl(session);
        model.addAttribute("naverAuthUrl", naverAuthUrl);
        return "user.login";
    }
    
  //1.네이버 회원가입 or 로그인 (회원정보 얻기) 네이버 로그인 성공시 callback호출 메서드
  //2.DB에 email check 후 없으면 insert 있으면 security 설정의 form-login URL로 던지기. ex)login (no .htm)  
    @RequestMapping(value = "naverOauth", method= RequestMethod.GET)
    public String naverSignup(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
    	System.out.println("네이버 콜백 받음");
        OAuth2AccessToken oauthToken= NaverLogin.getAccessToken(session, code, state);
        
        //로그인 사용자 정보를 읽어온다.
        String profile = NaverLogin.getUserProfile(oauthToken);
        MemberDTO member = NaverLogin.changeData(profile);
        
        int result=0;
        result = service.emailCheck(member.getM_email());
        if(result>0) {
        	//로그인 절차 (DB에 아이디 있으면..)
        	//자바에서 url:login(security)으로 m_pwd send하기
        	model.addAttribute("m_email", member.getM_email());
        	model.addAttribute("m_pwd", member.getM_pwd());
        	return "sociallogin";
        }
        //회원가입 절차 (if not)
        //소셜 로그인일땐 패스워드 res.id나 네이버 제공 id를 패스워드 인코딩화 해서 insert
        //네이버 주는 id키 값 -> 비번 암호화
      		member.setM_pwd(bCryptPasswordEncoder.encode(member.getM_pwd()));
        service.insertUser(member);
        System.out.println("네이버 회원 가입:"+member.toString());
        return "user.index.index";
    }
    
    /* from:login.jsp
     * 하는일 :로그인 email, pwd체크
     * 파라미터:m_email,m_pwd -비동기
     * return : 성공:success, 아이디 x:idfail, 패스x:passfail 
     */
    @RequestMapping("logincheck")
    public @ResponseBody String logincheck(HttpServletRequest request,MemberDTO member, Model model) throws Exception {
    	System.out.println("로그인체크 탐");
    	String result="";
    	int emailResult=0;
    	//e메일체크
    	emailResult=service.emailCheck(member.getM_email());
    	System.out.println("메일체크한 갯수 : "+emailResult);
    	if(emailResult==0) {
    		/*model.addAttribute("result","idfail");*/
    		System.out.println(model.toString());
    		result="idfail";
    		System.out.println("result 값"+result);
    		return result;
    	}
    	else {
    		//pwd체크
    		System.out.println("pwd체크 탐");
    		result = loginService.getPass(member);
    		boolean re = bCryptPasswordEncoder.matches(member.getM_pwd(), result);
    		System.out.println("pwd체크 일치여부 :"+re);
    		if(re) {
    			/*model.addAttribute("result","success");*/
    			result="success";
    		}else {
    			/*model.addAttribute("result","passfail");*/
    			result="passfail";
    		}
    		System.out.println("result 값"+result);
    		return result;
    	}
    }
    
    @RequestMapping("test")
    public View test(String test, Model model) {
    	System.out.println("테스트 성공");
    	model.addAttribute("data", "data");
    	return jsonview;
    }
    		
    
    
    /* 트러블메이커 방식 일단 보류
     * public class naverCallback {
        @RequestMapping("naver")
        public String index(Model model) {
            return "user.callback";
        }
    }*/
    
}
