package com.doctorro.user.join.service;

import com.doctorro.user.join.dao.JoinDao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorro.user.join.dto.MemberDTO;



@Service
public class JoinService {

    @Autowired
    private SqlSession sqlSession;
    
	public int insertUser(MemberDTO memberdto) throws Exception{
		int result = 0;
		int au_seq = 0;
		JoinDao dao = sqlSession.getMapper(JoinDao.class);
		try{
			//1. insertAuth에 email pwd등 authDTO 입력
			dao.insertAuth(memberdto);
			System.out.println(memberdto.getAu_email());
			//2. 시퀀스 갖고옴 
			au_seq =dao.getSeq(memberdto.getAu_email());
			System.out.println(au_seq);
			memberdto.setAu_seq(au_seq);
			//3. user table 입력
			result = dao.insertUser(memberdto);
		}catch(Exception e) {
			System.out.println("Transaction 예외 발생" + e.getMessage());
			throw e; 
		}
		return result;
	}

	public int nickCheck(String m_nick) throws Exception{
    	int result = 0;
		JoinDao dao = sqlSession.getMapper(JoinDao.class);
		try{
			result = dao.nickCheck(m_nick);
		}catch(Exception e) {
			System.out.println("Transaction 예외 발생" + e.getMessage());
			throw e;
		}
    	return result;
	}

	public int emailCheck(String au_email) throws Exception {
		int result = 0;
		JoinDao dao = sqlSession.getMapper(JoinDao.class);
		try{
			result = dao.emailCheck(au_email);
		}catch(Exception e) {
			System.out.println("Transaction 예외 발생" + e.getMessage());
			throw e;
		}
		return result;
	}
	
}
