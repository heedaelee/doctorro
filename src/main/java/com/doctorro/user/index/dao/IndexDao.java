package com.doctorro.user.index.dao;

import com.doctorro.user.join.dto.MemberDTO;

public interface IndexDao {
	
	 //회원 선택
    public MemberDTO getUser(String au_email);

}
