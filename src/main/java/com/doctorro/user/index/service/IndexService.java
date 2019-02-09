package com.doctorro.user.index.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorro.user.index.dao.IndexDao;
import com.doctorro.user.join.dto.MemberDTO;



@Service
public class IndexService {

    @Autowired
    private SqlSession sqlSession;
    
    //인덱스에 user 정보 갖고오기(join단의 MemberDto 활용)
    public MemberDTO getUser(String m_email) {
    	MemberDTO dto;
    	IndexDao dao = sqlSession.getMapper(IndexDao.class);
    	dto=dao.getUser(m_email);
    	
    	return dto;
    }
    
}
