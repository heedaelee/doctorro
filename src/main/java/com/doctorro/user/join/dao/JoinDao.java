package com.doctorro.user.join.dao;

import com.doctorro.user.join.dto.MemberDTO;

public interface JoinDao {
    //닉네임체크
    public int nickCheck(String m_nick);

    //이메일 체크
    public int emailCheck(String au_email);

    //Auth테이블 회원가입
    public int insertAuth(MemberDTO auth);
    
    //시퀀스 갖고옴
    public int getSeq(String au_email);

    //User 테이블 회원 가입
    public int insertUser(MemberDTO memberDto);

    //권한 입력
    public int insertRole(String au_email);
    
}
