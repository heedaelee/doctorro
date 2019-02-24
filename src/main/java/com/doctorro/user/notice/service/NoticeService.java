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
	
	public List<NoticeDto> getNoticeList(PagingDTO paging) {
		NoticeDao dao =sqlsession.getMapper(NoticeDao.class);
		List<NoticeDto> noticeList= dao.getNoticeList(paging);
		return noticeList;
	}
	public int getTotal() {
		NoticeDao dao =sqlsession.getMapper(NoticeDao.class);
		int total =  dao.getTotal();
		return total;
	}
	
	public NoticeDto getView(int no_seq) {
		NoticeDao dao =sqlsession.getMapper(NoticeDao.class);
		NoticeDto noticeDto = dao.getView(no_seq);//게시물 선택
		List<String> imgList = dao.selectImg(no_seq); //게시물 따른 사진 선택
		//리스트로 다중 row 받기
		noticeDto.setNi_names(imgList);
		dao.updateHit(no_seq);//조회수
		
		List<String> tageList = dao.getTage(no_seq);//태그 가져오기
		noticeDto.setTage_names(tageList);
		
		return noticeDto;
	}
	
}
