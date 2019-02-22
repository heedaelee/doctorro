package com.doctorro.user.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorro.common.PagingDTO;
import com.doctorro.user.notice.dao.NoticeDao;
import com.doctorro.user.notice.dto.NoticeDto;

@Service
public class NoticeService {
	
	 @Autowired
	 private SqlSession sqlsession;

	public List<NoticeDto> getFirstList() {
		NoticeDao dao =sqlsession.getMapper(NoticeDao.class);
		List<NoticeDto> firstList= dao.getFirstList();
		return firstList;
	}
	
	public List<NoticeDto> getNoticeList(PagingDTO dto) {
		NoticeDao dao =sqlsession.getMapper(NoticeDao.class);
		List<NoticeDto> noticeList= dao.getNoticeList();
		return noticeList;
	}
	
}
