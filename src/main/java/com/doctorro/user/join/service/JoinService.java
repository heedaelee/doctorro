package com.doctorro.user.join.service;

import com.doctorro.user.join.dao.JoinDao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doctorro.user.join.dto.MemberDTO;



@Service
public class JoinService {

    @Autowired
    private SqlSession sqlSession;
    
    @Transactional(rollbackFor={Exception.class})
	public int insertUser(MemberDTO memberdto) throws Exception{
		int result = 0;
		JoinDao dao = sqlSession.getMapper(JoinDao.class);
		try{
			result = dao.insertUser(memberdto);
			//insertRole : user table에 seq키를 가져와 role insert->그냥 email값 입력하기로..
			dao.insertRole(memberdto.getM_email());
// =======================insert role 에서 시퀀스 말고 이메일로 변경해줘야 함			
			
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

	public int emailCheck(String m_email) throws Exception {
		int result = 0;
		JoinDao dao = sqlSession.getMapper(JoinDao.class);
		try{
			result = dao.emailCheck(m_email);
		}catch(Exception e) {
			System.out.println("Transaction 예외 발생" + e.getMessage());
			throw e;
		}
		return result;
	}
	
}
