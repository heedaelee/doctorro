package com.doctorro.user.event.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorro.common.PagingDTO;
import com.doctorro.user.event.dao.EventDao;
import com.doctorro.user.event.dto.EventDto;

@Service
public class EventService {
	
	 @Autowired
	 private SqlSession sqlsession;
	
	public List<EventDto> getEventList(PagingDTO paging) {
		EventDao dao =sqlsession.getMapper(EventDao.class);
		List<EventDto> eventList= dao.getEventList(paging);
		return eventList;
	}
	
	public int getTotal() {
		EventDao dao =sqlsession.getMapper(EventDao.class);
		int total =  dao.getTotal();
		return total;
	}
	
	public EventDto getView(int ev_seq) {
		EventDao dao =sqlsession.getMapper(EventDao.class);
		EventDto eventDto = dao.getView(ev_seq);//게시물 선택
		List<String> imgList = dao.selectImg(ev_seq); //게시물 따른 사진 선택
		//리스트로 다중 row 받기
		eventDto.setEi_names(imgList);
		dao.updateHit(ev_seq);//조회수
		
		return eventDto;
	}
	
	
}
