package com.doctorro.user.join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.http.client.AuthCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;


import com.doctorro.user.join.dto.MemberDTO;
import com.doctorro.user.join.service.JoinService;

@Controller
@RequestMapping("/user/")
public class JoinController {

    // 비동기
    @Autowired
    private View jsonview;

    @Autowired
    private JoinService service;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping("join")
    public String userJoinPage() {
        return "user.join";
    }

    @RequestMapping(value = "join", method = RequestMethod.POST)
    public @ResponseBody String userInsert(HttpServletRequest request, @Valid MemberDTO memberDTO, Model model,BindingResult bindingResult) throws Exception {
        String r = "";
        int result = 0;
        int nicResult=0;
        int emailResult=0;

        System.out.println("자료:" + memberDTO.toString());
        if (bindingResult.hasErrors()) {
            System.out.println("비유효값 입력 에러 발생");
            r = "fail";
            return r = "fail";
        }
        /*닉네임 체크*/
        nicResult = service.nickCheck(memberDTO.getM_nick());
        if(nicResult>0){
            r="DoubleNick";
            return r;
        }/*닉네임 체크 끝*/
        /*이메일 체크*/
        emailResult = service.emailCheck(memberDTO.getAu_email());
        if(emailResult>0){
            r="DoubleEmail";
            return r;
        }/*이메일 체크 끝*/
        System.out.println("이메일 중복 통과");
        //암호화
        memberDTO.setAu_pwd(bCryptPasswordEncoder.encode(memberDTO.getAu_pwd()));
        //social 간편 로그인 아닐시 so_code=1 디폴트값 넣기
        memberDTO.setSo_code(1);
        //기본 포인트 3,000점 m_point =3000점
        String m_point="3000";
        memberDTO.setM_point(m_point);
        
        try {
            result = service.insertUser(memberDTO);
            if (result > 0) {
                System.out.println("가입성공");
                r = "success";
            } else {
                System.out.println("가입실패");
                r = "fail";
            }
        } catch (Exception e) {
            System.out.println("예외발생 : " + e.getMessage());
            System.out.println("가입실패");
            r = "fail";
        }
        return r;
    }

}
