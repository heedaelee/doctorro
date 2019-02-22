package com.doctorro.user.notice.dao;

import java.util.List;

import com.doctorro.user.notice.dto.NoticeDto;

public interface NoticeDao {

	public List<NoticeDto> getFirstList();
	public List<NoticeDto> getNoticeList();
}
