package com.doctorro.user.notice.dto;

import java.util.List;

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
	
	//사진
	private String ni_name;
	private List<String> ni_names;
	
	//태그
	private String tage_name;
	private List<String> tage_names;
	
}
