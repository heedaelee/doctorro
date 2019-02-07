package com.doctorro.user.join.dao;

import com.doctorro.user.join.dto.MemberDTO;

public interface JoinDao {
    //닉네임체크
    public int nickCheck(String m_nick);

    //이메일
    public int emailCheck(String m_email);

    //회원 가입
    public int insertUser(MemberDTO memberDto);

    //권한 입력
    public int insertRole(String m_email);
    
}
