package com.doctorro.user.login.dao;

import com.doctorro.user.join.dto.MemberDTO;

public interface LoginDao {
	
	//패스워드 대조
	public String getPass(MemberDTO dto);
	
}
