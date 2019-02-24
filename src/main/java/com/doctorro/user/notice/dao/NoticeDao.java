package com.doctorro.user.notice.dao;

import java.util.List;

import com.doctorro.common.PagingDTO;
import com.doctorro.user.notice.dto.NoticeDto;

public interface NoticeDao {
	
	public int getTotal();
	public List<NoticeDto> getFirstList();
	public List<NoticeDto> getNoticeList(PagingDTO pagingDTO);
	public NoticeDto getView(int no_seq);
	
	public List<String> selectImg(int no_seq);
	public int updateHit(int no_seq);
	public List<String> getTage(int no_seq);
}
