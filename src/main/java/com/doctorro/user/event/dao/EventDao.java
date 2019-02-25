package com.doctorro.user.event.dao;

import java.util.List;

import com.doctorro.common.PagingDTO;
import com.doctorro.user.event.dto.EventDto;

public interface EventDao {
	
	public int getTotal();
	public List<EventDto> getEventList(PagingDTO pagingDTO);
	public EventDto getView(int ev_seq);
	
	public List<String> selectImg(int ev_seq);
	public int updateHit(int ev_seq);
	public List<String> getTag(int ev_seq);
}
