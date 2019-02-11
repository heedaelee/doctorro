package com.doctorro.user.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
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
    
    //구글 소셜 로그인 
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
 
    private OAuth2Operations oauthOperations;
	
    @RequestMapping("login")
    public String index(Model model, HttpSession session) {
    	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = NaverLogin.getAuthorizationUrl(session);
        model.addAttribute("naverAuthUrl", naverAuthUrl);
        
        /* 구글 인증 URL 생성 위해*/
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        String url = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        System.out.println("/googleLogin, url : " + url);
        model.addAttribute("google_url", url);
        
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
        Map<String, String> naver = new HashMap<String, String>();
        
        //기존 아이디 값 저장(암호화 전 값으로 추후 시큐리티 로그인 비교하게..)
        String id = "";
        id=member.getM_pwd();
        
        if(result>0) {
        	//로그인 절차 (DB에 아이디 있으면..)
        	//login 뷰페이지에서 login메서드로 로그인 하기
        	System.out.println("네이버 로그인 절차 탐");
        	
        	naver.put("m_email", member.getM_email());
        	naver.put("m_pwd", member.getM_pwd());
        	
        	model.addAttribute("naver", naver);
        	return "user.login";
        }
        //회원가입 절차 (if not)
        //소셜 로그인일땐 패스워드 res.id나 네이버 제공 id를 패스워드 인코딩화 해서 insert
        //네이버 주는 id키 값 -> 비번 암호화
      	member.setM_pwd(bCryptPasswordEncoder.encode(member.getM_pwd()));
        service.insertUser(member);
        System.out.println("네이버 회원 가입:"+member.toString());
        System.out.println("네이버 로그인 절차 탐");
    	
    	naver.put("m_email", member.getM_email());
    	naver.put("m_pwd", id);
    	
    	model.addAttribute("naver", naver);
        return "user.login";
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
    			result="success";
    		}else {
    			result="passfail";
    		}
    		System.out.println("result 값"+result);
    		return result;
    	}
    }
    
    /* from:login.jsp
     * 하는일 :kakao 회원가입
     * 파라미터:m_email,m_pwd,m_nickname,선택: m_gender,m_iamge -비동기
     * return : - 
     */
    @RequestMapping("kakaojoin")
    public View kakaojoin(MemberDTO member,Model model) throws Exception {
    	System.out.println("카카오 join controller 입장");
    	member.setSo_code(3); //카카오 3
    	//카카오 id 값
    	String kakaoId="";
    	kakaoId = member.getM_pwd();
    	
    	//회원가입 절차 
        //소셜 로그인일땐 패스워드는  카카오 제공 id를 패스워드 인코딩화 해서 insert
        //카카오 주는 id키 값 -> 비번 암호화
      	member.setM_pwd(bCryptPasswordEncoder.encode(member.getM_pwd()));
        service.insertUser(member);
        System.out.println("카카오 회원 가입:"+member.toString());
        model.addAttribute("m_email", member.getM_email());
        model.addAttribute("m_pwd", kakaoId);
    	return jsonview;
    }
    
// ------------------------------------ 구글 콜백 ----------------------------------------
    
    @RequestMapping(value = "/googleSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String doSessionAssignActionPage(Model model,HttpServletRequest request, MemberDTO member) throws Exception {
 
        String code = request.getParameter("code");
 
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),null);
 
        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
 
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
 
        }
 
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google googleApi = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
        System.out.println(connection);
 
        PlusOperations plusOperations = googleApi.plusOperations();
        Person profile = plusOperations.getGoogleProfile();
        
        //위까지가 필수, 아래는 받은 데이터 사용=================================
        
        System.out.println("User Uid : " + profile.getId());
        System.out.println("User Name : " + profile.getDisplayName());
        System.out.println("User Email : " + profile.getAccountEmail());
        System.out.println("User Profile : " + profile.getImageUrl());
        
        member.setM_pwd(profile.getId());
        member.setM_email(profile.getAccountEmail());
        member.setSo_code(4); //4.google 소셜코드
        if(profile.getDisplayName()!=null && profile.getDisplayName()!="") {
        	member.setM_nick(profile.getDisplayName());
        }
        
        int result=0;
        result = service.emailCheck(member.getM_email());
        Map<String, String> google = new HashMap<String, String>();
        
        //기존 아이디 값 저장(암호화 전 값으로 추후 시큐리티 로그인 비교하게..)
        String id = "";
        id=member.getM_pwd();
        
        if(result>0) {
        	//로그인 절차 (DB에 아이디 있으면..)
        	//user.login 뷰페이지에서 login메서드로 로그인 하기
        	System.out.println("구글 로그인 절차 탐");
        	
        	
        	google.put("m_email", member.getM_email());
        	google.put("m_pwd", member.getM_pwd());
        	
        	model.addAttribute("google", google);
        	return "user.login";
        }
        //회원가입 절차 (if not)
        //소셜 로그인일땐 패스워드 구글 제공 id를 패스워드 인코딩화 해서 insert
        //구글이 주는 id키 값 -> 비번 암호화
      	member.setM_pwd(bCryptPasswordEncoder.encode(member.getM_pwd()));
        service.insertUser(member);
        System.out.println("구글 회원 가입:"+member.toString());
        System.out.println("구글 로그인 절차 탐");
    	
    	google.put("m_email", member.getM_email());
    	google.put("m_pwd", id);
    	
    	model.addAttribute("google", google);
        return "user.login";
        
        //[백업] Access Token 취소 소스. 
        /*try {
            System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
 
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
        } catch (Exception e) {
 
            e.printStackTrace();
        }*/
 
    }
    
    
    //test
    @RequestMapping("test")
    public View test(String test, Model model) {
    	System.out.println("테스트 성공");
    	model.addAttribute("data", "data");
    	return jsonview;
    }
    
}
