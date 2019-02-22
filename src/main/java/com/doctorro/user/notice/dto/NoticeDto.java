package com.doctorro.user.notice.dto;

import lombok.Data;

@Data
public class NoticeDto {

	private int no_seq;
	private int au_seq;
	private int t_seq;
	private int ni_seq;
	private String no_title;
	private String no_content;
	private String no_regdate;
	private String no_isFirst;
	private String hit;
}
