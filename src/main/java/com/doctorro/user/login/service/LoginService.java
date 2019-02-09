package com.doctorro.user.login.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorro.user.join.dto.MemberDTO;
import com.doctorro.user.login.dao.LoginDao;


@Service
public class LoginService {

    @Autowired
    private SqlSession sqlSession;
    
    public String getPass(MemberDTO dto) {
    	String result="";
    	LoginDao dao = sqlSession.getMapper(LoginDao.class);
    	//패스워드(암호화) 리턴
    	result=dao.getPass(dto);
    	
    	return result;
    }

    
}
