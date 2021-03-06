/*
 * @Class : KakaoLogin
* @ Date : 2018.11.01
* @ Author : 임효진
* @ Desc : Login 위한것, 스프링 사용으로 직접 로그인 하지않고 아마도 성공시 처리할 서비스
*/
package com.doctorro.user.login.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.doctorro.user.join.dto.MemberDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;



public class NaverLogin {
    /* 인증 요청문을 구성하는 파라미터 */
    //client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
    //response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
    //redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
    //state: 애플리케이션이 생성한 상태 토큰
    private final static String CLIENT_ID = "sLKp6zrzm0kadWwbPdE0";       //네이버API Client ID
    private final static String CLIENT_SECRET = "tdZ_zbdG1u";                      
    /*private final static String REDIRECT_URI = "http://localhost:8080/doctorro/user/naverOauth";*/
    private final static String REDIRECT_URI = "http://dev.rsad.co.kr/doctorro/user/naverOauth";
    private final static String SESSION_STATE = "oauth_state";
    /* 프로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";/// Api 종류 기본 !!
    
    /* 네이버 아이디로 인증  URL 생성  Method */
    public static String getAuthorizationUrl(HttpSession session) {

        /* 세션 유효성 검증을 위하여 난수를 생성 */
        String state = generateRandomString();
        /* 생성한 난수 값을 session에 저장 */
        setSession(session,state);        

        /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
        OAuth20Service oauthService = new ServiceBuilder()                                                 
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
                .build(NaverLoginApi.instance());

        return oauthService.getAuthorizationUrl();
    }

    /* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
    public static OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{

        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        if(StringUtils.pathEquals(sessionState, state)){

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }

    /* 세션 유효성 검증을 위한 난수 생성기 */
    private static String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    /* http session에 데이터 저장 */
    private static void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }

    /* http session에서 데이터 가져오기 */ 
    private static String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public static String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(NaverLoginApi.instance());

            OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
    
    public static MemberDTO changeData(String profile) throws JsonProcessingException, IOException {
    	MemberDTO member = new MemberDTO();
    	 
		// JSON 형태 반환값 처리
		ObjectMapper mapper = new ObjectMapper();
		JsonNode properties = mapper.readTree(profile);
		JsonNode response = properties.get("response");
		if (response.has("id")) {
			member.setSo_code(2); // 일반회원 :1, 네이버:2, 카카오:3, 구글:4
			member.setAu_email(response.get("email").asText());
			member.setAu_pwd(response.get("id").asText());
			if(response.hasNonNull("nickname")) {
				member.setM_nick(response.get("nickname").asText());
			}
			if(response.hasNonNull("profile_image")) {
				member.setM_img(response.get("profile_image").asText());
			}
			/* age (10-20)일단 보류
			 * if(response.hasNonNull("age")) {
				member.setM_nick(response.get("age").asText());
			}*/
			/* name (이희대)일단 보류
			 * if(response.hasNonNull("name")) {
				member.setM_nick(response.get("age").asText());
			}*/
		}
		return member;
	}

    
    
    

    
}