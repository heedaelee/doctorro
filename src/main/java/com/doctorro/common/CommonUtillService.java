package com.doctorro.common;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommonUtillService {

    @Autowired
    private SqlSession sqlSession;
    
    //일반인/의사 공통 비밀번호 변경
    public int passChange(HashMap<String, Object> map) {
		CommonUtillDao dao = sqlSession.getMapper(CommonUtillDao.class);
		int result = dao.passChange(map);
		return result;
	}
    
}
